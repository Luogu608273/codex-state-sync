#!/usr/bin/env python3
"""Rebuild local chat metadata; never resume a conversation or run a model."""
import argparse
import datetime
import hashlib
import json
import os
from pathlib import Path
import queue
import re
import shutil
import sqlite3
import subprocess
import threading
import time


def read_names(root):
    path = root / 'session_index.jsonl'
    if not path.exists():
        return {}
    rows = [json.loads(s) for s in path.read_text(encoding='utf-8-sig').splitlines() if s.strip()]
    names = {}
    for row in sorted(rows, key=lambda x: str(x.get('updated_at', ''))):
        title = row.get('thread_name')
        tid = row.get('id', '')
        if re.fullmatch(r'[0-9a-fA-F-]{36}', tid) and isinstance(title, str) and title.strip():
            names[tid] = title
    return names


def connect_readonly(path):
    return sqlite3.connect(path.resolve().as_uri() + '?mode=ro', uri=True, timeout=10)


def state_database(root):
    paths = list(root.glob('state_*.sqlite'))
    paths.sort(key=lambda p: int(re.search(r'state_(\d+)', p.name)[1]), reverse=True)
    for path in paths:
        with connect_readonly(path) as db:
            if db.execute("SELECT 1 FROM sqlite_master WHERE type='table' AND name='threads'").fetchone():
                return path
    return None


def session_hashes(root):
    return {str(p.relative_to(root)): hashlib.sha256(p.read_bytes()).hexdigest()
            for folder in ('sessions', 'archived_sessions')
            for p in (root / folder).rglob('*')
            if p.is_file() and (p.name.endswith('.jsonl') or p.name.endswith('.jsonl.zst'))}


def backup(root, destination):
    destination.mkdir(parents=True)
    for path in list(root.glob('state_*.sqlite')) + [root / 'sqlite' / 'codex-dev.db']:
        if not path.exists():
            continue
        target = destination / path.relative_to(root)
        target.parent.mkdir(parents=True, exist_ok=True)
        src = connect_readonly(path)
        dst = sqlite3.connect(str(target))
        try:
            src.backup(dst, pages=256, sleep=0.05)
        finally:
            src.close()
            dst.close()
    path = root / 'session_index.jsonl'
    if path.exists():
        shutil.copy2(str(path), str(destination / path.name))


class AppServer:
    def __init__(self, executable, root):
        env = os.environ.copy()
        env['CODEX_HOME'] = str(root)
        self.process = subprocess.Popen([str(executable), 'app-server'], cwd=str(root), env=env,
                                        stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        self.queue = queue.Queue()
        self.sequence = 0
        self.error_tail = []

        def receive():
            for line in self.process.stdout:
                try:
                    self.queue.put(json.loads(line))
                except ValueError:
                    pass

        def drain():
            for line in self.process.stderr:
                self.error_tail.append(line.decode('utf-8', 'replace')[:300])
                self.error_tail = self.error_tail[-5:]

        threading.Thread(target=receive, daemon=True).start()
        threading.Thread(target=drain, daemon=True).start()

    def initialize(self):
        self.call('initialize', {'clientInfo': {'name': 'filesync_chat_restore', 'version': '3.0.0'}})
        self.process.stdin.write(b'{"method":"initialized","params":{}}\n')
        self.process.stdin.flush()

    def call(self, method, params):
        self.sequence += 1
        seq = self.sequence
        data = {'id': seq, 'method': method, 'params': params}
        self.process.stdin.write((json.dumps(data, ensure_ascii=False) + '\n').encode('utf-8'))
        self.process.stdin.flush()
        deadline = time.monotonic() + 30
        while time.monotonic() < deadline:
            if self.process.poll() is not None and self.queue.empty():
                raise RuntimeError('Codex app-server 已提前退出；请检查客户端安装和 config.toml。')
            try:
                reply = self.queue.get(timeout=0.25)
            except queue.Empty:
                continue
            if reply.get('id') == seq:
                if 'error' in reply:
                    raise RuntimeError(str(reply['error']))
                return reply.get('result', {})
        raise TimeoutError(method + ' 超时')

    def close(self):
        try:
            self.process.stdin.close()
        except OSError:
            pass
        try:
            self.process.wait(timeout=5)
        except subprocess.TimeoutExpired:
            self.process.terminate()
            self.process.wait(timeout=5)


def find_codex(explicit=None):
    if explicit:
        candidates = [Path(explicit)]
    else:
        base = Path(os.environ.get('LOCALAPPDATA', '')) / 'OpenAI' / 'Codex' / 'bin'
        candidates = sorted(base.glob('*/codex.exe'), key=lambda p: p.stat().st_mtime, reverse=True)
        found = shutil.which('codex.exe') or shutil.which('codex')
        if found:
            candidates.append(Path(found))
    for path in candidates:
        try:
            result = subprocess.run([str(path), '--version'], stdout=subprocess.PIPE,
                                    stderr=subprocess.PIPE, timeout=8)
            if result.returncode == 0 and b'codex' in result.stdout.lower():
                return path
        except (OSError, subprocess.TimeoutExpired):
            pass
    raise RuntimeError('未找到可运行的 Codex 引擎。请先安装并启动一次 Codex，或指定 --codex-exe。')


def indexed_ids(root):
    path = state_database(root)
    if path is None:
        return set()
    with connect_readonly(path) as db:
        return {row[0] for row in db.execute('SELECT id FROM threads')}


def apply_names(root, names):
    path = state_database(root)
    if path is None:
        raise RuntimeError('Codex 未生成聊天索引；原文件保留，请检查客户端版本。')
    with sqlite3.connect(str(path), timeout=10) as db:
        columns = {row[1] for row in db.execute('PRAGMA table_info(threads)')}
        fields = [name for name in ('title', 'name') if name in columns]
        if not fields:
            raise RuntimeError('当前聊天数据库结构不支持标题恢复，未写入标题。')
        assignment = ', '.join(field + '=?' for field in fields)
        for tid, title in names.items():
            db.execute('UPDATE threads SET ' + assignment + ' WHERE id=?', [title] * len(fields) + [tid])
        for tid, title in db.execute('SELECT id,' + fields[0] + ' FROM threads'):
            if tid in names and title != names[tid]:
                raise RuntimeError('聊天标题校验失败，事务已回滚。')
    with connect_readonly(path) as db:
        if db.execute('PRAGMA quick_check').fetchone()[0] != 'ok':
            raise RuntimeError('聊天数据库完整性检查失败，请保留备份。')
    cache = root / 'sqlite' / 'codex-dev.db'
    cache_count = 0
    if cache.exists():
        with sqlite3.connect(str(cache), timeout=10) as db:
            tables = {row[0] for row in db.execute("SELECT name FROM sqlite_master WHERE type='table'")}
            if 'local_thread_catalog' in tables:
                # Only the local host; remote catalogs can belong to other installations.
                rows = list(db.execute('SELECT host_id,thread_id,display_title FROM local_thread_catalog'))
                for host, tid, old_title in rows:
                    if host == 'local' and tid in names and old_title != names[tid]:
                        db.execute('UPDATE local_thread_catalog SET display_title=? WHERE host_id=? AND thread_id=?',
                                   (names[tid], host, tid))
                        cache_count += 1
                if cache_count and 'local_thread_catalog_metadata' in tables:
                    db.execute('UPDATE local_thread_catalog_metadata SET catalog_revision=catalog_revision+1 WHERE id=1')
    return cache_count


def restore(root, executable):
    root = Path(root).resolve()
    names = read_names(root)
    hashes = session_hashes(root)
    if not hashes:
        raise RuntimeError('未找到 .jsonl 或 .jsonl.zst 聊天文件；请先下载。')
    destination = root / '.filesync-chat-backups' / datetime.datetime.now().strftime('%Y%m%d-%H%M%S-%f')
    backup(root, destination)
    print('原索引已备份：' + str(destination), flush=True)
    api = AppServer(executable, root)
    read_errors = []
    try:
        api.initialize()
        for archived in (False, True):
            cursor = None
            seen_cursors = set()
            while True:
                params = {'limit': 100, 'archived': archived, 'sourceKinds': ['vscode', 'cli'],
                          'modelProviders': [], 'useStateDbOnly': False}
                if cursor:
                    params['cursor'] = cursor
                result = api.call('thread/list', params)
                cursor = result.get('nextCursor')
                if not cursor:
                    break
                if cursor in seen_cursors:
                    raise RuntimeError('索引扫描游标重复，停止操作。')
                seen_cursors.add(cursor)
        for tid in sorted(set(names) - indexed_ids(root)):
            try:
                api.call('thread/read', {'threadId': tid, 'includeTurns': False})
            except RuntimeError:
                read_errors.append(tid)
    finally:
        api.close()
    cache_count = apply_names(root, names)
    after = session_hashes(root)
    if hashes != after:
        raise RuntimeError('操作期间聊天文件发生变化；请关闭正在写入聊天的应用后重试，备份在 ' + str(destination))
    ids = indexed_ids(root)
    report = {'indexed': len(ids), 'titles_restored': len(set(names) & ids),
              'missing_title_ids': sorted(set(names) - ids), 'cache_titles_updated': cache_count,
              'session_files': len(hashes), 'session_bytes_unchanged': True,
              'read_errors': read_errors, 'backup': str(destination)}
    (destination / 'report.json').write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps(report, ensure_ascii=False))
    if report['missing_title_ids']:
        print('部分记录未被当前引擎识别，详情见 report.json；没有改写会话 ID 或正文。')
    print('聊天索引和已有原始标题恢复完成。重新打开 Codex 刷新侧栏；归档记录仍留在归档中。')
    return report


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--root', required=True)
    parser.add_argument('--codex-exe')
    args = parser.parse_args()
    restore(args.root, find_codex(args.codex_exe))


if __name__ == '__main__':
    try:
        main()
    except Exception as error:
        print('恢复停止：' + str(error))
        raise SystemExit(1)

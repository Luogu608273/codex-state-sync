thread_id: 01a1a414-4975-7c33-80ad-a44c9a087bd5
updated_at: 2026-11-23T12:41:48+00:00
rollout_path: \\?\C:\Users\605\.codex\sessions\2026\11\19\rollout-2026-11-19T22-06-40-01a1a414-4975-7c33-80ad-a44c9a087bd5_01a1f421-86a4-7263-a765-c0fa95224105.jsonl
cwd: \\?\C:\Users\605\Documents\Codex\2026-11-04\cong
git_branch: main

# FileSync 在线同步范围核查，并修复 `.rmp` 强制同步问题

Rollout context: 工作目录为 `C:\Users\605\Documents\Codex\2026-11-04\cong`，实际工具位于 `C:\Users\605\Documents\FileSync`。

## Task 1: 核查 Codex 在线模式是否漏同步文件

Outcome: success

Key steps:
- 检查 `sync.ps1`、`codex-state.ps1` 和 `.codex/.gitignore`。
- 确认 Codex 正在运行或使用 `-NonInteractive` 时，`Sync` 会转为 `Push`：只导出并上传本机内容，不下载、合并或覆盖本地活动文件。
- 在线和离线使用相同的同步排除范围；在线模式不会额外漏掉某一类普通文件。

Reusable knowledge:
- Codex 同步会保留/上传聊天记录、附件、配置、规则、技能、项目等允许范围，以及记忆、偏好和工具快照导出物。
- 两种模式都排除认证凭据（如 `auth.json`、`cap_sid`）、SQLite 数据库及 WAL/SHM、`.git`、系统技能、缓存，以及 `.in`、`.exe` 文件。
- 记忆和部分设置不是直接同步原始运行数据，而是通过 `Export-MemorySnapshot`、偏好导出等快照机制同步。
- `Save-Changes` 会记录文件大小和修改时间；如果备份期间文件被移动或仍在写入，会中止本轮提交/上传，避免产生不一致快照。

References:
- `sync.ps1`：运行中 Codex 的判断和在线模式转换位于约 456–465 行。
- 关键提示：`在线备份模式：导出记忆并上传本机文件；本轮不下载或覆盖正在使用的文件。`

## Task 2: 将指定 `memory.rmp` 从 FileSync 同步范围中排除

Outcome: success

Preference signals:
- 用户要求“下面那个 `.rmp` 尝试忽略”，并要求文件保留原位；类似大文件处理应优先修改同步规则，不移动或删除用户原文件。

Key steps:
- 发现 `memory.rmp` 为 `217,797,719` 字节（约 208 MiB），仓库 `.gitignore` 已通过 `*.[rR][mM][pP]` 忽略且未被 Git 跟踪，但 FileSync 对 Documents 使用强制 `git add -A -f`，因此普通 Git 忽略不足以阻止大小检查。
- 在 `Get-DocumentsExclusions` 中加入大小写不敏感的 `.rmp` 排除，并在 Documents 的提交流程中将其从索引移除、从强制添加和状态检查中排除。
- 首轮回归测试发现 managed ignore block 不稳定；随后修改 `Update-InstallerIgnore`，先清理旧的 `.rmp`/扩展名管理块并稳定重建，测试通过。
- 安装到正式 `C:\Users\605\Documents\FileSync\sync.ps1`，通过 PowerShell AST 解析、目标路径排除检查及 `git check-ignore` 验证。
- 更新 `README.md`、新增回归测试 `tool-tests/test-rmp-exclusions-20261123.ps1`，并重新生成/校验 `FileSync.zip` 及备用输出包。

Reusable knowledge:
- FileSync 的强制添加路径必须在工具自己的 `Get-DocumentsExclusions`、`Test-DocumentsExcludedPath` 和提交/状态命令中显式排除文件；仅修改仓库 `.gitignore` 不够。
- `.rmp` 排除规则大小写不敏感，覆盖强制暂存、100 MiB 检查和下载前状态检查；本地文件仍保留。
- 最终验证输出：`FILESYNC EXCLUSION PASS: 2026-11-13/d-2/work/memory-20261121/memory.rmp`，并显示 `.gitignore:2:*.[rR][mM][pP]`。
- 回归测试最终输出 `PASS Documents tracked removal, forced add, local preservation, case-insensitivity and pull status`、`PASS Codex skills...`、`ExclusionRegression=PASS`。

Failures and how to do differently:
- 初次测试因 `Update-InstallerIgnore -Paths @()` 没有重建包含当前排除项的 managed block，报 `ignore block is not stable`；后续改为传入 `Get-DocumentsExclusions` 并稳定清理/重建 managed block。以后修改排除规则时应同时测试幂等性和重复运行结果。

References:
- 正式工具：`C:\Users\605\Documents\FileSync\sync.ps1`
- 目标文件：`2026-11-13/d-2/work/memory-20261121/memory.rmp`
- 回归脚本：`C:\Users\605\Documents\FileSync\tool-tests\test-rmp-exclusions-20261123.ps1`
- 发布包：`outputs/FileSync.zip`，ZIP 内容读取和 `testzip()` 均通过。

thread_id: 01a12397-d9bd-7500-bd9c-9381d3ab30c3
updated_at: 2026-10-14T04:18:41+00:00
rollout_path: \\?\C:\Users\605\.codex\sessions\2026\10\10\rollout-2026-10-10T10-48-06-01a12397-d9bd-7500-bd9c-9381d3ab30c3_01a123b5-e771-7b91-813b-5faa0006920c.jsonl
cwd: \\?\C:\Users\605\Documents\Codex\MAA Arknights Assistant!
git_branch: main

# 为项目新增 MAA 自动战斗与低频 ADB 观察技能

Rollout context: 用户要求学习 MAA Python 接口，重点自动作战，并使用 adb.exe 连接 MuMu 观察明日方舟，同时降低截图频率并写入 skill。工作目录为 `C:\Users\605\Documents\Codex\MAA Arknights Assistant!`。

## Task 1: 学习并写入 MAA 自动战斗技能

Outcome: success

Preference signals:
- 用户明确要求“截图频率不要那么高”并要求“同样写入 skill” -> 后续应将低频、关键节点截图和可复用操作写入项目技能，而不是只在本轮临时遵守。
- 用户要求重点学习“自动作战相关” -> 技能应区分 `Copilot`（作业部署/技能操作）与 `Fight`（游戏内代理刷关），并记录次数、助战、编队和资源消耗边界。

Key steps:
- 查阅官方集成、Copilot schema、回调协议、Python 示例以及 v6.18.0 `CopilotTask.cpp`。
- 核实本机环境：MAA 位于 `D:\MAA-Arknights-Assistant`，核心版本 `v6.18.0`；Python 包为 `Python\asst\asst.py`；Python SDK 只读加载成功。
- 核实 ADB：`C:\Program Files\YXArkNights-12.0\shell\adb.exe`，设备 `127.0.0.1:16384` 状态为 `device`，游戏包为 `com.hypergryph.arknights`。
- 新增 `.agents/skills/maa-battle/`，包含 `SKILL.md`、Python/Copilot 参考、ADB 观察参考、UI metadata，以及 `maa_probe.py` 和 `adb_observe.py`。
- 仅截取并查看一张 1280×720 PNG；未启动作战、未发送点击或输入操作。
- 验证技能：修正 UTF-8 导致的初次 validator `UnicodeDecodeError` 后，`quick_validate.py`、参考代码 AST 解析和本地链接检查均通过。

Reusable knowledge:
- Python SDK 的基本顺序是 `Asst.load()` → 创建实例/回调 → `connect()` → `append_task()` → `start()` → 轮询 `running()` 并消费回调；不要把 `start()` 成功或 `AllTasksCompleted` 直接当作通关证据。
- `Copilot` 使用作业 JSON；`Fight` 使用游戏内代理。`filename` 与 `copilot_list` 二选一，`loop_times` 只适用于单文件模式；`formation` 会修改编队，`support_unit_usage` 仅在自动编队时生效。
- MAA 自动战斗官方前提包括稳定至少 60 FPS，以及 Minitouch、MaaTouch 或 MuMu 触控增强；本轮未验证帧率和触控性能。
- ADB 观察脚本使用 `exec-out screencap -p`，按设备持久化至少 30 秒冷却、拒绝覆盖已有文件，并在状态未变化时跳过截图；该限制只约束助手主动观察，不改变 MAA 内部识别频率。

Failures and how to do differently:
- 首次运行 skill validator 因 Windows 默认 GBK 读取 UTF-8 `SKILL.md` 失败；使用 `python -X utf8` 重跑后通过。未来验证含中文技能时显式使用 UTF-8。

References:
- 技能入口：`.agents/skills/maa-battle/SKILL.md`
- 观察脚本：`.agents/skills/maa-battle/scripts/adb_observe.py`
- SDK 探针：`.agents/skills/maa-battle/scripts/maa_probe.py`
- 诊断截图：`data/observations/arknights-2026-10-10.png`
- 验证输出：`Skill is valid!`、`Reference Python examples parse OK`、`Local skill reference links OK`

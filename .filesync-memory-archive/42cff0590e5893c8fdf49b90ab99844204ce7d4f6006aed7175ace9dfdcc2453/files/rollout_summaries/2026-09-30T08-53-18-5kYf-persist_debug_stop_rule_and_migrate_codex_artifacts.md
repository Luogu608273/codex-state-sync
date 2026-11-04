thread_id: 01a0f184-ab47-7b92-81fe-2d65c1d6977f
updated_at: 2026-11-03T00:55:13+00:00
rollout_path: \\?\C:\Users\605\.codex\sessions\2026\10\21\rollout-2026-10-21T12-18-53-01a0f184-ab47-7b92-81fe-2d65c1d6977f_01a15cae-f9b6-72a1-b647-fadb21eb1e7e.jsonl
cwd: \\?\C:\Users\605\Documents\Codex\MAA OI Assistant!
git_branch: main

# 持久化用户规则并整理构建产物

Rollout context: 主要在 Windows PowerShell 下维护 Codex 全局/项目 AGENTS.md，并整理 `C:\Users\605\Documents\Codex` 中的 `.in` 和 `.exe` 文件。

## Task 1: 写入调试行为规则

Outcome: success

Preference signals:
- 用户明确要求：“如果在调试代码时发现做法不正确，报告做法不正确，然后停止调试” -> 调试时确认原思路错误后，只报告原因或反例并立即停止，不继续改代码、不换思路、不提供完整修正版；该要求优先于此前“debug 提供完整代码”的规则。

Key steps:
- 检查项目规则文件位置后，将规则写入 `C:\Users\605\Documents\Codex\MAA OI Assistant\AGENTS.md`。
- 写入后重新读取验证，`rg` 定位到第 16 行；Git diff 显示 2 行新增。

Failures and how to do differently:
- rollout cwd 是带感叹号的 `MAA OI Assistant!`，但实际存在的 AGENTS.md 是不带感叹号的 `MAA OI Assistant`；开始读取带感叹号路径失败。未来应先确认当前项目目录和规则文件的真实路径，避免修改相似但不同的项目。

Reusable knowledge:
- 该项目已有“debug 发现错误时给出完整代码”的规则，因此新增停止规则必须明确说明优先级，避免冲突。

References:
- 规则原文：`调试代码时，一旦确认做法不正确，应明确报告“做法不正确”，指出具体错误原因或反例，然后立即停止调试；不继续修改代码，不更换做法，也不提供完整修正版，等待用户下一步要求。`

## Task 2: 迁移 Codex 下的 `.in` 和 `.exe`

Outcome: success

Preference signals:
- 用户要求 `.in` 和 `.exe` 不要放在 Codex 文件夹，而放到 `文档/Output`，并检查现有文件 -> 未来编译产物、测试数据和中间文件统一放入 `C:\Users\605\Documents\Output`，不要放在 Codex 及其子目录。

Key steps:
- 扫描 `C:\Users\605\Documents\Codex`，发现 303 个文件：204 个 `.in`、99 个 `.exe`，共 317,665,659 bytes。
- 保留原目录层级，迁移到 `C:\Users\605\Documents\Output\Codex`；生成迁移清单 `C:\Users\605\Documents\Output\文件迁移清单-2026-10-29-399d3501.csv`。
- 每个文件先记录 SHA256，移动后逐项校验；303/303 verified，0 failed。
- 复查显示 Codex 下剩余 `.in/.exe` 为 0，清单 303 项且目标均有效。

Failures and how to do differently:
- 首次迁移脚本因扫描期间遇到已不存在的目录而失败：`Cannot find path '...MAA Arknights Assistant!\data\maa-probe-2026-10-10'`。后续脚本对消失目录容错并重新扫描成功。

Reusable knowledge:
- 对跨项目批量迁移，应跳过 reparse point，并容忍扫描过程中目录消失；保留相对路径可避免同名冲突。
- 用户已要求全局规则记录该文件放置约束。

References:
- 全局规则：`.in` 输入文件和 `.exe` 可执行文件统一放在 `C:/Users/605/Documents/Output`，不要在 `C:/Users/605/Documents/Codex` 及其子目录中创建或存放。
- 验证结果：`Planned=303, Verified=303, Failed=0, InCount=204, ExeCount=99, REMAINING=0, INVALID_DESTINATIONS=0`。

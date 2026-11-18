thread_id: 01a0f184-ab47-7b92-81fe-2d65c1d6977f
updated_at: 2026-11-18T00:02:31+00:00
rollout_path: \\?\C:\Users\605\.codex\sessions\2026\10\21\rollout-2026-10-21T12-18-53-01a0f184-ab47-7b92-81fe-2d65c1d6977f_01a15cae-f9b6-72a1-b647-fadb21eb1e7e.jsonl
cwd: C:\Users\605\Documents\Codex\MAA OI Assistant!
git_branch: main

# 持久化用户规则、整理构建产物并定位训练记录

Rollout context: 主要工作目录为 `C:\Users\605\Documents\Codex\MAA OI Assistant!`，但实际项目规则文件后来确认位于不带感叹号的 `C:\Users\605\Documents\Codex\MAA OI Assistant\AGENTS.md`；全局规则位于 `C:\Users\605\.codex\AGENTS.md`。

## Task 1: 持久化调试、码风、云端代码与备份偏好

Outcome: success

Preference signals:

- 用户要求 `[debug]` 时“还要给出完整代码”，同时坚持最小幅度修改、不改变原思路。
- 用户要求“编写代码时学习我的码风”，即沿用其实际命名、排版、模板、数据结构和实现习惯，不做无关的现代化改写。
- 用户说明代码文件夹在 Google 云端硬盘 `云端硬盘/CKK`；应通过已连接的 Google Drive 工具读取后再声称参考，不能把它当作本地路径。
- 用户要求 Git 已接入时，未被 `.gitignore` 忽略的文件默认无需额外备份。

Key steps:

- 将完整调试代码规则和码风规则写入项目 `AGENTS.md`。
- 将 `云端硬盘/CKK` 的访问约束写入项目规则。
- 将 Git/`.gitignore` 备份偏好写入全局 `C:\Users\605\.codex\AGENTS.md`。
- 前两次项目规则修改创建了备份，之后用户明确要求 Git 管理且未忽略的文件默认不备份。

Reusable knowledge:

- 项目训练规则覆盖中文回答、竞赛 C++ 风格、最小修改、完整修正版、逐步教学、训练记录和 Output 目录约束。
- 全局规则与项目规则分开：通用偏好放 `.codex\AGENTS.md`，信息学训练规则放具体训练项目 `AGENTS.md`。

References:

- `C:\Users\605\Documents\Codex\MAA OI Assistant\AGENTS.md`
- `C:\Users\605\.codex\AGENTS.md`
- 规则备份示例：`outputs\规则修改备份\2026-10-21-debug-full-code-0e7a4fac\AGENTS.md.bak`

## Task 2: 迁移 `.in` 和 `.exe` 文件

Outcome: success

Preference signals:

- 用户要求 `.in` 和 `.exe` 不放在 Codex 文件夹，而统一放到 `文档/Output`，并检查现有文件后迁移。

Key steps:

- 扫描 `C:\Users\605\Documents\Codex`（跳过重解析点），发现 303 个文件：204 个 `.in`、99 个 `.exe`，共 317,665,659 字节。
- 保留原目录层级，移动到 `C:\Users\605\Documents\Output\Codex`，避免同名覆盖。
- 为每个文件计算 SHA-256，移动后验证哈希和源文件消失。
- 全部 303 个文件验证成功，失败 0；二次扫描确认 Codex 内剩余 0 个 `.in/.exe`。
- 写入全局规则：编译产物、测试数据和测试中间文件统一放 `C:/Users/605/Documents/Output`，不得放入 Codex 及其子目录。

Failures and how to do differently:

- 首次迁移脚本因 Codex 下存在已消失目录 `MAA Arknights Assistant!\data\maa-probe-2026-10-10` 而失败；后续脚本对扫描期间消失的目录显式跳过并记录，最终成功。

References:

- 迁移清单：`C:\Users\605\Documents\Output\文件迁移清单-2026-10-29-399d3501.csv`
- 验证结果：`Planned=303, Verified=303, Failed=0, InCount=204, ExeCount=99, Remaining=0`

## Task 3: 停止错误做法的调试规则

Outcome: success

Preference signals:

- 用户明确要求：“如果在调试代码时发现做法不正确，报告做法不正确，然后停止调试。”这覆盖继续修改、换方案和提供完整修正版的行为。

Key steps:

- 将规则写入实际项目文件 `C:\Users\605\Documents\Codex\MAA OI Assistant\AGENTS.md` 第 16 行附近。
- 规则明确：确认做法错误后报告具体原因或反例，立即停止，不继续修改、不更换做法、不提供完整修正版，等待用户下一步要求。

Failures and how to do differently:

- 用户环境上下文带有感叹号目录，但该目录不存在 `AGENTS.md`；通过搜索确认实际规则文件在不带感叹号的目录后才完成写入。未来应先核实当前路径和实际生效的规则文件，不要只依赖 rollout cwd。

References:

- 精确规则：`调试代码时，一旦确认做法不正确，应明确报告“做法不正确”，指出具体错误原因或反例，然后立即停止调试；不继续修改代码，不更换做法，也不提供完整修正版。`

## Task 4: 查询做题记录清单

Outcome: success

Key steps:

- 初次命令因未设置有效 `workdir` 导致 Windows 错误 `目录名称无效。`；改用 `workdir=C:\Users\605\Documents\Codex` 后成功搜索。
- 确认主清单为 `C:\Users\605\Documents\Codex\MAA OI Assistant\outputs\训练记录.md`，另有 `outputs\训练档案.md` 和 `outputs\复盘\` 下的单题复盘。
- 清单包含日期、题号/链接、结果、用时、完成方式、卡点、复盘位置和重做结果。

References:

- 查看链接：`C:/Users/605/Documents/Codex/MAA OI Assistant/outputs/训练记录.md`
- 训练真相来源：`outputs/训练记录.md`、`outputs/训练档案.md`、`outputs/复盘/`；用户反馈 AC、编译/静态/随机测试和官方 AC 需区分。

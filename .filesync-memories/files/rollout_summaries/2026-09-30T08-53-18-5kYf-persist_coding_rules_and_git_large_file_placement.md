thread_id: 01a0f184-ab47-7b92-81fe-2d65c1d6977f
updated_at: 2026-11-23T12:44:53+00:00
rollout_path: \\?\C:\Users\605\.codex\sessions\2026\10\21\rollout-2026-10-21T12-18-53-01a0f184-ab47-7b92-81fe-2d65c1d6977f_01a15cae-f9b6-72a1-b647-fadb21eb1e7e.jsonl
cwd: C:\Users\605\Documents\Codex\MAA OI Assistant!
git_branch: main

# 持久化用户规则、整理文件位置并更新 Git 忽略配置

Rollout context: 主要在 `C:\Users\605\Documents\Codex` 及其 OI 训练项目中操作，用户要求将调试、码风、文件存放和 Git 相关偏好写入规则，并实际整理文件。

## Task 1: 更新项目调试与编码规则

Outcome: success

Preference signals:
- 用户要求“[debug]时还要给出完整代码。写入。”，表示调试时需要说明错误、保持最小修改和原思路，并提供完整修正版。
- 用户要求“如果在调试代码时发现做法不正确，报告做法不正确，然后停止调试”，表示一旦确认算法/做法错误，应报告具体原因或反例并立即停止，不继续修改或给完整修正版。
- 用户要求“编写代码时学习我的码风”，表示应主动沿用用户实际代码的命名、排版、模板、数据结构和实现习惯，避免无关现代化改写。
- 用户说明代码文件夹在“云端硬盘/CKK”，表示需要码风参考时应通过已连接的 Google Drive 实际读取，不把它当作本地路径，也不能声称读取过未读取的代码。

Key steps:
- 在项目 `C:\Users\605\Documents\Codex\MAA OI Assistant\AGENTS.md` 中写入调试和码风规则。
- 在同一项目规则中记录 Google Drive `云端硬盘/CKK` 作为代码参考位置。
- 曾修改带感叹号目录的项目文件，但后续确认实际规则文件是无感叹号目录中的 `MAA OI Assistant\AGENTS.md`。

Failures and how to do differently:
- 初次检查错误地访问了 `MAA OI Assistant!\AGENTS.md`；未来应先用 `rg --files -g AGENTS.md` 确认实际规则文件路径。

Reusable knowledge:
- 项目实际生效的 AGENTS 文件为 `C:\Users\605\Documents\Codex\MAA OI Assistant\AGENTS.md`。

References:
- 新规则核心内容：确认做法不正确时，报告原因或反例，然后停止调试，不再修改或给出完整修正版。

## Task 2: 迁移 Codex 下的 `.in` 和 `.exe` 文件

Outcome: success

Key steps:
- 扫描 `C:\Users\605\Documents\Codex`，找到 303 个文件：204 个 `.in`、99 个 `.exe`，总计 317,665,659 bytes。
- 保留原目录层级，移动到 `C:\Users\605\Documents\Output\Codex`。
- 每个文件移动后做 SHA256 和源路径不存在校验。
- 最终 303/303 verified，失败 0；Codex 树下剩余 0 个 `.in`/`.exe`。
- 在全局 `C:\Users\605\.codex\AGENTS.md` 写入：`.in`、`.exe` 和编译/测试产物统一放到 `C:/Users/605/Documents/Output`，不要放在 Codex 下。

Failures and how to do differently:
- 第一次迁移脚本因扫描过程中遇到已消失目录而失败；改为跳过不存在目录后成功。

References:
- 清单：`C:\Users\605\Documents\Output\文件迁移清单-2026-10-29-399d3501.csv`

## Task 3: 迁移大文件并保留原路径

Outcome: partial

Key steps:
- 发现 `memory.rmp` 位于 `C:\Users\605\Documents\Codex\2026-11-13\d-2\work\memory-20261121`，大小 217,797,719 bytes（约 208 MiB）。
- 尝试移动到 `C:\Users\605\Documents\Output\Codex\2026-11-13\d-2\work\memory-20261121` 并建立原路径链接。

Failures and how to do differently:
- 文件符号链接创建失败：`Administrator privilege required for this operation`；文件已恢复原处。
- 目录链接方案被执行策略拒绝：`blocked by policy`。最终未迁移，原文件仍完整保留在原路径。
- 未能完成“迁移但保留原路径可用”；未来应先确认管理员权限/链接策略，再尝试迁移。

References:
- 原文件：`C:\Users\605\Documents\Codex\2026-11-13\d-2\work\memory-20261121\memory.rmp`

## Task 4: 防止大文件进入 Git

Outcome: success

Key steps:
- 检查发现 `memory.rmp` 尚未被 Git 跟踪；另发现 `C:\Users\605\Documents\Codex\2026-11-05\b-n\work\scan.json`，大小 103,357,739 bytes。
- 修改仓库根目录 `C:\Users\605\Documents\Codex\.gitignore`，加入 `*.[rR][mM][pP]` 和 `/2026-11-05/b-n/work/scan.json`。
- `scan.json` 已从 Git index 移除但本地文件保留；`memory.rmp` 未被跟踪。
- 在原目录创建 `迁移说明.md`，记录迁移失败原因、目标位置和 Git 忽略状态。
- `git check-ignore` 验证通过；尚未创建 Git commit。

Reusable knowledge:
- 普通 `git add` 不会加入上述两个大文件，但 `git add -f` 可绕过忽略规则。
- 用户偏好：已接入 Git 且未被 `.gitignore` 忽略的文件，默认不额外备份。

References:
- 忽略文件：`C:\Users\605\Documents\Codex\.gitignore`
- 迁移说明：`C:\Users\605\Documents\Codex\2026-11-13\d-2\work\memory-20261121\迁移说明.md`
- 验证结果：`check-ignore` 命中；`scan.json` 已执行 `git rm --cached`，本地文件仍存在。

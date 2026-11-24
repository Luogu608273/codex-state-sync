thread_id: 01a20679-d5d0-7981-8530-5f7caacf4dbf
updated_at: 2026-11-23T03:37:17+00:00
rollout_path: C:\Users\605\.codex\sessions\2026\11\23\rollout-2026-11-23T11-36-17-01a20679-d5d0-7981-8530-5f7caacf4dbf.jsonl
cwd: \\?\C:\Users\605\Documents\Codex\MAA Arknights Assistant
git_branch: main

# 分析 MAA 如何接管已有肉鸽探索

Rollout context: 用户在 `C:\Users\605\Documents\Codex\MAA Arknights Assistant` 中询问如何让 MAA 从已有肉鸽局面继续推进，而不是重新开始。环境为 Windows PowerShell；本机 MAA 安装目录为 `D:\MAA-Arknights-Assistant`。

## Task 1: 从中途接管已有肉鸽探索

Outcome: partial

Preference signals:

- 用户明确纠正：“不用看 maa-battle 了，这里面只有自动作战” -> 类似问题应直接查找自动肉鸽/集成战略的 GUI、资源和源码，不要继续依赖仅覆盖普通自动战斗的技能文档。
- 用户进一步明确：“已有探索会直接放弃。我如何让它从中途启动” -> 用户关心的是保留当前存档并从已有探索继续，不是一般的自动肉鸽启动说明；回答必须区分“继续当前探索”和“重新开始/放弃探索”。

Key steps:

- 检查了 `D:/MAA-Arknights-Assistant/resource/tasks/Roguelike` 下的主题资源及 `RoguelikeTask.cpp`。
- 源码显示 `RoguelikeTask::set_params()` 将任务入口设为 `<theme>@Roguelike@Begin`；`Begin` 的识别链包含 `Stages#next`、`Continue`，但也包含 `ExitThenAbandon`。
- `base.json` 中 `Roguelike@Continue` 会点击继续按钮，随后流程可进入 `Roguelike@Stages`；`Roguelike@Stages` 出错时的 `onErrorNext` 是 `Roguelike@ExitThenAbandon`。
- 最终建议用户先在游戏内手动点击“继续探索”，并尽量处理到路线图/节点选择界面，再启动 MAA 的“自动肉鸽”，主题必须与当前局一致。

Failures and how to do differently:

- 初始查阅了 `maa-battle` 技能，范围不匹配；以后遇到肉鸽接管问题应跳过普通自动作战资料，优先查看 `resource/tasks/Roguelike/*.json`、`RoguelikeTask.cpp` 及官方自动肉鸽文档。
- 最终建议没有实机验证，也没有确认“路线图界面”是否对所有主题都是最安全的接管点；应明确说明这是基于资源链路的推断，不保证不会因地图识别失败而触发放弃。
- MAA 的启动链存在风险：地图节点识别失败时，主题的 `Stages` 通常会回退到 `ExitThenAbandon`，因此不能把“启动后会继续”当作已验证事实。

Reusable knowledge:

- 本机资源入口：`D:/MAA-Arknights-Assistant/resource/tasks/Roguelike/base.json`；源码入口：`src/MaaCore/Task/Interface/RoguelikeTask.cpp`。
- `RoguelikeTask::set_params()` 第 115 行附近把任务入口设置为 `<theme>@Roguelike@Begin`；`Begin` 会尝试识别难度、开始探索、地图/节点、继续探索和放弃流程。
- `Roguelike@Continue` 是已有探索的继续按钮处理；`Roguelike@Stages` 是地图节点处理；地图处理失败时 `onErrorNext` 指向 `Roguelike@ExitThenAbandon`，这是“已有探索会被直接放弃”的关键风险点。
- 官方文档/搜索结果也提示：若已有探索被中断，应先手动“继续当前探索”或“放弃当前探索”，再启动自动肉鸽；非目标主题的探索应提前手动结束。

References:

- 用户原话：“不用看 maa-battle 了，这里面只有自动作战”
- 用户原话：“已有探索会直接放弃。我如何让它从中途启动”
- `D:/MAA-Arknights-Assistant/resource/tasks/Roguelike/base.json`
- `Roguelike@Begin`：`['Roguelike@ChooseDifficulty', 'Roguelike@StartExplore', 'Roguelike@Stages#next', ..., 'Roguelike@ExitThenAbandon', ..., 'Roguelike@Continue']`
- `Roguelike@Continue`：点击区域 `[1032, 487, 248, 215]`，后续为任务失败标记或 `Roguelike@ExitThenAbandon`
- `Roguelike@Stages`：`onErrorNext: ['Roguelike@ExitThenAbandon']`
- `D:/MAA-Arknights-Assistant/src/MaaCore/Task/Interface/RoguelikeTask.cpp` 中 `m_roguelike_task_ptr->set_tasks({ theme + "@Roguelike@Begin" });`

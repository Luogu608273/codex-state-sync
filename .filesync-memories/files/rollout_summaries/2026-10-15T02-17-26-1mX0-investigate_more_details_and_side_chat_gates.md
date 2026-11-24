thread_id: 01a13d59-a16e-70e2-a151-e3df9a260e8a
updated_at: 2026-11-23T12:39:53+00:00
rollout_path: \\?\C:\Users\605\.codex\sessions\2026\10\15\rollout-2026-10-15T10-24-12-01a13d59-a16e-70e2-a151-e3df9a260e8a_01a13d5f-d111-7280-8ea2-6b1e2c401e86.jsonl
cwd: \\?\C:\Users\605\Documents\Codex\2026-10-15\w
git_branch: main

# 调查 Codex/ChatGPT“更多详情”与侧边追问入口的显示条件

Rollout context: Windows Codex desktop app，版本资源位于 `C:\Program Files\WindowsApps\OpenAI.Codex_26.1007.9446.0_x64__2p2nqsd0c76g0\app\resources\app.asar`；工作目录为 `C:\Users\605\Documents\Codex\2026-10-15\w`。

## Task 1: 侧边聊天中的选中文字追问

Outcome: success

Preference signals:
- 用户明确区分“侧边聊天”和“在侧边聊天中追问”，并要求查找可能的开关；后续确认切换产品模式后侧边聊天追问已恢复，说明应分别排查入口条件而不是假定它们共用一个开关。

Key steps:
- 反编译 `app-primary-cd52df2361eb.js`，定位到侧边聊天条件：`canOpenTextSideChat` 与 `canOpenSideChat` 分开计算。
- 代码显示 Work/简洁显示模式会隐藏选中文字追问入口；切换到 Codex 模式后可恢复。
- 官方文档确认 Codex 支持 `/side`，Windows 快捷键为 `Ctrl+Alt+S`；该版本产品切换命令 `switchToMode3` 默认快捷键为 Windows `Alt+3`。

Reusable knowledge:
- 普通侧边聊天可用不代表“选中文字后追问”可用；两者由不同条件控制。
- 该入口受当前产品/显示模式影响，不能只在设置中寻找独立开关。

References:
- `udt(...)` 返回 `{canOpenSideChat, canOpenTextSideChat,...}`。
- 条件片段：`S=u!=null&&b?.type===\`local\`&&w!=null&&!ih(); C=S&&!T&&!s`，其中 `s` 是 `isEverydayWorkMode`。
- 官方文档：`/side`；Windows “Open side chat” 快捷键 `Ctrl+Alt+S`。

## Task 2: 调查“更多详情”开关

Outcome: partial

Preference signals:
- 用户在确认侧边追问恢复后继续要求“找找 更多详情 的开关”，希望得到具体可操作入口；未来类似调查应明确区分“代码内部 feature gate”与“用户可操作设置”。

Key steps:
- 在 `chatgpt-conversation-page-2736eb259275.js` 定位菜单组件 `function jg(e)`。
- “更多详情”必须同时满足内部 Statsig gate `4290238484`、选区位于 assistant 消息、选区解析成功等条件；“添加到对话”另受 `473637331` 控制。
- 代码只在 ChatGPT conversation 页面接入 `onMoreDetails`；当前 Codex 工作聊天没有对应菜单接入。
- 检查普通设置、调试设置、本机 `.codex-global-state.json`、Statsig 缓存和 Local Storage，未发现用户可直接开启的设置入口。
- Statsig 本地缓存来自 2026-09-30，缓存数据不包含这两个 gate，无法证明当前账号实时开关状态。

Failures and how to do differently:
- 不能把本地旧缓存缺少 gate 解读为“当前 gate 一定关闭”；应明确其只代表缓存过期/未下发该配置。
- 不能仅凭普通 Chat 只显示“向 ChatGPT 追问”就断言 gate 关闭；代码还要求 assistant 消息和有效选区，且功能可能按账号远端灰度。
- 本轮没有验证用户账号的实时 Statsig 配置，也没有找到可操作的恢复方法，因此最终结论应保持“不确定/无法手动开启”。

Reusable knowledge:
- “更多详情”不是普通设置项，而是 Statsig 功能配置控制的内部 gate：`4290238484`。
- `473637331` 控制该功能出现时是否同时保留“添加到对话”。
- 代码关键条件：`g=c&&r&&h!=null&&d!=null&&m?.author.role===\`assistant\``，其中 `c=Ce(\`4290238484\`)`，`r=moreDetailsEnabled`。
- Statsig 使用 DJB2 gate lookup；本机缓存文件为 `C:\Users\605\AppData\Roaming\Codex\web\Codex\statsig-state.json` 及 Chromium Local Storage LevelDB，但本次缓存时间较旧。

References:
- `chatgpt-conversation-page-2736eb259275.js`：`function jg(e)`。
- 精确代码：`c=Ce(\`4290238484\`), l=Ce(\`473637331\`)`；`onMoreDetails:v` 仅在 `g` 为真时创建。
- 设置定义中未找到 `moreDetailsEnabled` 用户设置；官方设置文档也未列出该选项。
- 本地缓存检查结果：`CACHE_RECEIVED_AT 2026-09-30T16:38:37.363000+08:00`；两个目标 gate 均未出现在缓存数据中。

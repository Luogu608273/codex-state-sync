thread_id: 01a1250f-66a5-7341-be42-bed5847d6439
updated_at: 2026-10-22T09:20:51+00:00
rollout_path: C:\Users\605\.codex\sessions\2026\10\10\rollout-2026-10-10T17-05-28-01a1250f-66a5-7341-be42-bed5847d6439.jsonl
cwd: \\?\C:\Users\605\Documents\Codex\2026-10-10\referenced-chatgpt-conversation-this-is-an
git_branch: main

# 公开分析了 www.米哈游.com 的客户端随机跳转机制

Rollout context: 在 PowerShell 工作目录 `C:\Users\605\Documents\Codex\2026-10-10\referenced-chatgpt-conversation-this-is-an` 中检查了目标站点的 HTML、HTTP 链、`aha.js`、`aha.wasm` 及公开 GitHub 仓库，并区分已证实结论与推测。

## Task 1: 分析网页源码、跳转链与随机逻辑

Outcome: success

Preference signals:

- 用户明确要求“说明随机页面的候选集合、随机方式及触发位置；若不能确定，区分已证实和推测” -> 类似逆向/网页分析任务应明确标注证据等级、验证范围和未确认部分。

Key steps:

- 实测 `https://www.米哈游.com/`（ASCII 域名 `www.xn--qvrw50dh7j.com`）返回 `200 OK`，HTML 仅加载混淆的 `aha.js`；HTTP 版本为 `301 → HTTPS`。
- 下载并解码 `aha.js`，确认其加载 `aha.wasm`，通过 WASM `dispatch()` 获取抽取结果和 `redirect` 指令，浏览器最终调用 `location.replace()`。
- 从线上 WASM 运行内存提取配置，得到 51 个不同候选 URL：R 普通 23、R 精选 3、SR 22、SSR 2、UR 1。
- 确认随机数为 Mulberry32 风格的 32 位 PRNG；默认种子来自 `Date.now() ^ Math.random()`，`?seed=` 可复现，但必须保持相同的 localStorage 状态。
- 确认默认首次抽取概率：UR 2%、SSR 合计 2%、SR 30%、R 合计 66%；五星基础概率 4%，第 12 抽起软保底递增，第 20 抽硬保底；10 抽内必出四星及以上。
- 确认 localStorage key 为 `buwanyuanshen.gacha.v2`，保存五星/四星 pity、大保底、连续歪、上次常驻 URL 等状态。
- 确认普通结果直接跳转；UR（原神官网）先显示引导页并播放 `video/startup-01.mp4`，在播放结束、跳过、媒体错误或超时后跳转。源码中直播优先逻辑当前被注释/停用。
- 通过固定边界测试和 43 组、共 23,000 次抽取的 JS/WASM 对照验证，确认线上 WASM 与当前配置逻辑一致。
- 初次对照验证因使用过时的旧候选集合失败；将测试夹具更新为线上提取的候选配置后通过。

Failures and how to do differently:

- 浏览器 web 工具无法直接访问中文域名/线上脚本和 WASM；改用 PowerShell `curl.exe`、Punycode 域名和本地 WASM 实例化完成验证。
- 仓库旧版 `scripts/jump.js` 的候选列表与当前线上配置不同，不能直接作为期望输出；比较前必须使用线上配置或固定提交对应的候选集合。
- 未在真实浏览器中人工验证媒体播放，也未逐个访问所有外部候选站点的后续跳转；报告应保留这些限制，不把它们写成已证实事实。

Reusable knowledge:

- 公开仓库 `kaitoulapin/xn--qvrw50dh7j.com` 的提交 `0cf9782acf0c31ac4b21c7a47171ff8c6f9b1a37` 包含对应的 loader、WASM 引擎、运行时和配置；线上还原的 `aha.js` 与 `scripts/load.js` 文本一致，配置除构建生成的 `media.videoBytes` 外一致。
- 线上入口 HTML SHA-256 为 `1a1485c937e811e6938650bae540776c64dcc50a6406528fd930802c878cf56e`；线上 `aha.wasm` SHA-256 为 `0c7a3163b6d6547acf2bbd4b9a33d56027971029c6b851b7dc9a3ee3ba1f69df`。
- 抽取标记格式：外站为 `#gacha-档位-pity`，站内相对 URL 使用 `?gacha=档位-pity`；标记中的数字是距上次五星的 pity，不是候选数组下标。
- 完整交付物位于工作目录 `outputs/`：`analysis.md`、`candidates.csv`、`live-config.json`、`aha-decoded.js`、`wasm-observations.json`、`http-evidence.txt`。

References:

- [1] 入口 HTML：`<script src="aha.js"></script>`，无入口 HTTP 随机 `Location`。
- [2] HTTP 链：`http://www.xn--qvrw50dh7j.com/` 为 `301 → https://www.xn--qvrw50dh7j.com/`；`/search.html?gacha=ssr-0` 为 `307 → /search?gacha=ssr-0`。
- [3] 验证输出：`Passed: 43 corrected-reference JS/WASM comparisons (23000 draws), persistent state, video transitions, probe/simulation/reset/multi-pull.`
- [4] 关键仓库文件：`wasm/src/engine.rs`、`wasm/src/runtime.rs`、`wasm/config.json`、`scripts/load.js`。


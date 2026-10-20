thread_id: 01a12397-d9bd-7500-bd9c-9381d3ab30c3
updated_at: 2026-10-19T07:53:43+00:00
rollout_path: \\?\C:\Users\605\.codex\sessions\2026\10\17\rollout-2026-10-17T16-49-39-01a12397-d9bd-7500-bd9c-9381d3ab30c3_01a1490d-7016-7710-9427-d6a46ffeb872.jsonl
cwd: \\?\C:\Users\605\Documents\Codex\MAA Arknights Assistant!
git_branch: main

# 系统卡顿排查、MAA 作业失败定位及独显切换完成

Rollout context: 用户认为问题不一定来自 MAA 或驱动，要求继续排查整机卡顿；随后要求查看 MAA 作业启动失败原因，并最终要求将 MAA 推理切回 AMD 独显、整理剩余问题到项目外新对话。

## Task 1: Windows 整机卡顿排查

Outcome: partial

Preference signals:
- 用户明确认为“不是 MAA 的问题，可能也不是驱动的问题”，并补充多个程序启动和窗口响应变慢 -> 后续应优先排查整机环境，避免直接归因于 MAA 或旧驱动。
- 用户要求先暂停残余问题、稍后再修复，并要求新对话等待“继续排查” -> 进行系统级修改或进一步诊断前应等待明确授权，不应自动重启、改安全策略、停用还原软件或启动作业。

Key steps:
- 采集内存、磁盘、进程、系统事件、服务、存储日志和短时性能计数器。
- 发现 16GB 内存可用约 2.7–2.9GB、提交约 85%，30 秒采样中 Pages Input/sec 峰值约 124466，固态盘读取峰值约 516MB/s；但 CPU 平均约 24%、磁盘队列最大 1，未见持续满载。
- 发现本次启动 13:56:53 的 Kernel-Boot 16：休眠恢复失败，错误码 `0xC0000221`；尚未证明根因。
- 诊断服务主机权限错误近三天约千次，但同类记录可追溯至 2024 年，应视为旧问题而非本次故障已确认根因。
- Storport 错误核实对应无介质的 F: 光驱 `HL-DT-ST DVDRAM GUD1N`，不是 NVMe 故障证据。
- WPR 因权限失败，错误 `0xc5585011`，确认未留下运行中的跟踪。

Failures and how to do differently:
- “退出模拟器后仍慢”的对照未完全成立，因为原 MuMuPlayer/MuMuVMMHeadless 进程仍在；后续应确认进程真正退出后再作结论。
- `Pages Input/sec` 高峰可能来自启动程序、EXE/DLL 或映射文件冷读取，不能单独等同于页面文件换页或内存故障。
- 不要把 0xC0000221、旧 WdiServiceHost 权限错误或光驱 Storport 报错直接当作根因。

Reusable knowledge:
- 环境为 Windows 10 企业版 G 21H2/19044，i5-12500、16GB RAM；C/D 位于 Phison 512GB NVMe，E 为 WDC 1TB HDD，G 为 USB 存储。
- 机器装有远志还原系统、Shadow Defender 及 `diskpt`、`RENTDriver` 等磁盘过滤驱动；重启前必须确认还原影响和数据位置，不得默认 D/E 不受保护。
- 关键采样资料位于 `data/repairs/2026-10-17-system-stalls-165216`。

## Task 2: MAA 作业启动失败定位

Outcome: success

Key steps:
- 检查 `D:/MAA-Arknights-Assistant/debug/gui.log` 和 `asst.log`，确认模拟器连接成功、截图耗时 13ms，失败发生在编队预检而非连接或截图。
- 作业缺少“凛御银灰”；同时将“史都华德”归为缺失，但本地 `data/OperBoxData.json` 明确显示史都华德已拥有、精零20级。
- YW-EX-5 要求史都华德精一55级、技能7级；因此 MAA 的“Missing”分类混合了未拥有和未达到作业要求两种情况。两组缺口而当前只允许借一名助战，编队预检中止。

References:
- 日志关键字符串：`asst::OperBoxDataConfig::precheck | 2 slots unmatched, aborting formation`、`why":"OperatorMissing"`。
- 本地数据：`D:/MAA-Arknights-Assistant/data/OperBoxData.json`，史都华德记录 `own:true, elite:0, level:20`。
- 作业文件：`D:/MAA-Arknights-Assistant/config/copilot/YW-EX-5.json`。

## Task 3: 将 MAA 推理切回 AMD 独显

Outcome: success

Preference signals:
- 用户说“MAA先切换回独立显卡，核显加速推理太卡了” -> 后续不得擅自恢复核显偏好，也不要把已完成的 AMD 设置覆盖掉。

Key steps:
- 在用户退出 MAA 后，仅修改 `D:/MAA-Arknights-Assistant/config/gui.new.json` 的性能字段：`UseGpu=true`、`GpuDescription="Radeon RX550/550 Series"`、`GpuInstancePath=""`。
- 将 HKCU `Software\Microsoft\DirectX\UserGpuPreferences` 中 MAA 项设置为 `GpuPreference=2;`。
- 通过写前备份、dry-run、JSON 差异检查和写后校验确认无其他配置被改动。
- 用户重新打开 MAA 后，核心日志确认实际解析到 AMD：`resolved adapter LUID 0000000004485A8E to device id 0 Radeon RX550/550 Series`。

Reusable knowledge:
- 已验证 MAA 实际使用 Radeon RX550，进程 25712；不要撤销该设置。
- 证据和脚本位于 `data/repairs/2026-10-17-return-amd-170109/`，包括 `before.json`、`applied.json`、`runtime-verification.json`、`select-amd.py` 和 README。
- MAA 的 GPU 选择可用唯一 `GpuDescription` 回退匹配；实际日志比配置文件更能证明生效。

## Task 4: 创建项目外故障交接对话

Outcome: success

Key steps:
- 创建并打开项目外线程 `01a1492d-d69a-7b10-8113-9548fa69359f`，标题为“学校电脑卡顿与显示异常后续排查”。
- 交接中保留了未解决的卡顿、花屏/黑块、休眠恢复错误、还原软件风险、MAA 已完成改动及资料路径。
- 新对话已明确等待用户说“继续排查”，不会自动检查机器、运行程序、修改配置或安排任务。

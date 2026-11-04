thread_id: 01a12397-d9bd-7500-bd9c-9381d3ab30c3
updated_at: 2026-10-22T09:20:51+00:00
rollout_path: C:\Users\605\.codex\sessions\2026\10\17\rollout-2026-10-17T16-49-39-01a12397-d9bd-7500-bd9c-9381d3ab30c3_01a1490d-7016-7710-9427-d6a46ffeb872.jsonl
cwd: \\?\C:\Users\605\Documents\Codex\MAA Arknights Assistant!
git_branch: main

# Windows 卡顿排查、MAA 作业失败定位与独显切换

Rollout context: 用户认为卡顿不一定由 MAA 或驱动导致，要求继续排查整机环境；随后要求查看 MAA 作业启动失败原因，并最终要求将 MAA 推理切回 AMD 独显、暂停剩余排查，并在项目外创建交接对话。

## Task 1: 整机卡顿与启动后变慢排查

Outcome: partial

Preference signals:
- 用户明确表示“这不是 MAA 的问题，可能也不是驱动的问题”，希望优先调查整机环境，而不是直接归因于 MAA。
- 用户要求继续排查时，助手承诺不重启、不改配置、不操作 MAA；后续类似故障应先进行只读采样和日志核对。
- 用户在问题未解决时要求“稍后再修复”，并希望整理交接到项目外的新对话；后续应保留现状、证据和边界，等待明确继续指令。

Key steps:
- 检查内存、进程、磁盘、系统/Application 事件、Storport/Ntfs、服务、处理器频率和短时性能计数器。
- 发现 30 秒采样 CPU 平均约 24%、峰值约 41%，磁盘队列最大 1；C/D NVMe 平均读延迟约 0.655ms、写延迟约 6.282ms，没有持续满载证据。
- 发现可用内存约 2.7–2.9GB、提交约 85%，页面输入峰值约 124466 pages/sec，伴随约 516MB/s 读取；这可能是启动程序的冷读取/映射文件加载，不能单独证明内存不足。
- 发现本次启动 13:56:53 有 Kernel-Boot 16：休眠恢复失败，错误码 `0xC0000221`；相关线索尚未证明是硬件、系统文件或内存损坏。
- 发现 Diagnostic Service Host/WdiServiceHost 权限失败近三天约千条，但同类记录可追溯到 2024 年，作为旧配置异常而非本次故障根因。
- 核实 Storport 534/549 错误来自空的 F 盘 HL-DT-ST DVDRAM 光驱（无介质），不是 NVMe 故障证据。
- WPR 采集因权限失败，错误 `0xc5585011`，确认没有留下运行中的跟踪。
- 用户退出模拟器后仍报告变慢，但当时 MuMu 相关进程仍存在，因此“模拟器完全退出后仍慢”的对照未完成。

Failures and how to do differently:
- 不应把旧的 WdiServiceHost 权限错误或光驱 Storport 错误直接当作本次卡顿根因。
- 不应把 Pages Input/sec 峰值直接等同于页面文件换页或内存损坏；需要在明确复现时间点关联进程、硬页错误和磁盘等待。
- WPR 需要系统级权限；当前非管理员环境下应停止并说明限制，不要绕过权限。

Reusable knowledge:
- 机器为 Windows 10 企业版 G 21H2/19044，i5-12500、16GB；C/D 位于 Phison 512GB NVMe，E 为 WDC 1TB SATA HDD，G 为 USB 存储。
- 机器安装远志还原系统、Shadow Defender，并运行 `diskpt.sys`、`RENTDriver`、`BrRamdisk`、`Hiberfre` 等启动驱动；重启前不能假定 C/D/E 是否受保护或数据是否会回滚。

References:
- 采样目录：`C:\Users\605\Documents\Codex\MAA Arknights Assistant!\data\repairs\2026-10-17-system-stalls-165216`
- 关键文件：`performance-30s.csv`、`performance-summary.json`、`process-snapshot.json`、`wpr-start-result.json`
- WPR 错误：`Failed to enable the policy to profile system performance. Error code: 0xc5585011`

## Task 2: MAA 作业启动失败定位

Outcome: partial

Preference signals:
- 用户后来明确要求“算了不考虑这几个问题了”，说明作业预检问题暂时不要继续修复、不要重跑或擅自修改作业。

Key steps:
- 读取 `D:/MAA-Arknights-Assistant/debug/gui.log` 和 `asst.log`，确认模拟器连接和截图均成功，失败发生在作业启动前的编队预检。
- 预检缺少“凛御银灰”和“史都华德”，而参数只允许借一名助战；日志显示 `2 slots unmatched, aborting formation` 和 `OperatorMissing`。
- 随后核对本地 `data/OperBoxData.json`，确认史都华德实际已拥有，但记录为精零 20 级；YW-EX-5 要求精一 55 级、技能 7 级。因此 MAA 将练度不达标归入“缺失/未匹配”提示，助手此前直接说“缺失”不够准确。
- 作业文件 `YW-EX-5.json` 同时要求凛御银灰和史都华德，单一助战无法补齐两组缺口。

Failures and how to do differently:
- 连接成功不代表作业可以启动；应先区分连接、截图、作业解析、编队预检和实际战斗。
- 看到“未拥有”时应核对 `OperBoxData.json` 的 own/elite/level/skill 字段，不要直接断言用户没有该干员。
- 用户暂停后不要重跑作业、修改作业文件或擅自培养/调整干员。

Reusable knowledge:
- MAA v6.18.0 的 Copilot 预检会在编队阶段因缺少满足要求的干员而拒绝启动；`ignore_requirements=true` 仍不一定绕过缺失槽位/编队预检。

References:
- 日志证据：`D:/MAA-Arknights-Assistant/debug/asst.log`
- 本地干员数据：`D:/MAA-Arknights-Assistant/data/OperBoxData.json`
- 作业：`D:/MAA-Arknights-Assistant/config/copilot/YW-EX-5.json`
- 关键日志：`OperatorMissing`、`2 slots unmatched, aborting formation`

## Task 3: 将 MAA 推理切换回 AMD 独显并验证

Outcome: success

Preference signals:
- 用户明确说“MAA先切换回独立显卡，核显加速推理太卡了”，并要求暂停其他排查；后续应优先执行这一明确、局部的配置变更，不启动作业、不改模拟器。

Key steps:
- 识别核显 Intel UHD 770 与独显 Radeon RX550；MAA 原配置使用 GPU 但未指定设备，日志显示实际使用 Intel UHD 770，驱动为 2022 年版本且被标记为 deprecated/outdated。
- 先备份 MAA 配置和 HKCU GPU 偏好；将 `gui.new.json` 的 `Gui.Performance` 设置为 `UseGpu=true`、`GpuDescription="Radeon RX550/550 Series"`、`GpuInstancePath=""`。
- 将 `HKCU\Software\Microsoft\DirectX\UserGpuPreferences` 中 MAA 项设置为 `GpuPreference=2;`。
- 用户退出 MAA 后才写入配置；脚本包含进程退出检查、只修改目标 JSON 字段、变更范围比较和写后校验。
- 用户重新打开 MAA 后，核心日志确认：`resolved adapter LUID 0000000004485A8E to device id 0 Radeon RX550/550 Series`，实际推理设备已切换成功。

Failures and how to do differently:
- Computer-use 未发现可操作的 MAA 窗口，因此改用配置文件方式；直接编辑运行中的 MAA 配置可能被内存状态覆盖，必须先让用户完全退出 MAA。
- 不要把 AMD 配置写成待验证状态；已通过重新启动后的核心日志验证实际生效。
- 不要运行旧的整批 GPU 恢复脚本，因为它可能撤销后来明确设置的 MAA AMD 偏好。

Reusable knowledge:
- MAA 官方 GPU 选择逻辑支持在 `GpuInstancePath` 为空时按唯一的 `GpuDescription` 回退匹配。
- 已验证 AMD 配置和运行证据应保留，不要恢复到核显。

References:
- 配置：`D:/MAA-Arknights-Assistant/config/gui.new.json`
- 交接目录：`C:\Users\605\Documents\Codex\MAA Arknights Assistant!\data\repairs\2026-10-17-return-amd-170109`
- 证据文件：`before.json`、`applied.json`、`runtime-verification.json`、`README.md`
- 验证日志：`resolved adapter LUID 0000000004485A8E to device id 0 Radeon RX550/550 Series`

## Task 4: 项目外故障交接对话

Outcome: success

Key steps:
- 在项目外创建并打开对话“学校电脑卡顿与显示异常后续排查”，线程 ID 为 `01a1492d-d69a-7b10-8113-9548fa69359f`。
- 交接中记录了未解决卡顿、花屏、休眠恢复异常、还原软件风险、已完成的 MAA 改动、采样文件位置和操作边界。
- 新对话已确认：等待用户明确说“继续排查”前，不检查机器、不运行程序、不修改配置、不安排定时任务。

References:
- 项目外输出目录：`C:\Users\605\Documents\Codex\2026-10-17\windows-performance-followup\outputs`
- 新线程：`01a1492d-d69a-7b10-8113-9548fa69359f`

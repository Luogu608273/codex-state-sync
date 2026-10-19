thread_id: 01a12397-d9bd-7500-bd9c-9381d3ab30c3
updated_at: 2026-10-17T09:25:30+00:00
rollout_path: \\?\C:\Users\605\.codex\sessions\2026\10\17\rollout-2026-10-17T16-49-39-01a12397-d9bd-7500-bd9c-9381d3ab30c3_01a1490d-7016-7710-9427-d6a46ffeb872.jsonl
cwd: \\?\C:\Users\605\Documents\Codex\MAA Arknights Assistant!
git_branch: main

# 系统卡顿排查、MAA 作业失败定位与独显切换

Rollout context: 工作目录为 `C:\Users\605\Documents\Codex\MAA Arknights Assistant!`。用户认为卡顿不应直接归因于 MAA 或驱动，要求继续排查；随后要求定位 MAA 作业启动失败，并将 MAA 推理切回 AMD 独显，最后要求在项目外新建对话交接剩余问题。

## Task 1: Windows 整机卡顿排查

Outcome: partial

Preference signals:
- 用户明确说“这不是 MAA 的问题，可能也不是驱动的问题”，并补充多个程序及窗口均会卡顿 -> 类似问题应优先检查整机资源、系统事件、存储、内存和后台过滤驱动，不要先把问题归因于单一应用。
- 用户希望继续排查但没有授权重启、改系统配置或停用还原软件 -> 诊断阶段应保持只读，先说明风险和证据边界。

Key steps:
- 检查了内存、进程、磁盘、系统/Application 事件、Storport/Ntfs、服务、CPU 限速和短时性能采样。
- 发现 13:56:53 的 Kernel-Boot 事件：Windows 从休眠恢复失败，错误码 `0xC0000221`；快速启动启用。
- 30 秒采样显示 CPU 平均约 24%、峰值约 41%，磁盘队列最高 1；但 `Memory Pages Input/sec` 峰值约 124466，伴随固态读取峰值约 516 MB/s。该现象可能是程序/映射文件冷读取，不能单独证明页面文件或内存故障。
- 发现 WdiServiceHost/Diagnostic Service Host 权限错误约千条，但同类记录可追溯至 2024 年，判定为旧问题而非本次卡顿根因。
- Storport 错误已核实来自空的 F: 光驱（HL-DT-ST DVDRAM，`MEDIUM NOT PRESENT`），不是 NVMe 故障证据。
- WPR 采集因权限失败，错误 `0xc5585011`；没有留下运行中的跟踪。

Failures and how to do differently:
- 用户回答“已退出模拟器，仍然很慢”，但当时 MuMu 进程仍在运行，因此不能把该对照视为真正退出模拟器后的结论。
- 不能把旧服务权限错误、光驱空介质错误或单次休眠恢复校验错误直接宣布为根因；后续应围绕真实卡顿时间建立相关性。

Reusable knowledge:
- 本机为 Windows 10 企业版 G 21H2/19044，16 GB RAM；C/D 在 Phison 512 GB NVMe，E 为 WDC 1 TB HDD，F 为无介质光驱。
- 远志还原系统、Shadow Defender，以及 `diskpt.sys`、`RENTDriver`、`BrRamdisk64.sys`、`Hiberfre64.sys` 等启动过滤驱动存在；不能默认重启或修改配置，因为还原机制可能回滚数据。
- 交接资料位于 `data/repairs/2026-10-17-system-stalls-165216`，包含 `performance-30s.csv`、`performance-summary.json`、`process-snapshot.json`、`wpr-start-result.json`。

## Task 2: MAA 作业启动失败定位

Outcome: partial

Key steps:
- 读取 `D:/MAA-Arknights-Assistant/debug/gui.log` 和 `asst.log`，确认模拟器连接成功、截图耗时 13 ms，失败发生在编队预检而非 ADB/模拟器连接。
- 作业需要“凛御银灰”；日志还将“史都华德”列为缺失，并因两组缺口而中止：`2 slots unmatched, aborting formation`。
- 本地 `data/OperBoxData.json` 明确显示史都华德已拥有，但状态为精零 20 级；YW-EX-5 要求精一 55 级、技能 7 级。因此“缺失”实际混合了未拥有与未达到作业要求的分类，不能简单理解为账号没有该干员。
- 用户随后暂停该问题，没有继续修改作业或培养干员。

Failures and how to do differently:
- 初始报告“史都华德缺失”不准确；应区分 `Missing` 与等级/技能要求不满足，并先核对 `OperBoxData.json` 和作业 JSON。
- 不应在用户暂停后重跑作业、改作业参数或擅自培养干员。

References:
- 日志关键错误：`OperatorMissing`、`2 slots unmatched, aborting formation`。
- 作业目录：`D:\MAA-Arknights-Assistant\config\copilot\YW-EX-*.json`。

## Task 3: 将 MAA 推理切回 AMD 独显

Outcome: success

Preference signals:
- 用户明确要求“MAA先切换回独立显卡，核显加速推理太卡了” -> 后续应保留 AMD 设置，不要用旧的批量恢复脚本覆盖它。
- 用户要求不启动作业、模拟器配置不动 -> 修改应限定于 MAA GPU 设置，并在写入前备份、写入后验证。

Key steps:
- 发现 MAA 原先使用 Intel UHD 770，驱动版本 `31.0.101.3678`，日志警告其过旧且存在兼容性问题；AMD 为 `Radeon RX550/550 Series`。
- 在用户退出 MAA 后修改 `D:/MAA-Arknights-Assistant/config/gui.new.json`：`UseGpu=true`、`GpuDescription="Radeon RX550/550 Series"`、`GpuInstancePath=""`。
- 将 HKCU `Software\Microsoft\DirectX\UserGpuPreferences` 中 MAA 项设为 `GpuPreference=2;`。
- 写入脚本包含 MAA 退出检查、仅允许预期字段变化、dry-run 和写后校验；备份和证据位于 `data/repairs/2026-10-17-return-amd-170109`。
- 用户重新打开 MAA 后，核心日志确认：`resolved adapter LUID 0000000004485A8E to device id 0 Radeon RX550/550 Series`，证明实际推理设备已切换成功。

Reusable knowledge:
- MAA 官方 GPU 选择逻辑支持在 `GpuInstancePath` 为空时按唯一 `GpuDescription` 回退匹配。
- 不要直接运行旧的整批 GPU 恢复脚本，因为它可能撤销用户后来明确要求的 MAA AMD 设置。

References:
- 配置：`D:\MAA-Arknights-Assistant\config\gui.new.json`
- 证据：`data/repairs/2026-10-17-return-amd-170109/runtime-verification.json`
- 日志证据：`asst.log` 中 `resolved adapter LUID ... Radeon RX550/550 Series`

## Task 4: 项目外新对话交接

Outcome: success

Key steps:
- 创建项目外线程 `01a1492d-d69a-7b10-8113-9548fa69359f`，标题为“学校电脑卡顿与显示异常后续排查”。
- 交接内容包含未解决的卡顿/花屏问题、已完成的 MAA 绕过和 AMD 切换、系统证据、还原软件风险、资料路径及操作边界。
- 新对话已确认收到交接，并等待用户明确说“继续排查”，此前不检查机器、不运行程序、不修改配置、不安排任务。

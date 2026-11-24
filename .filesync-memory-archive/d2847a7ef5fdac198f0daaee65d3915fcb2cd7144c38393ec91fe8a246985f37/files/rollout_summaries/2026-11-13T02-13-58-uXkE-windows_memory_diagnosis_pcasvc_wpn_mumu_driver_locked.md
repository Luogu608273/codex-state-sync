thread_id: 01a1d2ae-df3f-75e3-9eca-aa7f685deb5c
updated_at: 2026-11-21T07:19:40+00:00
rollout_path: \\?\C:\Users\605\.codex\sessions\2026\11\13\rollout-2026-11-13T10-13-58-01a1d2ae-df3f-75e3-9eca-aa7f685deb5c.jsonl
cwd: \\?\C:\Users\605\Documents\Codex\2026-11-13\d-2
git_branch: main

# Windows 内存排查定位到两类可复现问题：PcaSvc 句柄泄漏与 MuMu 模拟器驱动锁定内存

Rollout context: Windows 10 企业版 G 神州网信政府版 19044，16,104 MiB RAM，PowerShell 环境，工作目录为 `C:\Users\605\Documents\Codex\2026-11-13\d-2`。

## Task 1: 排查首次内存飙升

Outcome: success

Key steps:
- 可用内存仅 861 MiB；进程私有驻留内存合计约 5.25 GiB，不能解释全部占用。
- `PcaSvc`（程序兼容性助手，PID 10224）持有 51,842 个不同的进程对象，而全机仅约 287 个运行中进程，确认存在严重句柄堆积。
- 注销无效，因为服务仍在运行且内核对象会一直存在到所有句柄关闭。

Reusable knowledge:
- 使用 `NtQuerySystemInformation` 枚举系统句柄和池标签，可以发现普通任务管理器看不到的进程对象堆积。
- `PcaSvc` 句柄堆积会显著消耗内核内存；重启服务是有效的验证和临时缓解手段。

## Task 2: 再次出现 PcaSvc 堆积并停用服务

Outcome: success

Preference signals:
- 用户明确选择“停用 PcaSvc，避免继续堆积” -> 对该机器后续应优先保持服务禁用，除非用户要求恢复兼容性检测。

Key steps:
- 再次检测到 `PcaSvc` 持有约 11,978–12,291 个进程句柄。
- 管理员重启服务后：进程对象 12,219→377，可用内存 884→2,064 MiB，释放约 1.15 GiB；短时观察句柄稳定在约 183。
- 随后按用户选择停止并禁用服务，核验结果为 `State=Stopped`、`StartMode=Disabled`、`ProcessId=0`。

References:
- 结果文件：`work\memory-20261118\restart-result.json`、`disable-result.json`
- 服务：`PcaSvc`，DLL：`C:\Windows\System32\pcasvc.dll`

## Task 3: 评估 Windows 推送通知服务

Outcome: success

Key steps:
- `WpnUserService_bede8` 曾持有约 13,259 个句柄，但私有驻留内存仅约 13.4 MiB、提交内存约 33.2 MiB。
- 重启后句柄降至 459，私有驻留内存降至 7.4 MiB，约 30 秒后仍约 454 个句柄，说明重启可清理堆积，但未证明长期泄漏。
- 服务负责 Windows 本地/推送通知和磁贴功能，因此未停用，启动类型保持自动。

Failures and how to do differently:
- 不应仅凭“上万句柄”判断它是主要内存来源；必须同时比较服务内存、系统可用内存和重启前后变化。

## Task 4: 诊断第三次内存飙升

Outcome: success

Key steps:
- `PcaSvc` 已禁用且进程对象数正常；`WpnUserService` 再次约 1.7 万句柄，但自身内存仍很小。
- 普通进程私有驻留内存约 6 GiB；ChatGPT 约 1.35 GiB、Chrome 0.67 GiB、QQ 0.62 GiB、VS Code 0.57 GiB。
- RAMMap 快照显示：`Driver Locked` 约 3.84 GiB，`Nonpaged Pool` 约 0.85 GiB。
- MuMu 配置为 6 GiB 客体内存；其 `MuMuVMMManage.exe debugvm ... statistics` 显示 `/GMM/VM/Allocated/cBasePages=975463`，约 3.72 GiB，与 RAMMap 的 Driver Locked 高度吻合。
- 结论：大块不可见内存主要由 MuMu 模拟器实际分配，另有多个应用叠加；两次采样分配量相同，尚不能证明模拟器泄漏。

Reusable knowledge:
- MuMu 配置和日志路径：`C:\Program Files\YXArkNights-12.0\vms\YXArkNights-12.0-0\configs\vm_config.json`、`.nemu`、`logs\VBox.log`。
- MuMu 统计命令：`& 'C:\Program Files\MuMuVMMVbox\Hypervisor\MuMuVMMManage.exe' debugvm '72ffa45b-c38e-a791-1000-000000000000' statistics '--pattern=/GMM/*|/PGM/*Page*'`
- RAMMap 可用管理员命令行生成快照：`RAMMap.exe outputfile.rmp /accepteula`。快照中的 `UseCounts` 可解析出 Driver Locked 等分类。

## Task 5: 解释 RAMMap 的 Unused

Outcome: success

Key steps:
- 用户截图中的 `Unused` 为约 1,393,644 K（约 1.33 GiB），`Active` 仅约 12.8 MiB、`Standby` 约 3.1 MiB。
- 该项主要表示尚未归入具体用途的空闲物理页，通常可被 Windows 重新分配，不等于异常泄漏，也无需手动清理。
- 应结合右侧 `Zeroed` 与 `Free` 判断；两者都属于可用内存的一部分。

References:
- RAMMap 快照：`work\memory-20261121\memory.rmp`
- Microsoft RAMMap 文档及内存页状态说明。

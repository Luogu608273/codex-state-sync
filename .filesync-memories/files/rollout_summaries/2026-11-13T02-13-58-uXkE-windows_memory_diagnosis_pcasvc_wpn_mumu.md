thread_id: 01a1d2ae-df3f-75e3-9eca-aa7f685deb5c
updated_at: 2026-11-23T12:41:36+00:00
rollout_path: \\?\C:\Users\605\.codex\sessions\2026\11\13\rollout-2026-11-13T10-13-58-01a1d2ae-df3f-75e3-9eca-aa7f685deb5c.jsonl
cwd: \\?\C:\Users\605\Documents\Codex\2026-11-13\d-2
git_branch: main

# Windows 内存飙升定位为 PcaSvc 句柄泄漏、WpnUserService 句柄堆积及 MuMu 模拟器驱动锁定内存

Rollout context: Windows 10 企业版 G（19044），16,104 MiB RAM，PowerShell 环境，工作目录 `C:\Users\605\Documents\Codex\2026-11-13\d-2`。

## Task 1: 首次内存异常诊断

Outcome: success

Key steps:
- 采样发现可用内存约 861 MiB，进程私有驻留内存约 5.25 GiB，非分页池约 1.56 GiB。
- `PcaSvc`（程序兼容性助手，PID 10224）持有 51,842 个不同的进程对象，而全机仅约 287 个运行中进程，确认存在大量已退出进程对象句柄堆积。
- 进程对象标签 `Proc` 约 165 MiB；注销无效，因为服务仍在系统会话中持有句柄。

## Task 2: 验证并处理 PcaSvc

Outcome: success

Key steps:
- 以管理员 PowerShell 重启 `PcaSvc` 并前后对照：进程对象数 12,219→377，PcaSvc 句柄 12,291→182，可用内存 884→2,064 MiB，释放约 1.15 GiB。
- 用户明确选择“停用 PcaSvc，避免继续堆积”。随后已将服务停止并设为 Disabled，核验结果为 `State=Stopped, StartMode=Disabled, ProcessId=0`。

Reusable knowledge:
- `PcaSvc` 在该系统上曾两次大量累积 Process 句柄，重启可释放约 1.15 GiB；停用会关闭旧程序兼容性检测和修复提示。

## Task 3: Windows 推送通知服务诊断

Outcome: success

Key steps:
- `WpnUserService_bede8` 曾持有约 13,259 个句柄，但私有驻留内存仅 13.4 MiB、提交内存约 33.2 MiB。
- 重启后句柄降至 459，约 30 秒后仍为 454，私有驻留约 7.4 MiB、提交约 9.2 MiB；可用内存短暂升至 2,108 MiB，后为 1,907 MiB。
- 判断其确有句柄堆积，但不是此次大块内存占用的主要来源，因此保留服务并建议需要时重启，不建议直接禁用。

## Task 4: 再次内存飙升及 MuMu/RAMMap 分析

Outcome: success

Key steps:
- 再次采样时 `PcaSvc` 仍为 Disabled，进程对象数正常；`WpnUserService` 又约 1.7 万句柄，但自身内存仍约 13 MiB。
- 普通进程私有驻留约 6.2 GiB；ChatGPT 约 1.38 GiB、Chrome 683 MiB、QQ 637 MiB、VS Code 584 MiB。
- 发现 MuMu 模拟器配置为 6 GiB 客体内存，配置文件：`C:\Program Files\YXArkNights-12.0\vms\YXArkNights-12.0-0\configs\vm_config.json`；`.nemu` 中 `RAMSize="6144"`、启用 large pages。
- RAMMap 快照解析显示 `Driver Locked` 约 3,934.9 MiB；MuMu `MuMuVMMManage.exe debugvm ... statistics` 显示 `/GMM/VM/Allocated/cBasePages=975463`，约 3.72 GiB，两者高度吻合。
- 因此本次主要是 MuMu 模拟器的驱动锁定内存叠加多个应用占用；两次 MuMu 统计相同，尚无证据证明持续泄漏。
- RAMMap 的 `Unused` 约 1.33 GiB，主要属于可重新分配的空闲/可清零物理页，计入 Windows 可用内存，不是异常泄漏，通常无需清理。

Failures and how to do differently:
- RAMMap UI 截图/窗口读取多次超时；改用管理员命令行生成 `.rmp` 快照并解析 XML，成功获得 UseCounts 和 Driver Locked 数据。
- 不要根据普通进程工作集判断虚拟机真实内存；应结合 RAMMap `Driver Locked` 和 MuMu/VirtualBox 的 GMM 统计。

References:
- `C:\Users\605\Documents\Codex\2026-11-13\d-2\work\memory-20261118\restart-result.json`
- `C:\Users\605\Documents\Codex\2026-11-13\d-2\work\memory-20261118\disable-result.json`
- `C:\Users\605\Documents\Codex\2026-11-13\d-2\work\memory-20261118\wpn-result.json`
- `C:\Users\605\Documents\Codex\2026-11-13\d-2\work\memory-20261121\memory.rmp`
- `MuMuVMMManage.exe debugvm 72ffa45b-c38e-a791-1000-000000000000 statistics --pattern=/GMM/*|/PGM/*Page*`
- 关键结果：`PcaSvc Stopped Disabled`；RAMMap `Driver Locked 3934.9 MiB`；MuMu `Allocated/cBasePages=975463`。

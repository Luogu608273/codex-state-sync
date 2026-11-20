thread_id: 01a1d2ae-df3f-75e3-9eca-aa7f685deb5c
updated_at: 2026-11-18T07:44:19+00:00
rollout_path: \\?\C:\Users\605\.codex\sessions\2026\11\13\rollout-2026-11-13T10-13-58-01a1d2ae-df3f-75e3-9eca-aa7f685deb5c.jsonl
cwd: \\?\C:\Users\605\Documents\Codex\2026-11-13\d-2
git_branch: main

# Windows 内存飙升定位并处理了两个服务句柄堆积问题

Rollout context: Windows 10 企业版 G 神州网信政府版 19044，PowerShell 环境，工作目录 `C:\Users\605\Documents\Codex\2026-11-13\d-2`。

## Task 1: 定位并处理 PcaSvc 进程句柄泄漏

Outcome: success

Preference signals:

- 用户说明注销无效，并选择“停用 PcaSvc，避免继续堆积” -> 类似系统故障中，用户接受在有明确证据和功能影响说明后采取持久化服务配置变更。

Key steps:

- 首次采样显示 16,104 MiB RAM 仅剩 861 MiB 可用；`PcaSvc` 持有 51,842 个不同的进程对象，而全机仅约 287 个运行中进程。
- 后续再次复现：`PcaSvc` PID 10352 持有 11,978 个进程句柄，系统进程对象数 12,214，可用内存 834 MiB。
- 以管理员权限重启服务并做前后快照：进程对象从 12,219 降至 377，PcaSvc 句柄从 12,291 降至 182，可用内存从 884 MiB 升至 2,064 MiB，释放约 1.15 GiB。
- 用户确认后，以管理员权限将 `PcaSvc` 停止并设为 Disabled；核验结果为 `Stopped`、`Disabled`、PID 0。

Failures and how to do differently:

- 普通会话没有管理员权限，无法直接重启或禁用服务；通过 `Start-Process -Verb RunAs` 启动隐藏的管理员 PowerShell 脚本，并把 Before/After 结果写入 JSON，完成了可验证的变更。
- 注销不会释放服务仍持有的内核对象句柄；遇到类似现象应检查服务句柄及系统进程对象数，而不是只依赖注销或结束用户进程。

Reusable knowledge:

- `PcaSvc` 反复累积大量 Process handles 是本机内存压力的明确来源；重启可快速释放句柄和约 1.15 GiB 内存，禁用可避免其继续自动运行，但会关闭旧程序兼容性检测和修复提示。
- Windows 进程对象即使对应进程已退出，只要其他进程仍持有句柄，对象仍会存在。

References:

- 关键证据：`PcaSvc handles: 51842`，后续复现为 `11978`。
- 验证脚本结果文件：`C:\Users\605\Documents\Codex\2026-11-13\d-2\work\memory-20261118\restart-result.json`、`disable-result.json`。
- 服务最终状态：`PcaSvc Stopped Disabled ProcessId 0`。

## Task 2: 检查 Windows 推送通知用户服务

Outcome: success

Key steps:

- `WpnUserService_bede8`（PID 7528）持有约 13,259 个句柄，但私有驻留内存仅 13.4 MiB、提交内存 33.2 MiB；句柄类型主要是 Key/Event/WaitCompletionPacket。
- 重启该用户服务后，句柄从 13,259 降至 459，约 30 秒后仍为 454；私有驻留内存降至 7.4 MiB，提交内存降至 9.2 MiB。
- 服务恢复运行，启动类型保持 Auto；PcaSvc 仍保持 Stopped/Disabled。

Reusable knowledge:

- WpnUserService 的高句柄数确实可通过重启清理，但当前证据显示其主要是句柄堆积，内存收益有限，尚未证明是主要内存泄漏源。
- 该服务负责 Windows 本地/推送通知和磁贴更新；保留服务、在句柄明显堆积时重启，比直接禁用更稳妥。

References:

- 前后快照文件：`C:\Users\605\Documents\Codex\2026-11-13\d-2\work\memory-20261118\wpn-result.json`。
- 重启前/后/稍后：13,259 → 459 → 454 handles；13.4/33.2 MiB → 7.4/9.2 MiB。
- 微软资料指出 WpnUserService 支持 tile、toast、raw notifications；禁用会影响通知相关功能。

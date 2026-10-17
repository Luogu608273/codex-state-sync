thread_id: 01a13a60-5be3-7973-8397-81dbf07ff71d
updated_at: 2026-10-15T12:10:45+00:00
rollout_path: \\?\C:\Users\605\.codex\sessions\2026\10\14\rollout-2026-10-14T20-25-56-01a13a60-5be3-7973-8397-81dbf07ff71d.jsonl
cwd: \\?\C:\Users\605\Documents\Codex\2026-10-14\w
git_branch: main

# Vitrite 的 Ctrl+Shift+0 问题定位、绕过与重写

Rollout context: Windows PowerShell，工作目录为 `C:\Users\605\Documents\Codex\2026-10-14\w`。用户先反馈 Vitrite 中多数窗口无法用 `Ctrl+Shift+0` 恢复不透明，后确认 Windows 输入法快捷键已调整，普通窗口可用，但 Milthm.exe 和 Endfield.exe 存在特殊问题。

## Task 1: 排查 Ctrl+Shift+0 被系统拦截

Outcome: success

Key steps:
- 检索并确认 Windows 多键盘布局可能占用 `Ctrl+Shift+0`；微软 Windows Terminal 文档明确建议在“高级键盘设置 → 输入语言热键”中将“切换键盘布局”设为“未分配”。
- 用户按此修改后确认 `1~9` 均可用，问题缩小为特定程序兼容性，而不是全局快捷键冲突。

Reusable knowledge:
- Windows 路径：设置 → 时间和语言 → 输入 → 高级键盘设置 → 输入语言热键 → 高级键设置；将“切换键盘布局”和必要时“切换输入语言”设为“未分配”。仍可用 `Win+Space` 切换输入法。
- Vitrite 使用主键盘数字行，不是数字小键盘。

## Task 2: 为 Milthm 提供直接恢复工具

Outcome: success

Key steps:
- 检查到 Milthm 进程：`C:\Program Files (x86)\Steam\steamapps\common\Milthm\Milthm.exe`，窗口句柄为 `43782194`。
- 读出窗口带有 `WS_EX_LAYERED`，Alpha 为 `76`，说明当前确实约为 30% 不透明。
- 通过 `SetLayeredWindowAttributes(hwnd, 0, 255, LWA_ALPHA)` 将 Alpha 设置为 255，并成功读回验证。
- 创建并编译 `outputs\恢复 Milthm 不透明.exe`；运行返回码为 0。

Reusable knowledge:
- 原版 Vitrite 的源码中，数字 `1~9` 调用 `SetLayeredWindowAttributes` 设置 Alpha，而 `0` 是移除 `WS_EX_LAYERED`，两条路径不同。
- 独立恢复工具只针对名为 `Milthm` 的唯一进程，检查窗口并设置 Alpha=255。

References:
- `outputs\恢复 Milthm 不透明.exe`
- `work\RestoreMilthm.cs`
- 验证输出：`ReadBackSuccess : True`, `Alpha : 255`, `ExitCode : 0`

## Task 3: 重写 Vitrite Fixed

Outcome: partial

Preference signals:
- 用户问“你有没有尝试改写 virtrite 的可能”并接受独立重写方向 -> 类似需求中可提供独立替代程序，而不是只给临时操作建议。

Key steps:
- 生成 `outputs\Vitrite Fixed.exe`、`outputs\Vitrite Fixed.cs` 和使用说明。
- 新版保留 `Ctrl+Shift+1~9`、置顶功能，将 `Ctrl+Shift+0` 改为直接设置 Alpha=255，并增加 `Ctrl+Alt+0` 备用恢复键。
- 使用低级键盘钩子监听快捷键，不注入其他进程；操作在回调返回后异步执行。
- 编译成功；自测返回码 0，验证了快捷键解码、重复按键过滤、1~9→0 恢复、分层窗口属性读回及置顶切换。

Failures and how to do differently:
- 自测只覆盖了本程序和普通测试窗口，未证明所有游戏窗口兼容；最终 Milthm/Endfield 实际快捷键效果仍需用户验证。
- 用户应先退出原版 Vitrite，再运行新版，否则新版会拒绝启动。

References:
- `outputs\Vitrite Fixed.exe`
- `outputs\Vitrite Fixed.cs`
- `outputs\Vitrite Fixed 使用说明.md`
- 自测输出：`PASS: shortcut decoding, fallback, repeat filtering, opacity 1-9 -> 0 with native readback, layered style preserved, topmost toggle.`

## Task 4: 诊断 Endfield.exe 无法透明

Outcome: fail

Key steps:
- 用户确认普通窗口正常，只有 Endfield 不行。
- 检测到 Endfield 窗口类为 `UnityWndClass`，扩展样式为 `0x100`，直接调用 `SetWindowLongPtrW` 写回样式也返回错误码 5（拒绝访问）。
- Vitrite Fixed 以中等完整性运行；Endfield 进程无法打开令牌，表明其权限级别更高或受保护。微软文档确认：如果目标窗口所属进程权限高于调用进程，`SetWindowLongPtr` 会失败。

Failures and how to do differently:
- 当前 rollout 没有完成管理员启动入口或以管理员权限重新验证，因此 Endfield 仍未解决。
- 下一步应先以“管理员身份运行”启动 `Vitrite Fixed.exe`，再测试 Endfield；若仍失败，应考虑独占全屏/特殊渲染限制，而不是继续修改快捷键逻辑。

References:
- Endfield：进程 ID `56680`，窗口句柄 `15143624`，类名 `UnityWndClass`
- 关键错误：`SameStyleWriteError=5`
- 微软 API 事实：`SetWindowLongPtr` 对更高 UIPI 权限窗口失败；普通用户为 medium integrity，管理员进程通常为 high integrity。

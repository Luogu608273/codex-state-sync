thread_id: 01a13a60-5be3-7973-8397-81dbf07ff71d
updated_at: 2026-11-25T06:16:27+00:00
rollout_path: \\?\C:\Users\605\.codex\sessions\2026\10\14\rollout-2026-10-14T20-25-56-01a13a60-5be3-7973-8397-81dbf07ff71d.jsonl
cwd: \\?\C:\Users\605\Documents\Codex\2026-10-14\w
git_branch: main

# Diagnosed and repaired Windows transparency hotkey failures across Vitrite, Milthm, Endfield, and MuMu

Rollout context: Windows PowerShell environment, primary cwd `C:\Users\605\Documents\Codex\2026-10-14\w`; related virtrite 2 source/build work in `C:\Users\605\Documents\Codex\2026-10-29\mumu` and installed binaries in `C:\Users\605\Documents\Output\virtrite 2`.

## Task 1: Vitrite Ctrl+Shift+0 failure

Outcome: partial

Key steps:
- Confirmed Windows input-language hotkey conflict can intercept `Ctrl+Shift+0`; disabling “Switch keyboard layout” and “Switch input language” under Advanced keyboard settings restores the shortcut in many applications.
- User confirmed `Ctrl+Shift+1~9` worked but `0` failed in Milthm, so the issue was not solely the input-language conflict.
- Inspected original Vitrite source: keys 1–9 set `WS_EX_LAYERED` plus alpha; key 0 removes `WS_EX_LAYERED` and redraws the window.
- Milthm was observed with `WS_EX_LAYERED` and alpha 76. Directly setting alpha to 255 succeeded and was read back successfully.
- Built `恢复 Milthm 不透明.exe`, which sets Milthm alpha to 255 and validates the result.

Reusable knowledge:
- Original Vitrite’s zero path is materially different from its 1–9 path: it removes `WS_EX_LAYERED`, so `Ctrl+Shift+0` can fail independently even when 1–9 work.
- Milthm restore tool was compiled and run successfully with exit code 0; readback showed `Alpha=255`.

## Task 2: Vitrite Fixed rewrite and Endfield diagnosis

Outcome: partial

Key steps:
- Built `Vitrite Fixed.exe`, initially using a low-level keyboard hook and direct `SetLayeredWindowAttributes`, with `Ctrl+Shift+0` setting alpha 255 and `Ctrl+Alt+0` as fallback.
- Self-tests passed for shortcut decoding, opacity changes, restoration, repeat filtering, and topmost toggling.
- Ordinary windows worked, but Endfield did not. Probing showed Endfield’s `SetWindowLongPtrW` returned error 5 (Access Denied), consistent with UIPI/elevation mismatch; Endfield was higher integrity than the helper.
- No confirmed elevated retry was completed in this rollout.

Failures and prevention:
- Synthetic opacity self-tests do not prove compatibility with games or protected/elevated windows.
- For Endfield, run the helper at the same or higher integrity level and test windowed/borderless mode; exclusive fullscreen may not support desktop alpha composition.

## Task 3: MuMu virtrite 2 crash diagnosis

Outcome: success for diagnosis, failure for original bridge

Key steps:
- Located MuMu crash artifacts under `C:\Program Files\YXArkNights-12.0\shell\crash-files`.
- Two dumps (`982189fe-137e-427f-aa03-2459e82ee67d.dmp` and `65c80d60-8b22-4548-b83e-407f6159440c.dmp`) both showed `0xC0000005` at the identical offset `MuMuQtBridge.dll+0x96EC`.
- Disassembly showed the crash occurred in TDM/GCC emulated thread-local-storage initialization for the bridge’s `thread_local bool applying`, before the Qt opacity call completed.
- Replaced the emulated TLS guard with Windows `TlsAlloc`/`TlsGetValue`/`TlsSetValue`/`TlsFree` in `MuMuQtBridge.cpp`.
- MuMu’s existing logs showed `状态 0` errors after the bridge failed; this was a consequence of the bridge failure, not proof that MuMu lacked Qt support.

Reusable knowledge:
- MuMu’s Qt windows require the Qt bridge (`QWidget::find(WId)` and `QWidget::setWindowOpacity`) rather than persistent external layered-style polling; direct style changes are overwritten by MuMu/Qt and can flicker.
- Keep `virtrite 2.exe` and `MuMuQtBridge.dll` together; do not modify MuMu’s VM/game files.

## Task 4: Sleep/wake recovery and global hotkeys

Outcome: success

Key steps:
- Added wake handling and initially rebuilt the low-level hook after resume, but the user later reported both MuMu and ordinary windows stopped responding without a new sleep event.
- Compared original Vitrite and found the original uses a normal `WH_KEYBOARD` hook, while the rewrite used `WH_KEYBOARD_LL` plus custom modifier-state tracking. Low-level hooks can be silently removed after timeout.
- Replaced the shared shortcut mechanism with Windows `RegisterHotKey`/`WM_HOTKEY`, using `MOD_NOREPEAT`; 22 bindings registered successfully.
- Built and installed version 2.0.4.0, preserving the MuMu bridge changes and adding logging of registration count/missing bindings.
- Self-tests passed before and after simulated resume notifications, including actual synthetic hotkey delivery. Installed log recorded `Windows global hotkeys registered: 22/22`.
- User confirmed the previously failing window responded to `Ctrl+Shift+5` after the 2.0.4 update.

References:
- Original source: `https://github.com/ryanvm/vitrite/blob/master/src/VitriDLL/VitriDLL.c`
- Installed source: `C:\Users\605\Documents\Codex\2026-10-29\mumu\outputs\virtrite 2.cs`
- Bridge source: `C:\Users\605\Documents\Codex\2026-10-29\mumu\outputs\MuMuQtBridge.cpp`
- Installed binaries: `C:\Users\605\Documents\Output\virtrite 2\virtrite 2.exe` and `MuMuQtBridge.dll`
- Log: `%LOCALAPPDATA%\virtrite 2\virtrite 2.log`
- Version 2.0.4.0 log evidence: `Started. Windows global hotkeys registered: 22/22.`

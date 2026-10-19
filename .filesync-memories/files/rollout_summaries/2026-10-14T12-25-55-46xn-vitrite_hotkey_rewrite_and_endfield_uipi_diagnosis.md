thread_id: 01a13a60-5be3-7973-8397-81dbf07ff71d
updated_at: 2026-10-17T09:40:06+00:00
rollout_path: \\?\C:\Users\605\.codex\sessions\2026\10\14\rollout-2026-10-14T20-25-56-01a13a60-5be3-7973-8397-81dbf07ff71d.jsonl
cwd: \\?\C:\Users\605\Documents\Codex\2026-10-14\w
git_branch: main

# Vitrite Ctrl+Shift+0 troubleshooting and rewrite

Rollout context: Windows PowerShell workspace `C:\Users\605\Documents\Codex\2026-10-14\w`; user had Vitrite transparency hotkey failures, especially Milthm.exe and later Endfield.exe.

## Task 1: Diagnose Ctrl+Shift+0 failure

Outcome: partial

Key steps:
- Confirmed Windows input-language shortcut conflict as a likely cause. Setting **Time & language → Typing → Advanced keyboard settings → Input language hot keys** to **Not Assigned** restored the shortcut for most windows.
- User reported `Ctrl+Shift+1–9` work in Milthm but `Ctrl+Shift+0` does not.
- Vitrite source inspection showed digits 1–9 call `SetLayeredWindowAttributes`, while 0 removes `WS_EX_LAYERED` and redraws the window.
- Milthm was found running from `C:\Program Files (x86)\Steam\steamapps\common\Milthm\Milthm.exe`; direct native restoration to alpha 255 succeeded and was verified.

Reusable knowledge:
- Windows may reserve `Ctrl+Shift+0` when multiple keyboard layouts are active; disable the relevant input-language/keyboard-layout hotkeys and use `Win+Space` for switching layouts.
- Vitrite’s 0-key path is materially different from 1–9: it clears `WS_EX_LAYERED`, whereas the workaround can set alpha to 255 directly.

References:
- Vitrite source: `https://github.com/ryanvm/vitrite/blob/master/src/VitriDLL/VitriDLL.c`
- Temporary verified utility: `outputs\恢复 Milthm 不透明.exe`
- Verification readback: Milthm alpha changed from 76 to 255; restore utility exited with code 0.

## Task 2: Build an independent Vitrite replacement

Outcome: partial

Preference signals:
- When the user asked “你有没有尝试改写 virtrite 的可能”, the assistant created a standalone replacement rather than modifying the original executable. Similar requests should preserve existing shortcuts while offering a direct workaround and source code.

Key steps:
- Created `outputs\Vitrite Fixed.exe`, source `outputs\Vitrite Fixed.cs`, and `outputs\Vitrite Fixed 使用说明.md`.
- Implemented `Ctrl+Shift+1–9`, direct opaque restoration on `Ctrl+Shift+0`, backup `Ctrl+Alt+0`, and topmost toggle.
- Compiled successfully with .NET Framework `csc.exe` and passed a self-test covering shortcut decoding, repeat filtering, alpha readback, layered-style preservation, and topmost toggling.

Failures and how to do differently:
- The tool was only locally/native-tested; Milthm actual physical hotkey behavior was not confirmed before presenting it as ready.
- The replacement requires the original Vitrite to be exited first; both processes were still present during one verification step.

References:
- Build output: `outputs\Vitrite Fixed.exe`
- Self-test result: `PASS: shortcut decoding, fallback, repeat filtering, opacity 1-9 -> 0 with native readback, layered style preserved, topmost toggle.`

## Task 3: Diagnose Endfield.exe incompatibility

Outcome: partial

Key steps:
- User reported normal windows work with Vitrite Fixed but Endfield does not.
- Endfield window class was `UnityWndClass`; `SetWindowLongPtrW` on its extended style failed with Windows error 5 (`Access denied`).
- Vitrite Fixed ran at medium integrity (`0x2000`), while Endfield could not be queried normally and was evidently at a higher/elevated privilege level. Microsoft documentation confirms `SetWindowLongPtr` fails when the target window belongs to a higher UIPI privilege level.

Failures and how to do differently:
- No administrator-elevated rebuild or manifest was completed, and Endfield transparency was not verified as fixed. The last state is unresolved.
- Next attempt should run Vitrite Fixed elevated (or add a `requireAdministrator` manifest/launcher), then retest. If Endfield uses exclusive fullscreen or a protected rendering path, switch it to windowed/borderless mode before concluding the API is unsupported.

References:
- Exact error: `SameStyleWriteError=5`
- Endfield: process ID 56680, window handle 15143624, class `UnityWndClass`, extended style `0x100`.
- Microsoft API guidance: `SetWindowLongPtrW` fails across higher UIPI privilege levels.

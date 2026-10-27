thread_id: 01a13a60-5be3-7973-8397-81dbf07ff71d
updated_at: 2026-10-22T09:20:51+00:00
rollout_path: C:\Users\605\.codex\sessions\2026\10\14\rollout-2026-10-14T20-25-56-01a13a60-5be3-7973-8397-81dbf07ff71d.jsonl
cwd: \\?\C:\Users\605\Documents\Codex\2026-10-14\w
git_branch: main

# Vitrite Ctrl+Shift+0 troubleshooting and rewrite

Rollout context: Windows 11/10 desktop, PowerShell, cwd `C:\Users\605\Documents\Codex\2026-10-14\w`. The user reported that Vitrite could adjust most windows but `Ctrl+Shift+0` often failed, especially in Milthm.exe, then asked whether Vitrite could be rewritten and later reported Endfield.exe also could not be made transparent.

## Task 1: Diagnose Ctrl+Shift+0 failure

Outcome: partial

Preference signals:
- The user wanted a practical fix for a specific shortcut failure rather than general Vitrite documentation.
- After applying the Windows input-language workaround, the user explicitly reported that `1~9` worked but `0` still failed in Milthm, indicating future troubleshooting should distinguish OS hotkey interception from per-window compatibility.

Key steps:
- Web research identified Windows input-language/layout switching as a known conflict for `Ctrl+Shift+0`.
- Recommended Settings → Time & language → Typing → Advanced keyboard settings → Input language hot keys, then set keyboard-layout/input-language switching to Not Assigned; the user confirmed this fixed the general shortcut conflict but not Milthm.

Failures and how to do differently:
- Do not assume clearing the Windows language hotkey fixes every application. When `1~9` work and only `0` fails, inspect the target window’s layered-window state and Vitrite’s separate zero-key code path.

Reusable knowledge:
- Vitrite source uses `Ctrl+Shift+1~9` to call `SetLayeredWindowAttributes` with alpha values, but `Ctrl+Shift+0` removes `WS_EX_LAYERED` and redraws the window. These are different operations, so zero can fail independently.

References:
- Windows Terminal documentation states that multiple keyboard layouts can reserve `Ctrl+Shift+0`; setting “Switch Keyboard Layout” to “Not Assigned” allows the key to pass through.
- Vitrite source: `ryanvm/vitrite/src/VitriDLL/VitriDLL.c`, function `KbHookProc`.

## Task 2: Restore Milthm opacity and create a helper

Outcome: success for the helper, but the original shortcut remained unresolved

Key steps:
- Found Milthm process at `C:\Program Files (x86)\Steam\steamapps\common\Milthm\Milthm.exe`.
- Probed its window and confirmed `WS_EX_LAYERED` was set with alpha `76` (about 30% opacity).
- Directly called `SetLayeredWindowAttributes(hwnd, 0, 255, LWA_ALPHA)` and read back alpha `255` successfully.
- Built `outputs\恢复 Milthm 不透明.exe`; it compiled and exited with code 0 when tested.

Reusable knowledge:
- For a window already using `WS_EX_LAYERED`, setting alpha to 255 is a reliable workaround for Vitrite’s failed zero-key removal path.
- Milthm uses Unity and its Windows configuration is under `%AppData%\..\LocalLow\Morizero\Milthm\config.toml`, but no configuration change was needed for opacity.

References:
- Helper source: `work\RestoreMilthm.cs`.
- Helper output: `outputs\恢复 Milthm 不透明.exe`.
- Verification: `ReadBackSuccess=True`, `Alpha=255`, helper `ExitCode=0`.

## Task 3: Rewrite Vitrite as Vitrite Fixed

Outcome: partial; build and self-tests passed, but real application compatibility was not fully verified

Preference signals:
- When asked “你有没有尝试改写 virtrite 的可能”, the user accepted a replacement rather than only a one-off workaround. Future similar work should provide a runnable artifact plus source and usage notes.

Key steps:
- Created an independent C# replacement using a low-level keyboard hook, preserving `Ctrl+Shift+1~9`, changing `Ctrl+Shift+0` to set alpha directly to 255, and adding `Ctrl+Alt+0` as a fallback.
- Added a self-test mode covering shortcut decoding, repeat filtering, numpad rejection, opacity 1~9→0 readback, layered-style preservation, and topmost toggling.
- Built `outputs\Vitrite Fixed.exe` and ran the self-test successfully: `ExitCode 0`, report `PASS: shortcut decoding, fallback, repeat filtering, opacity 1-9 -> 0 with native readback, layered style preserved, topmost toggle.`
- Original Vitrite was still running during the final handoff, so actual physical shortcut behavior in Milthm was not verified.

Failures and how to do differently:
- The replacement was validated only against a synthetic WinForms window and self-test logic, not every real game renderer. State explicitly when game-level validation is still pending.
- The program intentionally preserves keyboard events by calling `CallNextHookEx`; it is not a drop-in binary patch of the original Vitrite.

Reusable knowledge:
- Files created: `outputs\Vitrite Fixed.exe`, `outputs\Vitrite Fixed.cs`, `outputs\Vitrite Fixed 使用说明.md`.
- The replacement requires the original Vitrite to be exited first and may need administrator elevation for elevated targets.

## Task 4: Diagnose Endfield.exe incompatibility

Outcome: fail/partial; root cause identified, fix not yet implemented or verified

Key steps:
- User reported ordinary windows work with Vitrite Fixed but Endfield does not.
- Probed Endfield window handle `15143624`, class `UnityWndClass`, extended style `0x100`.
- `SetWindowLongPtrW` on Endfield returned Windows error 5 (`Access denied`), while Vitrite Fixed ran at medium integrity (`0x2000`). Endfield’s token could not be opened with the probe’s requested access, consistent with a higher-privilege/elevated target.
- Microsoft documentation confirms `SetWindowLongPtr` fails when the target window belongs to a higher UIPI privilege level.

Failures and how to do differently:
- The current Vitrite Fixed cannot modify Endfield when Endfield is elevated or otherwise protected. Running the helper with administrator privileges, or matching Endfield’s integrity level, is the next required test.
- Do not attribute this failure to fullscreen mode alone; the direct style write already demonstrated a permission failure.

References:
- Exact error: `SameStyleWriteError=5`.
- Endfield process: PID `56680`, window class `UnityWndClass`, HWND `15143624`.
- Microsoft `SetWindowLongPtrW` documentation: lower-privilege callers cannot modify higher-privilege windows.


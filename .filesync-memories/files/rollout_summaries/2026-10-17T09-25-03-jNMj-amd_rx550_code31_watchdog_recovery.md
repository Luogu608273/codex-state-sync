thread_id: 01a1492d-d69a-7b10-8113-9548fa69359f
updated_at: 2026-10-22T09:20:51+00:00
rollout_path: C:\Users\605\.codex\sessions\2026\10\17\rollout-2026-10-17T17-25-03-01a1492d-d69a-7b10-8113-9548fa69359f.jsonl
cwd: \\?\C:\Users\605\Documents\Codex\2026-10-17\windows-performance-followup
git_branch: main

# Windows AMD RX550 fault investigation and attempted recovery

Rollout context: Chinese-language troubleshooting on Windows 10 Enterprise G, H3CDesk X500s0351, Intel UHD770 plus Radeon RX550. User wanted the AMD hardware acceleration error investigated and then said “你直接修复”.

## Task 1: Locate AMD error evidence

Outcome: success

Preference signals:
- The user requested checking logs after closing the error window; the agent appropriately performed read-only inspection first.
- The user explicitly requested administrator access for reading protected logs; future agents should request elevation narrowly and state that no configuration changes will be made.

Key steps:
- Read-only checks found RX550 in `Win32_VideoController` with `Status=Error`, `ConfigManagerErrorCode=31`, driver `31.0.21925.1001`, INF `oem46.inf`, service `amdwddmg`.
- Kernel-PnP recorded the RX550 startup failure during the 2026-10-17 driver installation: Event 411, problem status `0xC00000E5`.
- Elevated read-only inspection found five current-day WATCHDOG dumps at approximately 20:36, 20:43, and 20:44 under `C:\Windows\LiveKernelReports`.
- No current-day Display/4101, application AMD crash, or reliability events were found. The popup’s exact text was not recovered.

Reusable knowledge:
- Microsoft’s `CM_PROB_FAILED_ADD` documentation defines Code 31 as the function driver returning an error from `AddDevice`; it is not proof of a particular root cause.
- Protected GPU crash evidence requires elevation. A narrowly scoped `Start-Process powershell.exe -Verb RunAs` read-only script successfully accessed `C:\Windows\LiveKernelReports`.

References:
- Report: `C:\Users\605\Documents\Codex\2026-10-17\windows-performance-followup\outputs\admin-amd-log-read-20261021-205016.json`
- Relevant dumps: `WATCHDOG4401-20261021-2044.dmp`, `WATCHDOG-20261021-2044.dmp`, `WATCHDOG4400-20261021-2043.dmp`, `WATCHDOG-20261021-2043.dmp`, `WATCHDOG-20261021-2036.dmp`
- Official reference: `https://learn.microsoft.com/en-us/windows-hardware/drivers/install/cm-prob-failed-add`

## Task 2: Attempt non-reboot RX550 recovery

Outcome: partial

Preference signals:
- When the user said “你直接修复”, the agent proceeded with a non-reboot device-level repair rather than rebooting the whole machine. Future actions should still explain possible display interruption before device resets.
- Existing handoff restrictions remain important: do not reboot, alter restoration software, or change the verified MAA AMD configuration unless separately authorized.

Key steps:
- Saved the WATCHDOG dump files before recovery.
- `pnputil /restart-device` on the RX550 succeeded; after 4 and 16 seconds the device reported `Status=OK`, `ConfigManagerErrorCode=0`.
- DxDiag showed display/D3D enabled, but the active display path was still Microsoft Basic Display Driver; this was correctly recognized as incomplete recovery.
- A DXGI/D3D11 probe did not enumerate the RX550 adapter, so hardware acceleration was not proven restored.
- A subsequent `pnputil /disable-device` followed by `/enable-device` completed both commands but left the RX550 in `ConfigManagerErrorCode=43` (worse than the prior Code 31 state). Final recovery was therefore unsuccessful/unverified.

Failures and how to do differently:
- Do not declare recovery from `ConfigManagerErrorCode=0` alone: DxDiag and adapter enumeration showed the AMD path was still unavailable.
- The disable/enable cycle worsened the final device state to Code 43. Do not repeat it blindly; preserve the current evidence and pivot to analyzing the WATCHDOG dumps, driver installation state, and reboot-dependent initialization.
- The rollout ended without a final post-failure remediation or user confirmation that the GPU recovered.

References:
- Initial recovery: `C:\Users\605\Documents\Codex\2026-10-17\windows-performance-followup\outputs\amd-recovery-20261021-205133\recovery-result.json`
- Enable cycle: `C:\Users\605\Documents\Codex\2026-10-17\windows-performance-followup\outputs\amd-recovery-20261021-205133\enable-cycle-result.json`
- DxDiag: `C:\Users\605\Documents\Codex\2026-10-17\windows-performance-followup\outputs\amd-recovery-20261021-205133\dxdiag-after.txt`
- Final observed state: RX550 `ConfigManagerErrorCode=43`; Intel UHD770 remained OK.

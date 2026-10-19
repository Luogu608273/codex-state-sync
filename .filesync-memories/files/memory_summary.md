v1

## User Profile

- Uses Codex for Chinese OI training/solution delivery in MAA OI Assistant! and Windows troubleshooting or automation.
- For OI learning, prefers Chinese, no background exposition, and one advancing hint at a time. For solution requests, expects write-ups, standard and constrained partial programs, and evidence.
- Values precise status boundaries: user-reported AC is not independent verification; local tests are not official AC; task registration is not proof of later execution.
- Uses connected Google Drive; the old local mounted-sync route is retired. [ad-hoc note]

## User preferences

- “中文回答，省略背景，每次只给一个推进提示，不直接给完整解法或代码”; verify statement and project rules first.
- “过了，总结记录吧”: record method, sticking points, proof, and independent-redo status; do not call a prompted/user-reported AC mastered.
- For “solution std partitial”, provide Chinese solution.md, contest-style std.cpp, truly scoped partial.cpp, applicability, and validation records.
- Use connected Google Drive rather than H:\我的云端硬盘 or old subpaths. [ad-hoc note]
- Clarify whether “sleep” means computer action or reminder; “今晚” means one-time unless stated otherwise.
- For tool rewrites, favor separately testable replacements with source and usage; distinguish Ctrl+Shift+0 from 1–9 if they differ.

## General Tips

- Preserve epistemic status: distinguish user feedback, local tests, target-app tests, remote metadata verification, and unresolved causes.
- OI baseline: TDM-GCC C++17 -std=c++17 -O2 -Wall -Wextra, file I/O plus -DLOCAL, brute-force/differential tests, explicit “not official AC”.
- For Drive delivery, use real IDs and absolute paths, then metadata (name/size/parent) plus folder listings. See skills/google-drive-verified-delivery/SKILL.md.
- Use pypdf for text and pypdfium2/pdftoppm for PDF pages; this runtime lacked pymupdf.
- On Windows, do not reboot/change configuration without authorization; scheduled sleep needs non-suspending preflight and later task/power-event check.

## What's in Memory

### C:\Users\605\Documents\Codex\MAA OI Assistant!

#### 2026-10-18

- day5 counter/buffer/alphabet/subsidy delivery: ZR5, CKK, std.cpp, partial.cpp, solution.md, subsidy n=q=500000, Google Drive
  - desc: Latest four-problem solution, validation, and Drive delivery workflow.
  - learnings: Local checks and remote metadata/listings passed; no official judging claim.

#### 2026-10-17

- U1667-U1670 CKK/N7 delivery: U1667, U1668, U1669, U1670, N7, manifest.json, -DLOCAL, differential testing
  - desc: Earlier 16-file OI delivery and verified N7 upload.
  - learnings: Partial programs need explicit scope; 16/16 remote files verified.
- cross-midpoint divide-and-conquer DP: B[p][v], C[u][p], rectangular-update, O(nk^2 log n)
  - desc: Endpoint-scan preprocessing explanation for nondecreasing-subsequence queries.
  - learnings: “Linear” is endpoint scanning with O(k^2) per endpoint.
- C《组合技》recap and D《最初的博弈》teaching: 组合技, AC自动机, 单提示, oi-training
  - desc: Training record and one-hint teaching workflow.
  - learnings: C remains prompted AC/待重做; D first reply was unverified.

### C:\Users\605\Documents\Codex\2026-10-18\d

#### 2026-10-18

- one-time Windows sleep: Scheduled Task, SetSuspendState, SeShutdownPrivilege, -ValidateOnly
  - desc: Safe one-time system-sleep scheduling; historical paths/task name are not reusable.
  - learnings: Preflight avoids sleep; actual execution requires later confirmation.

### C:\Users\605\Documents\Codex\MAA Arknights Assistant!

#### 2026-10-17

- Windows stalls, Copilot preflight, AMD RX550: Kernel-Boot 16, OperatorMissing, Shadow Defender, GpuPreference=2
  - desc: Whole-system diagnosis boundaries, operator-requirement checks, and verified MAA GPU configuration.
  - learnings: Root cause unresolved; AMD runtime selection confirmed in asst.log.

### C:\Users\605\Documents\Codex\2026-10-14\w

#### 2026-10-17

- Vitrite Ctrl+Shift+0 and Endfield UIPI: Vitrite, Milthm, WS_EX_LAYERED, SetWindowLongPtrW, SameStyleWriteError=5
  - desc: Transparency hotkey diagnosis and target-game privilege barrier.
  - learnings: Milthm direct-alpha workaround verified; Endfield remains unresolved.

### Older Memory Topics

#### Cross-workflow Google Drive access

- retired local-sync path: Google Drive, connected Drive search, folder list, H:\我的云端硬盘
  - desc: Former mounted-sync path is retired; use connected Drive interfaces. [ad-hoc note]

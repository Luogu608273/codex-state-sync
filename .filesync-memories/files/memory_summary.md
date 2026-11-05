v1

## User Profile

- Works mainly in Chinese across OI/C++ contest practice, contest-package delivery, and Windows/Codex tooling.
- Uses local project checkouts under `C:\Users\605\Documents\Codex`; expects concrete artifacts, careful validation, and clear separation between local checks and official results.
- Values continuity: in OI discussion, they usually provide a state/complexity target and want the reasoning advanced from that point.

## User preferences

- For OI tutoring, use Chinese, continue from the user’s actual derivation/state/code, give exactly one advancing hint, then wait; do not infer ability from old records or publish a full solution prematurely.
- For requested contest packages, preserve exact `solution.md`/`std.cpp`/`partial.cpp` layout; explain proof, complexity, partial scope, and validation, and say explicitly when there was no online submission.
- For SPJs/interactors, “留 cpp SPJ” -> prefer C++ and retain compilable `.cpp` source with run notes.
- When safe environment diagnosis can proceed, “直接尝试修复”“继续，不用问我” -> continue troubleshooting instead of handing routine repair back to the user.
- For chat/FileSync repair, “只修复工具不直接移动 .codex 文件”“不要推出 codex 进程” -> use isolated copies and read-only checks; do not touch live chat data or terminate Codex without explicit authorization.
- Do not use retired `H:\\我的移动硬盘` / `CKK` / `Gemini` / `Google AI Studio` locations; use connected Google Drive unless the user specifies a current destination. [ad-hoc note]

## General Tips

- Keep validation claims calibrated: compilation, samples, differential/stress tests, SHA-256 read-back, user-reported AC, and official AC are different evidence levels.
- Put build/test artifacts in `C:\Users\605\Documents\Output`, not a Codex checkout; preserve requested delivery directories clean.
- For tree-DP derivations, preserve exact state semantics and do not treat the incomplete `(s,d)` O(n log n) design as a finished algorithm.
- For current Codex chat recovery, verify the CLI via a `codex-cli` version response; do not assume the GUI executable or old `OpenAI/Codex/bin` location is valid.

## What's in Memory

### C:\Users\605\Documents\Codex\2026-11-04\cong / C:\Users\605\Documents\FileSync

#### 2026-11-04

- FileSync chat recovery and preferences: `repair-chat-index.py`, `find_codex`, `--check-engine`, `menu-11`, `pending_thread_ids`, `state_5.sqlite`
  - desc: Search first for FileSync/Codex CLI discovery, safe preference restoration, invalid-chat cleanup, or release merge; live `.codex` writes are explicitly constrained.
  - learnings: Current CLI path was `...\\Codex\\app\\resources\\codex.exe`; missing snapshot threads must remain pending rather than blocking menus 11/12.

### C:\Users\605\Documents\Codex\MAA OI Assistant

#### 2026-11-03

- Zhengrui #2235 ZR2-10 package and browser repair: `ZR2-10`, `156.0.8078.48.manifest`, `This page crashed`, `file IO: 8 passed`, `SHA-256`
  - desc: Four-problem Chinese solution/std/partial package at the current CKK sync folder, including browser SideBySide diagnosis and complete local validation.
  - learnings: Browser `exitCode=18`/missing `156.0.8078.48` was repaired with a `chrome_elf.dll` manifest; all claims remain local validation, not online AC.
- Tree minimum-connected-selection rerooting: `f_u`, `g_u`, `q=g_u-f_v`, `distance-R`, `O(n log n)`, `(s,d)`
  - desc: Use for the fixed-radius one-component reroot recurrence and the explicitly unfinished complexity optimization.
  - learnings: The f/g recurrence is validated conceptually; boundary cases and the constant-summary O(n log n) merge remain unfinished.

#### 2026-11-02

- Zhengrui batch/SPJ delivery: `ZR2-4`, `ZR2-6`, `ZR2-9`, `spj.cpp`, `CKK`, `std.cpp`, `partial.cpp`
  - desc: Five contest packages, local CKK delivery, C++ SPJ preference, and validation evidence.
  - learnings: Keep C++ source for special judges and distinguish local interactor testing from official judging.

### Older Memory Topics

#### C:\Users\605\Documents\Codex\MAA OI Assistant*

- OI tutoring, records, and contest-C++ debugging: `outputs/训练记录.md`, `P9013`, `CF455D`, `P17833`, `P4802`
  - desc: Detailed task-local debugging/proof shields, training-record boundaries, and stepwise Chinese teaching conventions; cwd=MAA OI Assistant*.
- Algorithm derivations and complexity qualification: `P11234`, `QOJ7895`, `O(nk^2 log n)`, `merge tree`
  - desc: State semantics and amortized-complexity failure shields; cwd=MAA OI Assistant!.

#### Windows desktop / CHAT with GPT

- MuMu `virtrite 2` transparency: `MuMuQtBridge.dll`, `QWidget::setWindowOpacity`, `Alpha=255`, `Ctrl+Shift+0`
  - desc: Qt-bridge transparency workflow; cwd=CHAT with GPT / specific MuMu checkout.
- Windows/Codex and graphics diagnostics: `RX550`, `UIPI`, `ScheduledTask`, `Vitrite Fixed`, `.codex`
  - desc: Time-sensitive desktop, GPU, elevation, sync, and sleep-scheduling checks; recheck current state first.

#### C:\Users\605\Documents\Codex\MAA Arknights Assistant!

- MAA Copilot adaptation and runtime configuration: `TW-EX-7`, `GO-EX-7`, `range_table.json`, `OperatorMissing`, `RX550`
  - desc: Formation/range constraints and AMD runtime checks; static validation does not establish a stage clear.

#### Research-only chats

- NetEase, BOF22, Arknights, and redirect research: `popularity=100`, `api/v6/playlist/detail`, `参数预设`, `aha.wasm`
  - desc: Evidence-led web-research findings and source-validation traps; recheck time-sensitive platform facts.

#### Delivery destination and cloud-storage workflow

- Retired local sync paths: `H:\\我的移动硬盘`, `CKK`, `Google Drive`
  - desc: Search before selecting a delivery location; current local CKK references are task-specific, while the retired movable-disk mount remains stale. [ad-hoc note]

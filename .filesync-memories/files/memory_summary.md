v1

## User Profile

- Works mainly in Chinese on OI/C++ contest training, solution delivery, and Windows/Codex tooling.
- Uses checkouts under `C:\Users\605\Documents\Codex`; expects concrete artifacts and calibrated validation (local checks are not official AC).
- In OI discussions, usually supplies code, state, or a complexity target and wants the reasoning advanced from that exact point.

## User preferences

- For OI tutoring, use Chinese, continue from the user's derivation/code, give exactly one advancing hint or observation, then wait; do not publish a full solution prematurely.
- “1-indexed” applies to entities/arrays/queues unless clarified; preserve standard 0-based bitmask semantics, including empty mask `0`.
- For requested contest packages, preserve exact `solution.md`/`std.cpp`/`partial.cpp` layout; explain proof, complexity, partial scope, and local versus official validation.
- “留 cpp SPJ” -> prefer C++ and retain a compilable `.cpp` special judge plus run notes.
- Generated `.in` and `.exe` go in `C:\Users\605\Documents\Output`, not a Codex checkout.
- For code-archive reports: sort by contestant, show only distinctive original snippets with short explanations, and make repeated patterns a complete statistics/list section.
- For safe FileSync/Codex repair, “只修复工具不直接移动 .codex 文件”“不要推出 codex 进程” -> use isolated copies/read-only checks and leave live data/processes alone.
- Do not default to retired `H:\我的移动硬盘`/its `CKK`, `Gemini`, or `Google AI Studio` paths; use connected Google Drive unless a current location is explicitly supplied. [ad-hoc note]

## General Tips

- Keep evidence labels precise: compilation, samples, differential/stress tests, SHA-256 read-back, user-reported AC, and official AC differ.
- Before editing a project, locate the actual `AGENTS.md`; similarly named checkouts can differ.
- For archive static analysis, decode per file; inspect effective code rather than comments/strings; write large scan evidence to files and assert final counts.
- For version-sensitive Minecraft advice, identify vanilla versus Fabric/Carpet/Paper first and test a claimed plugin before calling it working.

## What's in Memory

### C:\Users\605\Documents\Codex\MAA OI Assistant

#### 2026-11-10

- ZR2-7 original-problem lookup and T2 `path.cpp`: `ZR2-7`, `QOJ 2617`, `Browsing the Collection`, `reverse BFS`, `successor DSU`, `1-indexed`, `bitmask`
  - desc: Four original-problem mappings plus the directly submit-ready T2 standard solution; search for path implementation or index-style guidance.
  - learnings: Items/arrays are 1-based, but masks remain `0..(1<<m)-1`; `sample0`--`sample5` passed with C++14 static build.

#### 2026-11-09

- P10787 tree orientation: `P10787`, `NOI2024`, `min(count,2)`, `s_i`, `倍增`, `订阅`, `二染色`
  - desc: Segment-state maintenance, forced-orientation cascade, and the explicitly incomplete feasibility proof.
  - learnings: `s_i=Σmin(c_B,2)` detects exactly one unoriented edge; contraction proof still needs a complete alternating-direction construction.

#### 2026-11-07

- P9531 LCT guided hint: `P9531`, `JOIST 2022`, `LCT`, `prefix-suffix MST`, `|t-x|<w-x`
  - desc: Use for continuing the user's MST-merge-to-LCT derivation without overrunning the one-hint training convention.
  - learnings: Fix an edge and derive its x-interval/strict-connectivity criterion; no full model or implementation was validated.

### Older Memory Topics

#### C:\Users\605\Documents\Codex\2026-11-05\b-n

- CSP-S 2026 code-archive Markdown: `CSP-S 2026`, `freopen`, `Floyd ijk`, `GB18030`, `-fsyntax-only`, `GD-CSP-S-2026迷惑行为大赏.md`
  - desc: Evidence-checked contestant-sorted report workflow; cwd-specific output/counts are recorded in the dedicated handbook block.

#### C:\Users\605\Documents\Codex\2026-11-05\xian

- Minecraft 26.3 string-duper-like farm research: `string duper`, `tripwire hook duplication`, `random_tick_speed`, `Paper`, `StringDuperFix`
  - desc: Distinguishes exploit-like item production from regular farms; candidate plugin was untested and version-sensitive.

#### C:\Users\605\Documents\Codex\2026-11-04\cong / C:\Users\605\Documents\FileSync

- FileSync chat recovery and preference restoration: `repair-chat-index.py`, `find_codex`, `--check-engine`, `pending_thread_ids`, `state_5.sqlite`
  - desc: Safe Codex CLI discovery, isolated recovery checks, missing-chat handling, and release verification.

#### C:\Users\605\Documents\Codex\MAA OI Assistant*

- Zhengrui package delivery and browser repair: `ZR2-4`, `ZR2-6`, `ZR2-10`, `std.cpp`, `partial.cpp`, `spj.cpp`, `SHA-256`
  - desc: Contest-material layout, C++ SPJ rule, local validation/Drive read-back, and browser SideBySide repair.
- OI debugging, proofs, and training records: `P9013`, `CF455D`, `P17833`, `P4802`, `tree rerooting`, `oi-training/SKILL.md`
  - desc: Task-local counterexamples, complexity shields, prompt-assisted-AC boundaries, and one-hint teaching conventions.

#### Windows desktop / CHAT with GPT

- MuMu and Windows/Codex diagnostics: `MuMuQtBridge.dll`, `QWidget::setWindowOpacity`, `RX550`, `UIPI`, `ScheduledTask`
  - desc: Checkout-sensitive desktop opacity, GPU, elevation, and power-scheduling procedures; recheck installed state first.

#### C:\Users\605\Documents\Codex\MAA Arknights Assistant!

- MAA copilot adaptation: `TW-EX-7`, `GO-EX-7`, `range_table.json`, `OperatorMissing`
  - desc: Formation/range configuration and runtime caveats; static checks do not prove a stage clear.

#### Research-only chats

- NetEase, BOF22, Arknights, and redirects: `popularity=100`, `api/v6/playlist/detail`, `aha.wasm`
  - desc: Evidence-led web-research findings and source-validation traps; recheck time-sensitive platform facts.

#### Delivery destination and cloud-storage workflow

- Retired local sync paths: `H:\我的移动硬盘`, `CKK`, `Google Drive`
  - desc: Do not use the retired movable-disk mount as a current destination; detailed replacement rule is in `MEMORY.md`. [ad-hoc note]

v1

## User Profile

- Primarily works in Chinese on OI/C++ training, contest deliverables, and a few Windows, Minecraft/PCL, and MAA Copilot projects.
- Uses Codex checkouts under `C:\Users\605\Documents\Codex`; values concrete artifacts and calibration: compilation, local testing, user-reported AC, and official AC are different claims.
- In OI discussion, often supplies a derivation or partial code and wants the response to continue from that exact point.

## User preferences

- For OI teaching, normally wait for their idea and give one advancing hint/question in Chinese; do not disclose a full solution early. “先不用给提示，等我说我的做法” is literal. Explicit requests for technique diagnosis or complete code change that boundary, not the default.
- For constructive greedy, establish the upper bound, terminal structure, invariant, and scan-endpoint proof before writing code; the user actively checks boundary arguments, not just intuitive continuity.
- Explain unfamiliar techniques through a known analogy when offered (for example P2151), but state the structural difference.
- For C++ WA, find the smallest counterexample and make the minimal correct repair; for TLE, inspect hot paths, memory layout, and access counts rather than give generic flags.
- “过了，总结记录吧” means update the formal original-problem training record/review and preserve “提示后 AC” versus independent mastery.
- Keep requested contest layout exactly (`solution.md`, `std.cpp`, `partial.cpp`); “留 cpp SPJ” means a compilable C++ special judge plus run notes.
- Generated `.in` and `.exe` go under `C:\Users\605\Documents\Output`, not a Codex checkout.
- For renamed projects, follow the newly supplied path; for MAA operator replacement, preserve original coordinate, direction, and deployment order unless explicitly allowed otherwise.
- Never default to the retired `H:\我的云端硬盘` local mount; use connected Google Drive or a currently supplied destination. [ad-hoc note]

## General Tips

- Locate the actual `AGENTS.md` before editing: similarly named MAA OI/Arknights directories differ.
- State validation boundaries exactly; static schema/range checks and local random tests do not prove combat clears or online AC.
- In multi-test constructive code, reset every output-state structure, not only the numeric state; use a tiny two-case regression that catches residual matrix/array state.
- MAA Copilot roster, game data, and asset paths are time-specific: refresh/reinspect them before reuse, and never store API secrets.
- For Windows memory pressure persisting after logout, compare process totals with kernel objects/pool tags and use an elevated before/after service test; handle count alone is not RAM causality.

## What's in Memory

### C:\Users\605\Documents\Codex\MAA Arknights Assistant

#### 2026-11-14

- CV-8 Mon3tr Copilot adaptation and renamed-directory migration: `prts://87122`, `CV-8`, `Mon3tr`, `重构体`, `CV-8-Mon3tr-S1.json`, `OldDirectoryPreserved`
  - desc: Static MAA-job replacement, reconstruction-token geometry, and migration from the `!` checkout.
  - learnings: Mon3tr S1 stays at `(10,5)` left; Reconstruction `(9,4)` is an action-only zero-block summon. Combat was not tested; use the no-`!` checkout.

### C:\Users\605\Documents\Codex\MAA OI Assistant

#### 2026-11-16

- P10441 `乒乓球` directed-triangle construction: `P10441`, `出度`, `三元环`, `翻边`, `ans矩阵`, `long long`
  - desc: Maximum-triangle bound, row-by-row edge-reversal greedy, formal endpoint argument, and multi-test residual-matrix repair.
  - learnings: `C(n,3)-ΣC(d_i,2)` is optimized by balanced outdegrees; if `t>remaining`, scan left rather than stopping. User reported prompt-assisted AC; no independent redo recorded.

#### 2026-11-14

- P12445 incremental inclusion-exclusion DP tutoring: `P12445`, `数好图`, `容斥写进 DP`, `P2151`, `oi-training`
  - desc: Waiting-first tutoring and the distinction between single- and multiple-bad-condition inclusion-exclusion.
  - learnings: No DP state or mastery was verified; wait for the user's own derivation and advance one breakpoint at a time.

#### 2026-11-13

- P11994/Uiro and P17834 debugging: `P11994`, `ST table`, `P17834`, `difference array`, `XOR adjacency`
  - desc: Boundary repairs and optimized local implementations with brute/performance evidence.
  - learnings: `lst=L-1`/`res=R+1`; chain starts must stay in `[1,len-m+1]`. Neither local validation is online AC.

- P14347 Lamps training record: `P14347`, `three-state DP`, `interval XOR`, `提示后 AC`
  - desc: Repaired rolling-state DP and formal record routing.
  - learnings: Only retain is reachable at empty prefix; start XOR on `0→1`.

### Windows desktop / C:\Users\605\Documents\Codex\2026-11-13\d-2

#### 2026-11-13

- PcaSvc high-memory/process-object diagnosis: `PcaSvc`, `process objects`, `nonpaged pool`, `Restart-Service`
  - desc: Evidence and the required administrator before/after test for suspected retained process objects.
  - learnings: Causality remains unconfirmed without the service-restart comparison.

### Older Memory Topics

#### C:\Users\605\Documents\Codex\MAA OI Assistant*

- Contest collaboration, training records, debugging, and artifact layout: `AGENTS.md`, `过了，总结记录吧`, `[debug]`, `Documents/Output`, `std.cpp`
  - desc: Interaction defaults, original-problem record rules, C++ failure shields, ZR packages, browser repair, and delivery validation.
- Two-dimensional prefix-sum string DP: `f[i,j]`, `g[i,j]`, `S_i=S_j`, `O(n^2)`
  - desc: Strict upper-left-rectangle transition optimization; match symbols rather than indices and preserve zero boundaries. cwd=C:\Users\605\Documents\Codex\MAA OI Assistant.
- Algorithm derivations and qualified complexity: `P11234`, `QOJ7895`, `Möbius`, `divide-and-conquer`, `O(n log n)`
  - desc: State semantics and proof/complexity caveats; includes unresolved rerooting-DP boundaries.
- CSP-S submission archive reporting: `CSP-S 2026`, `Markdown`, `submission archive`, `distinctive examples`
  - desc: Evidence-checked Chinese reporting that separates repeated mistakes from representative submissions.

#### C:\Users\605\Documents\Codex\2026-11-04\cong / C:\Users\605\Documents\FileSync

- FileSync Codex chat recovery: `repair-chat-index.py`, `state_5.sqlite`, `pending_thread_ids`
  - desc: Isolated recovery and safe live-data handling.

#### D:\PCL 正式版 2.12.7.3 / Minecraft

- PCL Fabric repair and Minecraft automation: `26.3.json`, `InstallManifest`, `string duper`, `trial vault`
  - desc: Root-profile verification, launch boundary, and version/server-aware game mechanics.

#### Windows desktop / CHAT with GPT

- Graphics, transparency, power scheduling, and research: `MuMuQtBridge.dll`, `RX550`, `UIPI`, `ScheduledTask`, `NetEase`, `aha.wasm`
  - desc: Inspect matching MEMORY blocks before changing live programs; research claims remain source/time-sensitive.

#### Delivery destination and cloud-storage workflow

- Retired local sync path: `H:\我的云端硬盘`, `Google Drive`, `CKK`
  - desc: Do not use the retired mount as a current delivery target. [ad-hoc note]

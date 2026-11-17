v1

## User Profile

- Primarily works in Chinese on OI/C++ training, contest deliverables, and occasional Windows, Minecraft/PCL, and MAA Copilot projects.
- Uses Codex checkouts under `C:\Users\605\Documents\Codex`; values concrete artifacts and calibrated claims: compilation, local testing, user-reported AC, and official AC are different evidence.
- In OI discussion, often supplies a derivation or partial code and wants the response to continue from that exact point.

## User preferences

- For OI teaching, normally preserve the user's derivation and give one advancing hint/question in Chinese; do not disclose a full solution early. Explicit requests for a complete replacement or a specific diagnostic change that boundary.
- For constructive greedy, establish the upper bound, terminal structure, invariant, and scan-endpoint proof before code; the user checks boundary arguments, not just intuitive continuity.
- For C++ WA, find the smallest counterexample and make the minimal correct repair; for TLE, inspect hot paths, memory layout, and access counts rather than generic compiler flags.
- “过了，总结记录吧” means update the formal original-problem training record/review and preserve “提示后 AC” versus independent mastery.
- Keep requested contest layout exactly (`solution.md`, `std.cpp`, `partial.cpp`); “留 cpp SPJ” means a compilable C++ special judge plus run notes.
- Generated `.in` and `.exe` go under `C:\Users\605\Documents\Output`, not a Codex checkout.
- For version-history questions, map the supplied feature set and gameplay stage rather than release dates; incorporate later feature corrections and distinguish close-but-incomplete matches.
- Never default to the retired `H:\我的云端硬盘` local mount; use connected Google Drive or a currently supplied destination. [ad-hoc note]

## General Tips

- Locate the actual `AGENTS.md` before editing: similarly named MAA OI/Arknights directories differ.
- State validation boundaries exactly; static schema/range checks and local random tests do not prove combat clears or online AC.
- In multi-test constructive code, reset every output-state structure, not only the numeric state; use a tiny two-case regression that catches residual matrix/array state.
- MAA Copilot roster, game data, and asset paths are time-specific: refresh/reinspect them before reuse, and never store API secrets.
- In layered combinatorial DP, retain stated endpoint constraints through intermediate tables; staged convolution can preserve `O(n^2)` without a joint three-dimensional state.
- For Minecraft historical mapping, separate individual feature first appearances from a single overall Java-version approximation; visual lighting memories alone may not date a minor release.

## What's in Memory

### C:\Users\605\Documents\Codex\MAA OI Assistant

#### 2026-11-16

- Three-layer DP staged convolution: `f`, `g`, `H`, `x_k`, `ans_k`, `endpoint constraint`, `O(n^2)`
  - desc: Endpoint-constrained combinatorial DP merge; search first for a three-layer count split or incorrect `g`-table end condition.
  - learnings: compute `x_k=Σ f_{n,r}g_{r,k}`, then `ans_k=x_kH_k`; force `g`'s endpoint only on final extraction, not ordinary prefixes.

- P10441 `乒乓球` directed-triangle construction: `P10441`, `出度`, `三元环`, `翻边`, `ans矩阵`, `long long`
  - desc: Maximum-triangle bound, row-by-row edge-reversal greedy, formal endpoint argument, and multi-test residual-matrix repair.
  - learnings: `C(n,3)-ΣC(d_i,2)` is optimized by balanced outdegrees; if `t>remaining`, scan left rather than stopping. User reported prompt-assisted AC.

#### 2026-11-13

- P11994/Uiro, P14347, and P17834 debugging: `lst=L-1`, `res=R+1`, `three-state DP`, `0-to-1`, `difference array`, `XOR adjacency`
  - desc: Boundary repairs and optimized local implementations with brute/performance evidence; search here for ST/RMQ, rolling DP, or tree-radius chain issues.
  - learnings: initialize `lst=L-1` and `res=R+1`; only `f[0][2]` starts reachable; chain starts stay in `[1,len-m+1]`. Local validation is not online AC.

### C:\Users\605\Documents\Codex\CHAT with GPT

#### 2026-11-16

- Minecraft Pocket Edition historical version identification: `MCPE 0.14.0`, `0.15.0`, `observer`, `sticky piston`, `Java 1.8`, `smooth lighting`
  - desc: Feature-memory lower bounds and Java gameplay mapping; use for iOS/PE history questions, distinct from current 26.3 gameplay research.
  - learnings: item frames imply at least 0.14.0; observers plus sticky pistons imply at least 0.15.0; Java 1.8 explains slime-piston launching but not observers.

### C:\Users\605\Documents\Codex\MAA Arknights Assistant

#### 2026-11-14

- CV-8 Mon3tr Copilot adaptation and renamed-directory migration: `prts://87122`, `CV-8`, `Mon3tr`, `重构体`, `CV-8-Mon3tr-S1.json`, `OldDirectoryPreserved`
  - desc: Static MAA-job replacement, reconstruction-token geometry, and migration from the `!` checkout.
  - learnings: Mon3tr S1 stays at `(10,5)` left; Reconstruction `(9,4)` is an action-only zero-block summon. Combat was not tested; use the no-`!` checkout.

### Windows desktop / C:\Users\605\Documents\Codex\2026-11-13\d-2

#### 2026-11-13

- PcaSvc high-memory/process-object diagnosis: `PcaSvc`, `process objects`, `nonpaged pool`, `Restart-Service`
  - desc: Evidence and the required administrator before/after test for suspected retained process objects.
  - learnings: Causality remains unconfirmed without the service-restart comparison.

### D:\PCL 正式版 2.12.7.3 / Minecraft

#### 2026-11-13

- PCL Fabric repair and Minecraft 26.3 gameplay: `26.3.json`, `InstallManifest`, `InstanceCache`, `KnotClient`, `trial vault`
  - desc: Static root-profile repair, mod side requirements, and version-specific diamond acquisition.
  - learnings: PCL launches the instance-root JSON; inspect `mainClass` and invalidate `InstanceCache`, but do not launch if the user asked not to.

### Older Memory Topics

#### C:\Users\605\Documents\Codex\MAA OI Assistant*

- Contest collaboration, training records, debugging, and artifact layout: `AGENTS.md`, `过了，总结记录吧`, `[debug]`, `Documents/Output`, `std.cpp`
  - desc: Interaction defaults, original-problem record rules, C++ failure shields, ZR packages, browser repair, and delivery validation. cwd=`C:\Users\605\Documents\Codex\MAA OI Assistant*`.
- Two-dimensional prefix-sum string DP: `f[i,j]`, `g[i,j]`, `S_i=S_j`, `O(n^2)`
  - desc: Strict upper-left-rectangle transition optimization; match symbols rather than indices and preserve zero boundaries. cwd=`C:\Users\605\Documents\Codex\MAA OI Assistant`.
- Algorithm derivations and qualified complexity: `P11234`, `QOJ7895`, `Möbius`, `divide-and-conquer`, `O(n log n)`
  - desc: State semantics and proof/complexity caveats; includes unresolved rerooting-DP boundaries. cwd=`C:\Users\605\Documents\Codex\MAA OI Assistant`.

#### Minecraft Java research

- Minecraft Java 26.3 emerald alternatives: `string duper`, `random_tick_speed`, `Paper`, `End portal sand duper`, `toolsmith`
  - desc: Research for dupe-like emerald production versus conventional farms; recheck version and server type. cwd=`C:\Users\605\Documents\Codex\2026-11-05\xian`.

#### C:\Users\605\Documents\Codex\2026-11-04\cong / C:\Users\605\Documents\FileSync

- FileSync Codex chat recovery: `repair-chat-index.py`, `state_5.sqlite`, `pending_thread_ids`
  - desc: Isolated recovery and safe live-data handling; never alter live Codex data without explicit authorization.

#### Windows desktop / CHAT with GPT

- Graphics, transparency, power scheduling, and research: `MuMuQtBridge.dll`, `RX550`, `UIPI`, `ScheduledTask`, `NetEase`, `aha.wasm`
  - desc: Inspect matching MEMORY blocks before changing live programs; research claims remain source/time-sensitive.

#### C:\Users\605\Documents\Codex\2026-11-05\b-n

- CSP-S submission archive reporting: `CSP-S 2026`, `Markdown`, `submission archive`, `distinctive examples`
  - desc: Evidence-checked Chinese reporting that separates repeated mistakes from representative submissions.

#### Delivery destination and cloud-storage workflow

- Retired local sync path: `H:\我的云端硬盘`, `Google Drive`, `CKK`
  - desc: Do not use the retired mount as a current delivery target. [ad-hoc note]

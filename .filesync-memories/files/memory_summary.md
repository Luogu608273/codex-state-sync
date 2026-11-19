v1

## User Profile

- Primarily works in Chinese on OI/C++ training and contest materials, with recurring Windows, Minecraft/PCL, MAA Copilot, Arknights, and game-research requests.
- Uses Codex checkouts under `C:\Users\605\Documents\Codex`; often supplies a derivation or partial code and wants help continued from that point.
- Values concrete artifacts and calibrated claims: user-reported AC, compilation/local tests, static checks, and official AC are distinct evidence.
- Maintains separate game-account contexts when supplying roster data.

## User preferences

- For OI teaching, preserve the user's derivation and give one advancing hint/question in Chinese; test asserted structures with a concrete counterexample before accepting them, and do not disclose a full solution early.
- For viable C++ `[debug]`, make minimal changes without changing the idea, explain substantive errors, imitate the user's real code style, and provide complete modified code. If the approach is wrong, explicitly say “做法不正确” with a reason/counterexample and stop.
- “过了，总结记录吧” means update the original-problem training record/review and preserve “提示后 AC” versus independent mastery.
- Generated `.in` and `.exe` go under `C:\Users\605\Documents\Output`, not a Codex checkout.
- Use connected Google Drive to inspect code or deliver to Drive; do not infer a local sync path or make extra backups for Git-tracked, non-ignored files. [ad-hoc note]
- For small-account Arknights roster questions, do not mix main-account data; first pin down unlock/transform state, recipient class/rank, “常态,” and whether training is allowed.
- For current game/product research, separate platform/server/region, permanent versus limited content, source date, expiry, and unresolved price/availability details.

## General Tips

- Locate the actual `AGENTS.md` before editing: similarly named MAA OI/Arknights directories differ.
- State validation boundaries exactly; static/local tests do not prove a combat clear or online AC.
- In interval/subset DP, check capacity, empty-set, singleton, and empty-interval states alongside the recurrence; hand-check the smallest nontrivial case.
- For MAA Copilot and roster tasks, game data, account state, assets, and unlocks are time-specific; recheck before reuse and never store secrets.
- In multi-test constructive code, reset output-state structures as well as numeric state; a tiny two-case regression catches retained matrices/arrays.

## What's in Memory

### C:\Users\605\Documents\Codex\MAA OI Assistant

#### 2026-11-18

- P10197 interval-DP recurrence and boundaries: `P10197`, `f_{l,r,S}`, `g_{l,r,T}`, `w(S)`, `+∞`, `len_i`
  - desc: Corrected subset/interval-DP transition, fixed-point accounting, and feasibility states for Minimum Sum of Maximums.
  - learnings: minimize `f` over eligible `i`; fixed-point terms are already represented by interval boundaries; empty, singleton, and capacity cases are essential.

#### 2026-11-17

- P12445 `数好图` DP repair and review: `P12445`, `f`, `g`, `h`, `h[i][0]`, `n=2`, `All graphs n=2..6 OK`
  - desc: Three-layer reachability/inclusion-exclusion DP debugging, AC record, and training-review locations.
  - learnings: preserve `h`'s zero column, initialize only `h[1][1]=P-1`, mod after each factor, and test `n=2` before trusting the recurrence.
- P10441 and adjacent OI debugging: `P10441`, `三元环`, `翻边`, `ans矩阵`, `P11994`, `P14347`, `P17834`
  - desc: Constructive proof, multi-test reset shield, and boundary/optimization repairs.
  - learnings: formal endpoint arguments and minimal counterexamples matter; local validation is not online AC.

### C:\Users\605\Documents\Codex\MAA Arknights Assistant

#### 2026-11-18

- Small-account six-star Guard constant-ATK screening: `小号`, `六星近卫`, `常态加攻`, `阿米娅升变`, `JT8-2`, `杜宾`, `波登可`
  - desc: Account-specific roster screen under “未升变、不提升练度、常态” constraints; use before proposing a current candidate.
  - learnings: no qualifying self-owned operator was found; filter by unlock, E-level, recipient class/rank before generic buff effects.

#### 2026-11-17

- BB-EX-6 Mon3tr rope-preserving Copilot: `prts://86659`, `Mon3tr`, `稳固锁链`, `BB-EX-6-Mon3tr-S1.json`
  - desc: Static Copilot adaptation retaining the Babel Tower rope chain.
  - learnings: preserve deployment order and distinguish static validation from a combat clear.

### C:\Users\605\Documents\Codex\CHAT with GPT

#### 2026-11-17

- Arcaea free songs and main-story packs: `Arcaea`, `World Mode`, `World Extend`, `Renegade`, `Memory Archive`, `Adverse Prelude`
  - desc: Mobile free-content categories, dated events, vouchers, and ambiguous “first four chapters” purchase question.
  - learnings: confirm platform/server; list actual packs and current target-store prices rather than treating historical event data as current.

### Older Memory Topics

#### C:\Users\605\Documents\Codex\MAA OI Assistant*

- Contest collaboration, training records, and artifact layout: `AGENTS.md`, `[debug]`, `做法不正确`, `Documents/Output`, `outputs/训练记录.md`
  - desc: Core OI interaction defaults, style/debug rules, record handling, actual rules path, and artifact migration. cwd=`C:\Users\605\Documents\Codex\MAA OI Assistant*`.
- DP derivations and qualified complexity: `P11234`, `QOJ7895`, `divide-and-conquer`, `O(n log n)`, `P11994`
  - desc: State semantics, proof/complexity caveats, and incomplete rerooting boundaries. cwd=`C:\Users\605\Documents\Codex\MAA OI Assistant`.
- Two-dimensional prefix-sum string DP: `f[i,j]`, `g[i,j]`, `S_i=S_j`, `O(n^2)`
  - desc: Strict upper-left-rectangle transition optimization; preserve zero boundaries and match symbols, not indices. cwd=`C:\Users\605\Documents\Codex\MAA OI Assistant`.
- Contest-package delivery: `std.cpp`, `partial.cpp`, `solution.md`, `SPJ`, `google-drive-verified-delivery`
  - desc: Compile/test/read-back workflow for requested contest materials. cwd=`C:\Users\605\Documents\Codex\MAA OI Assistant*`.

#### C:\Users\605\Documents\Codex\2026-11-04\cong / C:\Users\605\Documents\FileSync

- FileSync Codex chat recovery: `repair-chat-index.py`, `pending_thread_ids`, `state_5.sqlite`, `--check-engine`
  - desc: Isolated recovery and safe handling; do not alter live Codex data without authorization.

#### Windows desktop / C:\Users\605\Documents\Codex\2026-11-13\d-2

- High-memory PcaSvc diagnosis: `PcaSvc`, `process objects`, `nonpaged pool`, `Restart-Service`
  - desc: Elevated before/after test for suspected retained process-object handles; causality remains unconfirmed.

#### D:\PCL 正式版 2.12.7.3 / Minecraft

- PCL Fabric repair and Minecraft 26.3: `26.3.json`, `InstallManifest`, `InstanceCache`, `KnotClient`, `trial vault`
  - desc: Static profile repair, mod-side requirements, and version-specific gameplay research.

#### Minecraft Java research

- Low-cost dupe-like emerald farming: `string duper`, `random_tick_speed`, `Paper`, `End portal sand duper`, `toolsmith`
  - desc: Version/server-sensitive research contrasting dupe-like methods with conventional emerald farms. cwd=`C:\Users\605\Documents\Codex\2026-11-05\xian`.

#### Windows desktop / CHAT with GPT

- Windows graphics, transparency, scheduling, and web research: `MuMuQtBridge.dll`, `RX550`, `UIPI`, `ScheduledTask`, `aha.wasm`
  - desc: Reinspect live-program state and treat researched platform facts as time-sensitive.

#### C:\Users\605\Documents\Codex\2026-11-05\b-n

- CSP-S submission archive reporting: `CSP-S 2026`, `Markdown`, `submission archive`, `distinctive examples`
  - desc: Evidence-checked Chinese reporting separating recurring mistakes from representative submissions.

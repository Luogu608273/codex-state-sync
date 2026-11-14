v1

## User Profile

- Works mainly in Chinese on OI/C++ training and contest deliverables, plus Minecraft/PCL and Windows/Codex troubleshooting.
- Uses checkouts under `C:\Users\605\Documents\Codex`; values concrete artifacts and calibrated evidence. Compilation, local differential/stress tests, user-reported AC, and official AC are distinct.
- In OI work, commonly supplies code, a derivation, or a complexity target and expects the reply to advance from that exact point.

## User preferences

- For OI teaching, use Chinese and normally give one advancing hint/observation, then wait; do not disclose a full solution early. If the user explicitly asks “给完整代码/完整做法”, preserve their framework and give a directly usable complete implementation.
- For supplied C++/WA, first find the smallest counterexample and make the minimal correct repair; for TLE, inspect hot paths, memory layout, and access count instead of listing generic flags.
- “过了，总结记录吧” -> update training record, profile, and one-problem review under the formal original problem number when supplied; retain “提示后 AC” versus independent redo.
- Keep requested contest layout exactly (`solution.md`, `std.cpp`, `partial.cpp`); “留 cpp SPJ” means compilable C++ special judge plus run notes.
- Generated `.in` and `.exe` belong under `C:\Users\605\Documents\Output`, not a Codex checkout.
- For safe FileSync/Codex repair: “只修复工具不直接移动 .codex 文件”“不要推出 codex 进程” -> isolate/read-check live data; do not alter it without authorization.
- For PCL/Windows repair: “不要使用 Computer Use，使用命令行解决问题”; when told “不用启动”, validate statically and do not launch the game.
- Do not use retired `H:\我的云端硬盘` (or its CKK/Gemini/Google AI Studio paths) as a current destination; use connected Google Drive or a newly supplied destination. [ad-hoc note]

## General Tips

- Locate the actual `AGENTS.md` before edits; similarly named MAA OI checkouts differ.
- Label validation exactly: compilation, samples, differential/stress tests, SHA-256 read-back, user report, and official AC are not interchangeable.
- For Windows memory pressure that survives logout, compare process totals with kernel objects/pool tags and do an elevated before/after service test; do not infer RAM impact from handle count alone.
- For Minecraft, establish vanilla/Fabric/Carpet/Paper and exact version; for PCL, inspect root version JSON and install manifest before assuming a loader is active.

## What's in Memory

### C:\Users\605\Documents\Codex\MAA OI Assistant

#### 2026-11-13

- P11994/Uiro value-greedy ST/RMQ optimization: `P11994`, `Uiro`, `low`, `pos`, `lst`, `sum`, `O(NV+QV+NlogN)`
  - desc: Debugged boundary state and optimized the inner binary search into segment RMQ plus direct `h`; open for complete code, definitions, and local validation.
  - learnings: `lst=L-1`, query-indexed `sum`, and `res=R+1`; ST is over complete `x`-start segments, not the whole prefix array.
- P17834 tree-radius WA/TLE: `P17834`, `degree-2 chain`, `difference array`, `XOR adjacency`, `fread`
  - desc: Counterexample-led chain-start boundary repair and faster `O(n log n)` local implementation for huge trees.
  - learnings: Scan only `[1,len-m+1]`; the optimized version has local brute/performance evidence but no online submission.
- P14347 Lamps: `P14347`, `JOISC 2019`, `three-state DP`, `interval XOR`, `rolling array`, `nung`
  - desc: Three-state linear DP repair, tests, and training archive under its original problem number.
  - learnings: Only retain-state is reachable on empty prefix; count XOR starts as `0→1`; status is prompt-assisted user-reported AC.

#### 2026-11-12

- Two-dimensional prefix-sum string DP: `f[i,j]`, `g[i,j]`, `S_i=S_j`, `p<i`, `q<j`, `O(n^2)`
  - desc: Upper-left-rectangle transition optimization and state-condition pitfall.
  - learnings: Match symbols (`S_i=S_j`), not indices; include explicit zero boundaries.
- P10787 tree orientation: `P10787`, `fl`, `add2`, `tree doubling`, `训练记录`
  - desc: Constant optimization review and user-reported training record for this checkout.
  - learnings: Candidate speedups require differential tests before promotion.

### C:\Users\605\Documents\Codex\2026-11-13\d-2

#### 2026-11-13

- Windows memory pressure / PcaSvc: `PcaSvc`, `Program Compatibility Assistant`, `process objects`, `nonpaged pool`, `Restart-Service`
  - desc: High-memory diagnosis where a service retained about 51,842 process objects after logout.
  - learnings: Still unconfirmed: administrator before/after restart of PcaSvc is required before assigning causality.

### D:\PCL 正式版 2.12.7.3

#### 2026-11-13

- PCL Fabric 26.3 repair and diamond options: `26.3.json`, `KnotClient`, `InstallManifest`, `InstanceCache`, `Colorful Anvils`, `trial vault`
  - desc: Root-profile repair, client/server mod requirement, and diamond-item options.
  - learnings: Fabric must be in root profile and manifest; static dependency/hash checks sufficed because launch was disallowed.

### C:\Users\605\Documents\Codex\2026-11-05\xian

#### 2026-11-11

- Minecraft 26.3 emerald automation: `string duper`, `random_tick_speed`, `End portal sand duper`, `iron farm`, `toolsmith`
  - desc: Separate exploit-like continuous production from conventional emerald farms and server-specific fixes.
  - learnings: Establish vanilla/Fabric/Carpet/Paper first; tick speed neither restores duplication nor accelerates villager restocks.

### Older Memory Topics

#### C:\Users\605\Documents\Codex\MAA OI Assistant!

- Contest collaboration and algorithm derivations: `std.cpp`, `partial.cpp`, `spj.cpp`, `P11234`, `QOJ7895`, `midpoint preprocessing`
  - desc: Delivery layout, verification boundaries, competition-tree DP, divide-and-conquer preprocessing, and merge-tree complexity proofs; cwd-sensitive.

#### C:\Users\605\Documents\Codex\MAA OI Assistant

- ZR2 packages and original-problem lookup: `ZR2-7`, `QOJ 2617`, `successor DSU`, `ZR2-10`, `solution.md`, `std.cpp`, `partial.cpp`
  - desc: Original mappings, verified path solution, package validation, and embedded-browser repair.

#### C:\Users\605\Documents\Codex\2026-11-04\cong / C:\Users\605\Documents\FileSync

- FileSync chat recovery and preference restoration: `repair-chat-index.py`, `find_codex`, `pending_thread_ids`, `state_5.sqlite`
  - desc: Safe CLI discovery, isolated recovery checks, missing-chat handling, and release verification.

#### Windows desktop / CHAT with GPT

- MuMu, graphics, Codex, and power scheduling: `MuMuQtBridge.dll`, `QWidget::setWindowOpacity`, `RX550`, `UIPI`, `ScheduledTask`
  - desc: Windows opacity, GPU/elevation, Codex diagnostics, and scheduling; inspect the matching MEMORY block before changing live programs.

#### C:\Users\605\Documents\Codex\MAA Arknights Assistant!

- MAA copilot adaptation: `TW-EX-7`, `GO-EX-7`, `range_table.json`, `OperatorMissing`
  - desc: Formation/range configuration and runtime caveats for the MAA checkout.

#### Research-only chats

- NetEase, BOF22, Arknights, and redirects: `popularity=100`, `api/v6/playlist/detail`, `aha.wasm`
  - desc: Evidence-led web research and source-validation traps.

#### Delivery destination and cloud-storage workflow

- Retired local sync paths: `H:\我的云端硬盘`, `CKK`, `Google Drive`
  - desc: Do not use the retired local mount as a current destination. [ad-hoc note]

v1

## User Profile

- Works mainly in Chinese on OI/C++ training, contest-solution delivery, Minecraft/PCL troubleshooting, and Windows/Codex tooling.
- Uses checkouts under `C:\Users\605\Documents\Codex`; wants concrete artifacts and calibrated validation. Local checks, user-reported AC, and official AC are distinct evidence levels.
- In OI discussions, supplies code, proof state, or a complexity target and expects the response to advance exactly from that point.

## User preferences

- For OI tutoring, use Chinese, continue from the user’s derivation/code, give exactly one advancing hint or observation, then wait; do not publish a full solution prematurely.
- In proof/complexity review, check every affected prefix interval and the cost of one predicate; do not accept “all prefix sums do not decrease” or a binary-search count as sufficient.
- “过了，总结记录吧” -> update the training record, training profile, and one-problem review; keep user-reported AC, prompt assistance, and independent-redo status separate.
- For C++ “常数过大”, inspect hot paths, memory layout, and access counts; code-derived changes stay unverified until compiled, differential-tested, and benchmarked.
- Preserve requested contest layout exactly (`solution.md`/`std.cpp`/`partial.cpp`); “留 cpp SPJ” means a compilable C++ special judge with run notes.
- Generated `.in` and `.exe` go in `C:\Users\605\Documents\Output`, not a Codex checkout.
- For safe FileSync/Codex repair, “只修复工具不直接移动 .codex 文件”“不要推出 codex 进程” -> isolate/read-check data and leave live state alone.
- For PCL/Windows repair, “不要使用 Computer Use，使用命令行解决问题”; when told “不用启动”, validate config/dependencies/files statically and do not launch the game.
- Do not default to retired `H:\我的云端硬盘` or its `CKK`, `Gemini`, or `Google AI Studio` paths; use connected Google Drive unless a current destination is supplied. [ad-hoc note]

## General Tips

- Before editing a project, locate its actual `AGENTS.md`; similarly named checkouts can differ.
- Keep evidence labels precise: compilation, samples, differential/stress tests, SHA-256 read-back, user-reported AC, and official AC are different.
- For Minecraft, establish vanilla versus Fabric/Carpet/Paper and precise version before advising; for PCL, inspect the root version JSON and install manifest rather than assuming a nested loader profile is active.
- For rectangle-sum DP transitions `sum_{p<i,q<j}`, try a 2D prefix sum with explicit zero boundaries; match symbols (`S_i=S_j`), not indices (`i=j`).

## What's in Memory

### D:\PCL 正式版 2.12.7.3

#### 2026-11-13

- PCL Fabric 26.3 repair and diamond options: `26.3.json`, `KnotClient`, `InstallManifest`, `InstanceCache`, `Colorful Anvils`, `trial vault`
  - desc: Root-profile repair, client/server mod requirement, and practical diamond-item sources for the PCL 26.3 instance.
  - learnings: Fabric must be present in the root profile and manifest; cache invalidation plus static dependency/hash checks sufficed because the user requested no game launch.

### C:\Users\605\Documents\Codex\MAA OI Assistant

#### 2026-11-12

- Two-dimensional prefix-sum string DP: `f[i,j]`, `g[i,j]`, `S_i=S_j`, `p<i`, `q<j`, `O(n^2)`
  - desc: Use first for the quartic upper-left-rectangle transition and its state-condition pitfall.
  - learnings: `f[i,j]=1+g[i-1,j-1]` only when the characters match; update `g` by inclusion-exclusion and return `g[n,n]`.
- P10787 tree orientation and exchange-proof review: `P10787`, `fl`, `add2`, `exchange argument`, `prefix sums`, `(2,1,2)`
  - desc: Constant optimization/training record and proof-complexity shields for this checkout.
  - learnings: Candidate speedups need differential tests; an `i<j` exchange can lower middle prefixes, and a binary search requires an O(1) predicate to support the claimed total bound.

### C:\Users\605\Documents\Codex\2026-11-05\xian

#### 2026-11-11

- Minecraft 26.3 dupe-like/non-raid emerald automation: `string duper`, `random_tick_speed`, `End portal sand duper`, `iron farm`, `toolsmith`
  - desc: Separate exploit-like continuous production from conventional emerald farms and server-specific fixes.
  - learnings: Establish vanilla/Fabric/Carpet/Paper before recommending a duper; `random_tick_speed` neither restores duplication nor accelerates villager restocks.

### Older Memory Topics

#### C:\Users\605\Documents\Codex\2026-11-05\b-n

- CSP-S 2026 code-archive Markdown: `CSP-S 2026`, `freopen`, `Floyd ijk`, `GB18030`, `-fsyntax-only`
  - desc: Evidence-checked contestant-sorted reporting and output/count validation; cwd=`C:\Users\605\Documents\Codex\2026-11-05\b-n`.

#### C:\Users\605\Documents\Codex\2026-11-04\cong / C:\Users\605\Documents\FileSync

- FileSync chat recovery and preference restoration: `repair-chat-index.py`, `find_codex`, `pending_thread_ids`, `state_5.sqlite`
  - desc: Safe CLI discovery, isolated recovery checks, missing-chat handling, and release verification.

#### C:\Users\605\Documents\Codex\MAA OI Assistant!

- Contest collaboration and algorithm derivations: `std.cpp`, `partial.cpp`, `spj.cpp`, `P11234`, `QOJ7895`, `midpoint preprocessing`
  - desc: Delivery layout, verification boundaries, competition-tree DP, divide-and-conquer preprocessing, and merge-tree complexity proofs; checkout-sensitive cwd=`...\MAA OI Assistant!`.

#### C:\Users\605\Documents\Codex\MAA OI Assistant

- ZR2-7 original-problem lookup and T2 `path.cpp`: `ZR2-7`, `QOJ 2617`, `Browsing the Collection`, `successor DSU`, `1-indexed`, `bitmask`
  - desc: Original mappings and verified 1-based T2 standard solution; cwd=`C:\Users\605\Documents\Codex\MAA OI Assistant`.

#### Windows desktop / CHAT with GPT

- MuMu, graphics, Codex, and power scheduling: `MuMuQtBridge.dll`, `QWidget::setWindowOpacity`, `RX550`, `UIPI`, `ScheduledTask`
  - desc: Windows opacity, GPU/elevation, Codex diagnostic, and scheduling procedures; inspect the matching MEMORY block before changing a live program.

#### C:\Users\605\Documents\Codex\MAA Arknights Assistant!

- MAA copilot adaptation: `TW-EX-7`, `GO-EX-7`, `range_table.json`, `OperatorMissing`
  - desc: Formation/range configuration and runtime caveats for the MAA checkout.

#### Research-only chats

- NetEase, BOF22, Arknights, and redirects: `popularity=100`, `api/v6/playlist/detail`, `aha.wasm`
  - desc: Evidence-led web-research findings and source-validation traps.

#### Delivery destination and cloud-storage workflow

- Retired local sync paths: `H:\我的云端硬盘`, `CKK`, `Google Drive`
  - desc: Do not use the retired local mount as a current destination. [ad-hoc note]

v1

## User Profile

- Chinese-speaking competitive-programming user who values exact correctness, explicit state/transition reasoning, and checked time/space complexity.
- Uses contest-style C++, structured OI training records, Codex for Windows/MAA work, and evidence-led web/game research.
- Treat user-reported AC, local/random validation, and official evaluation as different evidence levels. Uses connected Google Drive rather than the retired local mount. [ad-hoc note]

## User preferences

- For OI [hint], first ask for current derivation/card point when unknown; give exactly one advancing hint and wait. Do not infer ability from historical scores or disclose a full solution early.
- For [debug], keep the approach/style, identify concrete faults, make minimal edits, and provide the modified complete code.
- Follow the user’s contest C++ style (globals, 1-based indexing, short names, init/solve/main); avoid unrelated modernization.
- On “过了，总结记录吧”, update records/review while preserving prompt-assisted AC versus independent mastery.
- Respect literal boundaries such as “是/否”, “只找原题”, “不要给思路”, and “不要修改训练记录”.
- For research requests such as “全部查一遍”, return full, traceable coverage and label confirmed/pending/not-found; do not turn weak matching into fact.
- Before a “sleep” action, distinguish “电脑自动睡眠” from a reminder.
- Do not make extra backups for non-ignored Git project files. Do not treat H:\我的云端硬盘 as a usable Drive path; use connected Drive search/list/read. [ad-hoc note]

## General Tips

- Use Chinese for contest work. Show state definitions, surviving sets, transitions, and aggregated complexity; never call an amortized bound worst-case O(1).
- Preserve evidence boundaries: compile/static/random/user AC is not official evaluation.
- For current web, hardware, rankings, and app state, inspect primary/current evidence and state uncertainty.
- For NetEase ties, use API/display order or say the formula is undisclosed; comments are a separate metric.
- For MAA/GPU diagnosis, begin read-only and verify real adapter use with restart logs plus DxDiag/DXGI, not device status alone.

## What's in Memory

### C:\Users\605\Documents\Codex\2026-10-18\d / Windows desktop

#### 2026-10-25

- One-time Windows sleep: ScheduledTask, SetSuspendState, SeShutdownPrivilege, Get-ScheduledTaskInfo
  - desc: Registered a 22:00 automatic-sleep task; use for safe one-time power scheduling and its verification boundary.
  - learnings: Registration and privilege validation did not observe actual sleep; check task history/LastRunResult before claiming execution.

### C:\Users\605\Documents\Codex\CHAT with GPT / research chats

#### 2026-10-25

- NetEase equal-popularity ordering and Arknights/Endfield epithets: popularity=100, order=hot, comments total, 塞壬唱片-MSR, 判词
  - desc: Routes to the distinction between platform hot-work order, exposed popularity, comments, and incompletely sourced fixed-format epithets.
  - learnings: popularity=100 cannot rank songs; do not substitute comment counts or treat secondary lore copy as official.

#### 2026-10-24

- BOF22 full playlist-author audit: playlist 8483155610, api/v6/playlist/detail, api/song/detail, Credits, List_def, teamprofile
  - desc: Complete 373-track/270-display-artist NetEase extraction and conservative BOF22 participation cross-check.
  - learnings: Use official Credits/roles after candidate matching; preserve ID-0 artists and label identity ambiguity pending.

### C:\Users\605\Documents\Codex\MAA OI Assistant!

#### 2026-10-24

- Stepwise OI tutoring for crystal: G123914, P11089, oi-training, 一次只给一个推进提示
  - desc: Teaching protocol for beginning an OI explanation without leaking a solution or altering training records.
  - learnings: Ask for the user’s actual reasoning, state, code, or blockage before the first hint.
- P11234 competition-tree optimization: 擂台游戏, b, q, 逆序解除固定, 均摊复杂度, O(T(n+m))
  - desc: User-reported-AC review covering dynamic candidate states, reachable leaves, root switching, and performance fixes.
  - learnings: b is not an ID set; qualify the height-based analysis as amortized/total, not per-update O(1).
- Parity-demand layer decomposition: d0, d1, s(v), cross-layer edges
  - desc: Partial mathematical model for deciding whether demand minimization decomposes by s(v)=d0+d1.
  - learnings: The required no-cross-layer-competition proof remains open.

### Older Memory Topics

#### C:\Users\605\Documents\Codex\MAA OI Assistant!

- Contest collaboration, debugging, and training records: [debug], 完整代码, 码风, 过了，总结记录吧, P8820, CF379F
  - desc: Persistent C++/teaching defaults, evidence rules, P8820 k=3 shields, and dynamic-tree-diameter practice; cwd=C:\Users\605\Documents\Codex\MAA OI Assistant!.
- Algorithm derivations: divide-and-conquer, B[p,v], C[u,p], O(nk^2 log n)
  - desc: Midpoint subsequence-preprocessing explanation; linear endpoint scans still cost O(k^2) per state update; cwd=C:\Users\605\Documents\Codex\MAA OI Assistant!.

#### C:\Users\605\Documents\Codex\MAA Arknights Assistant!

- MAA Copilot adaptation: prts://104914, TW-EX-7, 塞雷娅, range_table.json, OperatorMissing
  - desc: Roster/job adaptation, measured range constraints, and runtime evidence boundaries; cwd=C:\Users\605\Documents\Codex\MAA Arknights Assistant!.

#### Windows/Codex desktop/research chats

- GPU, transparency, and Codex sync: RX550, Code 31, Code 43, DxDiag, DXGI, Vitrite Fixed, UIPI, FileSync
  - desc: Driver-recovery evidence, window-style/UIPI diagnosis, and credential-safe .codex sync scope; cwd=Windows desktop/Codex desktop.
- Mihoyo redirect analysis: aha.wasm, aha.js, location.replace
  - desc: Client-side redirect routing; use when identifying candidate set, randomness, and trigger evidence; cwd=research-only chats.

#### Cross-workflow Google Drive

- Retired local-sync path: H:\我的云端硬盘, CKK, Gemini, Google AI Studio, connected Google Drive
  - desc: The local mount is obsolete; search/list/read through connected Drive interfaces. [ad-hoc note]

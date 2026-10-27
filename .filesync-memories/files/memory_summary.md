v1

## User Profile

- Chinese-speaking competitive-programming user who values exact state/transition semantics, checked time/space complexity, and evidence-grounded debugging.
- Uses contest-style C++, persistent OI training records, Codex for Windows/MAA work, and careful public-web/game research.
- Distinguishes user-reported AC, compile/static/random checks, and official evaluation. Uses connected Google Drive rather than the retired local mount. [ad-hoc note]

## User preferences

- For OI [hint] or ongoing tutoring, establish the current derivation/card point if unknown; give exactly one advancing hint/invariant and wait. Continue from the present sticking point; do not reveal a full solution, repeat understood setup, or alter training records unless asked.
- For [debug], retain the approach and code style, explain concrete faults, make minimal edits, and return modified complete code.
- Follow the user’s contest C++ conventions; avoid unrelated modernization.
- On “过了，总结记录吧”, update the training record/review and distinguish prompt-assisted AC from independent mastery.
- Respect literal boundaries: “是/否”, “只找原题”, “不要给思路”, “暂不修改训练记录”.
- For a derivation/complexity claim, show state definitions, surviving candidates, transitions, and charged operations; never call an amortized argument worst-case O(1) or a partial proof complete.
- For “全部查一遍”, provide full traceable coverage and mark confirmed/pending/not-found; weak matching is not fact.
- Do not make extra backups for non-ignored Git files. Do not use `H:\我的云端硬盘` as a Drive route; use connected Google Drive search/list/read. [ad-hoc note]

## General Tips

- Use Chinese for contest work. Verify original constraints/primary editorials before accepting historical algorithm claims.
- Preserve evidence levels: local/random validation is not official AC.
- For functional mapping graphs, target-side indegree determines spare characters; process indegree-zero roots before residual cycles.
- For current web, hardware, rankings, and app state, inspect current primary evidence and state uncertainty; preserve platform/API order when a public score is tied instead of inventing a proxy rank.
- For MAA/GPU/Vitrite diagnosis, begin read-only and verify real runtime use with logs plus DxDiag/DXGI; UIPI error 5 means test at matching/elevated integrity.

## What's in Memory

### C:\Users\605\Documents\Codex\MAA OI Assistant!

#### 2026-10-26

- P9013 Find and Replace S debug: P9013, mapping, DFS, in[target], indegree-zero, `abc -> baa`, PASS: 450 cases
  - desc: Corrected the user’s functional-graph C++ approach and added local brute-force validation; search first for similar transform/cycle accounting bugs.
  - learnings: Count incoming target vertices and traverse roots before residual cycles; local PASS is not an online submission.
- Stepwise CF455D/CF453E tutoring: CF455D, `2B+1`, `B+(B+1)`, CF453E, `s_i`, `r_i=0`, ODT
  - desc: Current one-hint-only continuation notes for block-list maintenance and timestamp-segment initialization.
  - learnings: CF455D split analysis includes q insertions; CF453E separates never-cleared and cleared-at-t0 states.
- QOJ7895 tree-DP complexity: QOJ7895, lazy shift, `O(min(k,x/k) min(k,y/k))`, `k²`, Editorial #505
  - desc: Partial, source-checked linear-amortization proof for sparse tree-DP merging.
  - learnings: Large-large merge case is O(n); still charge other size ranges and real container work.
- Chain DP and midpoint preprocessing: `(s - 2, min(x, y) - 1)`, `f_1(t)`, B[p][v], C[u][p], `O(nk²log n)`
  - desc: Class-predecessor reduction plus exact divide-and-conquer scan recurrences; chain-head initialization remains unfinished.
  - learnings: “Linear” midpoint preparation is linear in positions, not per-element cost: updates are O(k²).

#### 2026-10-24

- P11234 and crystal tutoring: P11234, 擂台游戏, b, q, G123914, P11089, oi-training
  - desc: Competition-tree amortized review and the protocol for starting a new stepwise OI explanation.
  - learnings: Establish the user’s own reasoning before giving a hint; classify the P11234 bound as amortized.

### C:\Users\605\Documents\Codex\2026-10-18\d / Windows desktop

#### 2026-10-26

- Vitrite Fixed and Endfield UIPI: Ctrl+Shift+0, SetLayeredWindowAttributes, SetWindowLongPtrW, error 5, UnityWndClass
  - desc: Routes Windows transparency shortcut/rewrite troubleshooting; cwd=C:\Users\605\Documents\Codex\2026-10-14\w.
  - learnings: Direct alpha=255 restored Milthm; Endfield no-op style writes returned access denied from medium integrity. An elevated retry, then windowed/borderless validation, remains unperformed.

#### 2026-10-25

- One-time Windows sleep: ScheduledTask, SetSuspendState, SeShutdownPrivilege, Get-ScheduledTaskInfo
  - desc: Safe one-time sleep scheduling and the verification boundary.
  - learnings: Registration/privilege checks do not prove the computer slept; inspect task history and observed state.

### C:\Users\605\Documents\Codex\2026-10-22\new-chat / research chats

#### 2026-10-26

- NetEase ordering and Arknights 界园 parameter presets: popularity=100, order=hot, 评论数, 参数预设, 启用参数, 种子
  - desc: Routes platform-order research and the historical integrated-strategy seed-entry question; cwd=C:\Users\605\Documents\Codex\2026-10-22\new-chat.
  - learnings: Retain the hot-work API order when `popularity=100`; comments do not explain it. 界园“参数预设” required a completed normal run but its 2026-03-03 time-limited feature has ended.

#### 2026-10-24

- BOF22 playlist-author audit: playlist 8483155610, api/v6/playlist/detail, api/song/detail, Credits
  - desc: Full 373-track extraction and conservative BOF22 cross-check.
  - learnings: Preserve ID-0 artists and validate candidates against official Credits/roles.

### Older Memory Topics

#### C:\Users\605\Documents\Codex\MAA OI Assistant!

- Contest collaboration and training records: [debug], 完整代码, 码风, 过了，总结记录吧, P8820, CF379F
  - desc: Persistent C++/teaching defaults, training evidence rules, P8820 k=3 shields, and dynamic-tree-diameter practice; cwd=C:\Users\605\Documents\Codex\MAA OI Assistant!.

#### C:\Users\605\Documents\Codex\MAA Arknights Assistant!

- MAA Copilot adaptation: prts://104914, TW-EX-7, 塞雷娅, range_table.json, OperatorMissing
  - desc: Roster/job adaptation and measured range/runtime constraints; cwd=C:\Users\605\Documents\Codex\MAA Arknights Assistant!.

#### Windows/Codex desktop/research chats

- Vitrite, GPU, sync, and redirect research: Vitrite Fixed, `Ctrl+Shift+0`, UIPI, RX550, DxDiag, aha.wasm, location.replace
  - desc: Window-opacity/UIPI diagnostic path, GPU recovery evidence, credential-safe sync scope, and client-side redirect analysis; cwd=Windows desktop/Codex desktop/research chats.

#### Cross-workflow Google Drive

- Retired local-sync path: H:\我的云端硬盘, connected Google Drive, CKK, Gemini, Google AI Studio
  - desc: Local mount is obsolete; search/list/read through connected Drive interfaces. [ad-hoc note]

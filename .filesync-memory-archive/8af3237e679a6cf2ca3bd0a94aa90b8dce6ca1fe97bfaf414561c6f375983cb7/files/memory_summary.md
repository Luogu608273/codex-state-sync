v1

## User Profile

- Chinese-speaking competitive-programming user who values exact state/transition semantics, checked complexity, and evidence-grounded debugging.
- Uses contest-style C++, persistent OI training records, Codex for Windows/MAA work, and connected Google Drive for code/material delivery.
- Distinguishes local compile/static/random validation from official evaluation. The retired local Drive sync mount is not a current route. [ad-hoc note]

## User preferences

- For OI [hint] or ongoing tutoring, establish the current derivation/card point if unknown; give exactly one advancing hint/invariant and wait. Continue from the present sticking point; do not reveal a full solution, repeat understood setup, or alter training records unless asked.
- For [debug], retain the approach and code style, explain concrete faults, make minimal edits, and return modified complete code.
- Follow the user’s contest C++ conventions; avoid unrelated modernization. For self-authored contest materials, use Chinese and include proof, complexity, and clearly-labelled partial coverage.
- On “过了，总结记录吧”, update the training record/review and distinguish prompt-assisted AC from independent mastery.
- Respect literal boundaries: “是/否”, “只找原题”, “不要给思路”, “暂不修改训练记录”.
- For a derivation/complexity claim, show state definitions, surviving candidates, transitions, and charged operations; never call an amortized argument worst-case O(1) or a partial proof complete.
- For “全部查一遍”, provide full traceable coverage and mark confirmed/pending/not-found; weak matching is not fact.
- When a request could mean either downloading materials or writing them, confirm the intended artifact once; for explicit upload tasks, report local validation separately from official AC/score.
- Do not make extra backups for non-ignored Git files. Use connected Google Drive search/list/read rather than `H:\我的云端硬盘`. [ad-hoc note]

## General Tips

- Use Chinese for contest work. Verify original constraints/primary editorials before accepting historical algorithm claims.
- Preserve evidence levels: local/random validation is not official AC; Drive delivery is complete only after file-by-file read-back.
- For functional mapping graphs, target-side indegree determines spare characters; process indegree-zero roots before residual cycles.
- For current web, hardware, rankings, and app state, inspect current primary evidence and state uncertainty; preserve platform/API order when a public score is tied instead of inventing a proxy rank.
- For MAA/GPU/Vitrite diagnosis, begin read-only and verify real runtime use with logs plus DxDiag/DXGI; UIPI error 5 means test at matching/elevated integrity.

## What's in Memory

### C:\Users\605\Documents\Codex\MAA OI Assistant!

#### 2026-10-27

- ZR2-6 four-problem solution authoring and Drive delivery: ZR2-6, contest-2225, utopia, road, moment, passerby, std.cpp, partial.cpp, solution.md, `ALL PASS`, `FILE IO PASS 8`, `STRESS PASS`
  - desc: Self-authored Zhengrui #2225 materials in `work/ZR2-6`, then verified Google Drive upload; search first for a similar write/validate/upload task.
  - learnings: Login is needed before reading Zhengrui content; inspect Downloads after a timed-out download event; read back every uploaded file and never turn local validation into official score/AC.
- Project/global coding rules: AGENTS.md, [debug], 完整代码, 码风, 云端硬盘/CKK, .gitignore, Git, 备份
  - desc: Persistent MAA OI Assistant defaults for full-code debugging, learning the user’s style, Drive access, and Git-aware backup behavior.
  - learnings: Use connected Google Drive rather than the retired mount; successful edits require re-reading the actual target.
- QOJ7895 and CF453E one-hint continuations: QOJ7895, `O(min(k,x/k) * min(k,y/k))`, `k^2`, Editorial #505, CF453E, `s_i`, `r_i=0`, ODT
  - desc: Current partial OI teaching notes for sparse tree-DP amortization and timestamp-segment initialization.
  - learnings: QOJ large-large merges are only one proof case; CF453E must distinguish never-cleared from cleared-at-`t_0` state.

#### 2026-10-26

- P9013 Find and Replace S debug: P9013, mapping, DFS, in[target], indegree-zero, `abc -> baa`, PASS: 450 cases
  - desc: Corrected the user’s functional-graph C++ approach and added local brute-force validation; search first for similar transform/cycle accounting bugs.
  - learnings: Count incoming target vertices and traverse roots before residual cycles; local PASS is not an online submission.
- CF455D block-list tutoring and Chain DP/midpoint preprocessing: CF455D, `2B+1`, `B+(B+1)`, `(s - 2, min(x, y) - 1)`, `O(nk²log n)`
  - desc: One-hint block-list continuation plus exact class-predecessor and divide-and-conquer scan recurrences.
  - learnings: Account for q insertions in CF455D; “linear” midpoint preparation is linear in positions, not per-element state-update cost.

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
- Algorithm derivations and complexity qualification: P11234, QOJ7895, competition tree, lazy shift, merge cost, `O(min(k,x/k) min(k,y/k))`
  - desc: Exact state semantics and qualified amortized-complexity proofs; cwd=C:\Users\605\Documents\Codex\MAA OI Assistant!.

#### C:\Users\605\Documents\Codex\MAA Arknights Assistant!

- MAA Copilot adaptation: prts://104914, TW-EX-7, 塞雷娅, range_table.json, OperatorMissing
  - desc: Roster/job adaptation and measured range/runtime constraints; cwd=C:\Users\605\Documents\Codex\MAA Arknights Assistant!.

#### Windows/Codex desktop/research chats

- Vitrite, GPU, sync, and redirect research: Vitrite Fixed, `Ctrl+Shift+0`, UIPI, RX550, DxDiag, aha.wasm, location.replace
  - desc: Window-opacity/UIPI diagnostic path, GPU recovery evidence, credential-safe sync scope, and client-side redirect analysis; cwd=Windows desktop/Codex desktop/research chats.

#### Cross-workflow Google Drive

- Drive routing and verified delivery: connected Google Drive, CKK, google-drive-verified-delivery, `H:\我的云端硬盘`
  - desc: Use connected Drive interfaces, not the retired mount; the reusable delivery procedure is in `skills/google-drive-verified-delivery/SKILL.md`. [ad-hoc note]

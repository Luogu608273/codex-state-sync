v1

## User Profile

- Chinese-speaking competitive-programming user who values precise state/transition semantics, qualified complexity proofs, and evidence-grounded debugging.
- Uses contest C++, persistent OI training records, Codex for Windows/MAA utilities, and connected Google Drive for requested material delivery.
- Distinguishes local compile/brute-force/stress validation, user-reported AC, and official evaluation; prompt-assisted completion is not independent mastery.

## User preferences

- For OI tutoring, first establish the current derivation/card point; use Chinese, give exactly one advancing hint/invariant, then wait. Do not reveal a full solution, repeat understood setup, or change training records unless asked.
- For `[debug]`, keep the user’s approach and style, identify concrete faults, make minimal changes, and return complete modified code.
- On “过了，总结记录吧”, stop teaching and update the existing record/review; preserve “提示后/订正” versus independent mastery and do not invent code/judge evidence.
- For a proof gap such as “问题在于单点修改怎么证明”, address the exact gap with state definitions and charged operations instead of repeating the algorithm.
- Respect literal limits such as “是/否”, “只找原题”, “不要给思路”, and “暂不修改训练记录”.
- Follow the user’s contest-C++ conventions; do not gratuitously modernize. For self-authored materials, use Chinese and include correctness, complexity, and explicitly bounded partial coverage.
- Do not create extra backups for non-ignored Git files. Use connected Google Drive search/list/read rather than the retired `H:\我的云端硬盘` sync mount. [ad-hoc note]
- Keep generated `.in` and `.exe` out of the Codex tree; use `C:\Users\605\Documents\Output` with task subdirectories.
- For Windows window tools, avoid activating the target window unless the user asks to confirm it; preserve exact requested product naming and implement “100% opacity” as Alpha=255.

## General Tips

- For OI work, use Chinese and retain exact invariants, boundary semantics, and complexity qualification; conceptual validation is not an implementation test.
- Training truth is in `outputs/训练记录.md`, `outputs/训练档案.md`, and `outputs/复盘/`; update a previous entry rather than duplicating a later AC report.
- For minimal representation, preserve the exact tie rule `min(i,j)` and distinguish user-reported AC from an independently inspected submission.
- For Drive delivery, compile/test locally, upload only as requested, then read back every uploaded file; report local evidence separately from online judgment.
- In multi-case DP/debugging, name every index’s semantic role first; audit empty containers, first elements, binary-search `end()`, empty ranges, and state reset.
- For a file migration, tolerate directories disappearing during enumeration; hash before/after, confirm source disappearance, and report the manifest/count rather than claiming success from a move alone.
- For Qt-hosted windows such as MuMu, a read-back `WS_EX_LAYERED` alpha is not enough: use the app's Qt opacity API when its framework overwrites native styles; test visual behavior and restore paths for flicker.

## What's in Memory

### C:\Users\605\Documents\Codex\2026-10-29\mumu

#### 2026-10-30

- MuMu virtrite 2 transparency utility: MuMuPlayer, Qt 5.15.6, MuMuQtBridge.dll, `QWidget::setWindowOpacity`, `Alpha=255`, boss key
  - desc: Stable MuMu/normal-window opacity utility, restore-to-100% behavior, boss-key restoration, and verified ZIP packaging; use only after checking current MuMu/Qt paths and behavior.
  - learnings: MuMu overwrites direct layered-style changes; call Qt opacity on its GUI thread and repair during lifecycle messages, not with a polling loop that flickers.

### C:\Users\605\Documents\Codex\MAA OI Assistant!

#### 2026-10-30

- CF455D prompt-assisted AC record: CF455D, Serega and Fun, `2B+1`, `B` and `B+1`, `lastans`, 训练记录
  - desc: One-hint-at-a-time block-list tutoring followed by evidence-bound record/review updates; use for split-count complexity and status maintenance.
  - learnings: Only splitting means block count depends on `q`, not just `n/B`; AC is user feedback and neither final code nor judge record was inspected.
- P13270 minimal representation record: P13270, 最小表示法, `min(i,j)`, 双指针, `i+j`, outputs/复盘/2026-10-28-P13270-最小表示法.md
  - desc: Prompt-assisted, user-reported AC was recorded in the review, training record, and profile; use for the exact elimination boundary and record-maintenance standard.
  - learnings: Eliminate through `起点+l`, use old pointer values when swapping, and charge a comparison round to `i+j` growth; final code/judge record was not inspected.

#### 2026-10-29

- Four C++ contest-code `[debug]` repairs: P4503, P4802, P11267, P10526, double hash, subset DP, binary lifting, Trie
  - desc: Minimal-change, complete-code debugging in `cwd=C:\Users\605\Documents\Codex\MAA OI Assistant`; search this topic for concrete correctness/bounds/complexity counterexamples.
  - learnings: P4503 needs double-hash deletion keys; P4802 ends at `max_j f[n-1][j]`; P11267 must check the current cycle's left `1`; P10526 must support root completion and avoid invalid Trie transitions. All builds/local checks passed, but there was no online submission.
- CF453E initialization-state tutoring: CF453E, `s_i`, `r_i=0`, ODT, timestamp segments, `min(m_i,s_i+r_i t)`
  - desc: Minimal-change block-decomposition debug and evidence-bound training record in `cwd=C:\Users\605\Documents\Codex\MAA OI Assistant!`.
  - learnings: Cast before `k[j] * (t-tim[j])`; never-cleared and cleared positions have distinct formulas, and `k_i=0` precludes division.
- QOJ7895 merge-tree amortized complexity: QOJ7895, merge tree, `x+y<k^2`, point-pair counting, `O(min(k,x/k) min(k,y/k))`
  - desc: Tree-DP merge-cost proof continuation; search first for the three threshold ranges and the user’s boundary-condition questions.
  - learnings: Only both-sides-large merges have the `O(n/k^2)` count; cross-threshold charges go to the small side, while small-total merges charge point pairs. Container operations are still open.
- Codex build-artifact placement: `.in`, `.exe`, `Documents/Output`, SHA-256, `文件迁移清单-2026-10-29-399d3501.csv`
  - desc: Persistent coding/file-handling defaults plus the verified relocation of generated inputs and executables; use before compiling or creating test data in this workspace.
  - learnings: `.in`/`.exe` must live under `C:\Users\605\Documents\Output`, never the Codex tree; 303 legacy files were moved and SHA-256 verified.

#### 2026-10-28

- CF438D prompt-assisted AC record: CF438D, point assignment, `O((n+q)log V)`, segment tree
  - desc: Range-modulo segment-tree amortization proof and evidence-bound training-record maintenance.
  - learnings: Treat AC as user feedback unless submission evidence was inspected. CF438D restarts an `O(log V)` budget per assignment.
- G123913 connected-graph DP debug and record: G123913, Minimizing Edges, `suf[lst+1]`, `lower_bound`, 多测清空
  - desc: Complete-code layered-DP correction with exhaustive small-graph and stress validation, followed by prompt-assisted AC record maintenance.
  - learnings: Separate layer/class-index/distance-coordinate/class-size roles; empty suffix queries require `suf[lst+1]`. Online AC remains user feedback.

#### 2026-10-27

- ZR2-6 four-problem solution authoring and Drive delivery: ZR2-6, contest-2225, std.cpp, partial.cpp, solution.md, `ALL PASS`, `FILE IO PASS 8`, `STRESS PASS`
  - desc: Self-authored Zhengrui #2225 materials in `work/ZR2-6`, then verified Google Drive upload; route similar write/validate/upload work here.
  - learnings: Login is required before reading Zhengrui content; check Downloads after a timed-out event; all 13 uploaded files were read back, but no online submission occurred.
- G123914 Crystal tutoring entry point: G123914, P11089, crystal, 一次只给一个推进提示
  - desc: Entry point only: await the user’s current derivation, state, code, or exact blockage before teaching.
  - learnings: Historical score or prompt facts are not evidence of current independent reasoning.

### C:\Users\605\Documents\Codex\MAA Arknights Assistant!

#### 2026-10-23

- MAA Copilot adaptation and runtime configuration: TW-EX-7, range_table.json, OperatorMissing, RX550
  - desc: Roster/job adaptation plus runtime/GPU evidence; recheck live logs and assets before reuse.
  - learnings: Static validation does not prove a raid clear.

### Windows/Codex desktop/research chats

#### 2026-10-29

- NetEase hot-song order and Arknights roguelike seeds: `popularity=100`, `/api/artist/top/song`, `order=hot`, 参数预设, 黑流树海, 机械师园圃
  - desc: Research on true NetEase server ordering when displayed popularity ties, plus the two distinct meanings of Arknights roguelike “seed”; cwd=C:\Users\605\Documents\Codex\2026-10-22\new-chat.
  - learnings: Preserve server `order=hot` rather than substitute comments; old 界园 parameter presets closed in March 2026, while 黑流树海 natural seeds are cultivated at 机械师园圃.

#### 2026-10-26

- Vitrite, GPU, Codex sync, and one-time sleep: UIPI, SetWindowLongPtrW, error 5, ScheduledTask, SetSuspendState
  - desc: Desktop diagnosis and one-time power scheduling, all dependent on current machine state.
  - learnings: Confirm actual runtime/observed sleep, not registration or a style-write result alone.

### Older Memory Topics

#### C:\Users\605\Documents\Codex\MAA OI Assistant!

- Contest collaboration and records: [debug], 完整代码, 码风, 过了，总结记录吧, outputs/训练记录.md
  - desc: Persistent coding, tutoring, and evidence-bound record-maintenance defaults; cwd=C:\Users\605\Documents\Codex\MAA OI Assistant!.
- P9013 mapping/DFS debug: P9013, indegree-zero, `abc -> baa`, `PASS: 450 cases`
  - desc: Functional-mapping cycle accounting; use for target-side indegrees and residual-cycle traversal order; cwd=C:\Users\605\Documents\Codex\MAA OI Assistant!.
- P11234 and midpoint complexity qualification: P11234, `b_p=min(R,b_v)`, divide-and-conquer, `O(nk²log n)`
  - desc: Contest derivations requiring exact candidates/states and amortized—not worst-case—claims; cwd=C:\Users\605\Documents\Codex\MAA OI Assistant!.

#### C:\Users\605\Documents\Codex\MAA Arknights Assistant!

- Copilot adaptation: prts://104914, GO-EX-7, 塞雷娅, range_table.json
  - desc: Job adaptation and range/precheck debugging; cwd=C:\Users\605\Documents\Codex\MAA Arknights Assistant!.

#### Windows/Codex desktop/research chats

- NetEase, BOF22, redirects, and Drive routing: playlist 8483155610, api/song/detail, aha.wasm, connected Google Drive
  - desc: Research/source-verification procedures and Drive routing; the retired mount is not a current access route. [ad-hoc note]

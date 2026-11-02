v1

## User Profile

- Chinese-speaking competitive-programming user who values precise state/transition semantics, qualified complexity proofs, and evidence-grounded debugging.
- Uses contest C++, persistent OI training records, Codex for Windows/MAA work, and connected Google Drive for requested material delivery.
- Distinguishes local compile/brute-force/stress validation, user-reported AC, and official evaluation; prompt-assisted completion is not independent mastery.

## User preferences

- For OI tutoring, first establish the current derivation/card point; use Chinese, give exactly one advancing hint/invariant, then wait. Do not reveal a full solution, repeat understood setup, or change training records unless asked.
- When context is too long and the user says "别 fork 了…考虑开新对话吧", start an independent chat carrying only the statement and the requested one-hint-at-a-time teaching constraints.
- For `[debug]`, keep the user’s approach and style, identify concrete faults, make minimal changes, and return complete modified code.
- On “过了，总结记录吧”, stop teaching and update the existing record/review; preserve “提示后/订正” versus independent mastery and do not invent code/judge evidence.
- For a proof gap such as “问题在于单点修改怎么证明”, address the exact gap with state definitions and charged operations instead of repeating the algorithm.
- Respect literal limits such as “是/否”, “只找原题”, “不要给思路”, and “暂不修改训练记录”.
- Follow the user’s contest-C++ conventions; do not gratuitously modernize. For self-authored materials, use Chinese and include correctness, complexity, and explicitly bounded partial coverage.
- Do not create extra backups for non-ignored Git files. Use connected Google Drive search/list/read rather than the retired `H:\我的云端硬盘` sync mount. [ad-hoc note]

## General Tips

- For OI work, use Chinese and retain exact invariants, boundary semantics, and complexity qualification; conceptual validation is not an implementation test.
- Training truth is in `outputs/训练记录.md`, `outputs/训练档案.md`, and `outputs/复盘/`; update a previous entry rather than duplicating a later AC report.
- For minimal representation, preserve the exact tie rule `min(i,j)` and distinguish user-reported AC from an independently inspected submission.
- For Drive delivery, compile/test locally, upload only as requested, then read back every uploaded file; report local evidence separately from online judgment.
- In multi-case DP/debugging, name every index’s semantic role first; audit empty containers, first elements, binary-search `end()`, empty ranges, and state reset.

## What's in Memory

### C:\Users\605\Documents\Codex\MAA OI Assistant!

#### 2026-10-29

- QOJ7895 merge-tree amortized complexity: QOJ7895, merge tree, `x+y<k^2`, point-pair counting, `O(min(k,x/k) min(k,y/k))`
  - desc: Tree-DP merge-cost proof continuation; search first for the three threshold ranges and the user’s boundary-condition questions.
  - learnings: Only both-sides-large merges have the `O(n/k^2)` count; cross-threshold charges go to the small side, while small-total merges charge point pairs. Container operations are still open.

#### 2026-10-28

- P13270 minimal representation record: P13270, 最小表示法, `min(i,j)`, 双指针, `i+j`, outputs/复盘/2026-10-28-P13270-最小表示法.md
  - desc: Prompt-assisted, user-reported AC was recorded in the review, training record, and profile; use for the exact elimination boundary and record-maintenance standard.
  - learnings: Eliminate through `起点+l`, use old pointer values when swapping, and charge a comparison round to `i+j` growth; final code/judge record was not inspected.
- CF455D and CF438D prompt-assisted AC records: CF455D, `2B+1`, `B` and `B+1`, CF438D, point assignment, `O((n+q)log V)`
  - desc: Updated training records for a block-list solution and a range-modulo segment-tree amortization proof; use for evidence-bound record maintenance.
  - learnings: Treat AC as user feedback unless submission evidence was inspected. CF438D restarts an `O(log V)` budget per assignment; CF455D block-count analysis must include `q`, split moves, and frequency-table costs.
- Incremental OI coaching and context splitting: 主席树, `g(x)(1+x^w)=f(x)`, 循环移位字典序最小, `floor(n/i)`, 一次只给一个推进提示
  - desc: Short derivation checks plus an interrupted tutoring handoff; route here for the mex invariant, O(W) subset-sum deletion, or requested new-chat teaching mode.
  - learnings: Validate a user-supplied core derivation concisely; the source rollout did not solve minimal rotation or floor-division grouping.

#### 2026-10-27

- ZR2-6 four-problem solution authoring and Drive delivery: ZR2-6, contest-2225, std.cpp, partial.cpp, solution.md, `ALL PASS`, `FILE IO PASS 8`, `STRESS PASS`
  - desc: Self-authored Zhengrui #2225 materials in `work/ZR2-6`, then verified Google Drive upload; route similar write/validate/upload work here.
  - learnings: Login is required before reading Zhengrui content; check Downloads after a timed-out event; all 13 uploaded files were read back, but no online submission occurred.
- G123913 connected-graph DP debug and record: G123913, Minimizing Edges, 前后缀最小值, lower_bound, 多测清空
  - desc: Complete-code layered-DP correction with exhaustive small-graph and stress validation, followed by prompt-assisted AC record maintenance.
  - learnings: Separate layer/class-index/distance-coordinate/class-size roles; empty suffix queries require `suf[lst+1]`.
- G123914 Crystal tutoring entry point: G123914, P11089, crystal, 一次只给一个推进提示
  - desc: Entry point only: await the user’s current derivation, state, code, or exact blockage before teaching.
  - learnings: Historical score or prompt facts are not evidence of current independent reasoning.

#### 2026-10-26

- P9013 mapping/DFS debug and CF453E hint: P9013, indegree-zero, `abc -> baa`, `PASS: 450 cases`, CF453E, `s_i`, `r_i=0`
  - desc: Functional-mapping cycle accounting and a separate timestamp initialization-state tutoring continuation.
  - learnings: Count target-side indegrees and process roots before residual cycles; distinguish never-cleared from cleared resource formulas.

#### 2026-10-24

- P11234 and midpoint complexity qualification: P11234, `b_p=min(R,b_v)`, divide-and-conquer, `O(nk²log n)`
  - desc: Contest derivations that require exact candidates/states and amortized—not worst-case—claims.
  - learnings: Charge actual state updates and preserve the stated complexity qualifier.

### C:\Users\605\Documents\Codex\MAA Arknights Assistant!

#### 2026-10-23

- MAA Copilot adaptation and runtime configuration: TW-EX-7, range_table.json, OperatorMissing, RX550
  - desc: Roster/job adaptation plus runtime/GPU evidence; recheck live logs and assets before reuse.
  - learnings: Static validation does not prove a raid clear.

### Windows/Codex desktop/research chats

#### 2026-10-26

- Vitrite, GPU, Codex sync, and one-time sleep: UIPI, SetWindowLongPtrW, error 5, ScheduledTask, SetSuspendState
  - desc: Desktop diagnosis and one-time power scheduling, all dependent on current machine state.
  - learnings: Confirm actual runtime/observed sleep, not registration or a style-write result alone.

### Older Memory Topics

#### C:\Users\605\Documents\Codex\MAA OI Assistant!

- Contest collaboration and records: [debug], 完整代码, 码风, 过了，总结记录吧, outputs/训练记录.md
  - desc: Persistent coding, tutoring, and evidence-bound record-maintenance defaults; cwd=C:\Users\605\Documents\Codex\MAA OI Assistant!.

#### C:\Users\605\Documents\Codex\MAA Arknights Assistant!

- Copilot adaptation: prts://104914, GO-EX-7, 塞雷娅, range_table.json
  - desc: Job adaptation and range/precheck debugging; cwd=C:\Users\605\Documents\Codex\MAA Arknights Assistant!.

#### Windows/Codex desktop/research chats

- NetEase, BOF22, redirects, and Drive routing: playlist 8483155610, api/song/detail, aha.wasm, connected Google Drive
  - desc: Research/source-verification procedures and Drive routing; the retired mount is not a current access route. [ad-hoc note]

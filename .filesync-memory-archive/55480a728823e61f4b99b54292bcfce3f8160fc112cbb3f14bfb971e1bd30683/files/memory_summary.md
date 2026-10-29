v1

## User Profile

- Chinese-speaking competitive-programming user who values precise state/transition semantics, qualified complexity proofs, and evidence-grounded debugging.
- Uses contest C++, persistent OI training records, Codex for Windows/MAA work, and connected Google Drive for requested material delivery.
- Distinguishes local compile/brute-force/stress validation, user-reported AC, and official evaluation; prompt-assisted completion is not independent mastery.

## User preferences

- For OI tutoring, first establish the current derivation/card point; use Chinese, give exactly one advancing hint/invariant, then wait. Do not reveal a full solution, repeat understood setup, or change training records unless asked.
- For `[debug]`, keep the user’s approach and style, identify concrete faults, make minimal changes, and return complete modified code.
- On “过了，总结记录吧”, stop teaching and update the existing record/review; preserve “提示后/订正” versus independent mastery and do not invent code/judge evidence.
- For a proof gap such as “问题在于单点修改怎么证明”, address the exact gap with state definitions and charged operations instead of repeating the algorithm.
- Respect literal limits such as “是/否”, “只找原题”, “不要给思路”, and “暂不修改训练记录”.
- Follow the user’s contest-C++ conventions; do not gratuitously modernize. For self-authored materials, use Chinese and include correctness, complexity, and explicitly bounded partial coverage.
- Do not create extra backups for non-ignored Git files. Use connected Google Drive search/list/read rather than the retired `H:\我的云端硬盘` sync mount. [ad-hoc note]

## General Tips

- For OI work, use Chinese and retain exact invariants, boundary semantics, and complexity qualification; conceptual validation is not an implementation test.
- Training truth is in `outputs/训练记录.md`, `outputs/训练档案.md`, and `outputs/复盘/`; update a previous entry rather than duplicating a later AC report.
- For Drive delivery, compile/test locally, upload only as requested, then read back every uploaded file; report local evidence separately from online judgment.
- In multi-case DP/debugging, name every index’s semantic role first; audit empty containers, first elements, binary-search `end()`, empty ranges, and state reset.

## What's in Memory

### C:\Users\605\Documents\Codex\MAA OI Assistant!

#### 2026-10-27

- Persistent segment-tree mex and subset-sum deletion: persistent-segment-tree, last-occurrence, `g[i]=f[i]-g[i-w]`, Booth-algorithm
  - desc: Conceptual algorithm drill: value-domain prefix versions for mex and the direct O(W) generating-function deletion recurrence; use before opening the full handbook for either derivation.
  - learnings: Latest occurrence `<l` means absent from `[l,r]`; minimal cyclic rotation remained unanswered and needs a linear Booth-style explanation with smallest-index ties.
- ZR2-6 four-problem solution authoring and Drive delivery: ZR2-6, contest-2225, std.cpp, partial.cpp, solution.md, `ALL PASS`, `FILE IO PASS 8`, `STRESS PASS`
  - desc: Self-authored Zhengrui #2225 materials in `work/ZR2-6`, then verified Google Drive upload; route similar write/validate/upload work here.
  - learnings: Login is required before reading Zhengrui content; check Downloads after a timed-out event; all 13 uploaded files were read back, but no online submission occurred.
- G123913 connected-graph DP debug and record: G123913, Minimizing Edges, 前后缀最小值, lower_bound, 多测清空
  - desc: Complete-code layered-DP correction with exhaustive small-graph and stress validation, followed by prompt-assisted AC record maintenance.
  - learnings: Separate layer/class-index/distance-coordinate/class-size roles; empty suffix queries require `suf[lst+1]`.
- CF438D point-assignment amortized proof: CF438D, range modulo, point assignment, potential method, max pruning
  - desc: Segment-tree modulo pruning and the proof that assignments replenish only one position’s O(log V) budget.
  - learnings: Partition each position at assignments; do not claim global O(log V) changes per index.
- CF455D and G123914 tutoring status: CF455D, 提示后 AC, G123914, P11089, 一次只给一个推进提示
  - desc: CF455D was revised from unfinished to user-reported prompt-assisted AC; Crystal remains an entry point waiting for the user’s derivation.
  - learnings: Stop explaining after “已经过了”; historical score or prompt facts are not evidence of current independent reasoning.

#### 2026-10-26

- P9013 mapping/DFS debug and CF453E hint: P9013, indegree-zero, `abc -> baa`, `PASS: 450 cases`, CF453E, `s_i`, `r_i=0`
  - desc: Functional-mapping cycle accounting and a separate timestamp initialization-state tutoring continuation.
  - learnings: Count target-side indegrees and process roots before residual cycles; distinguish never-cleared from cleared resource formulas.

#### 2026-10-24

- P11234, QOJ7895, and midpoint complexity qualification: P11234, QOJ7895, `O(min(k,x/k) min(k,y/k))`, `O(nk²log n)`
  - desc: Contest derivations that require exact candidates/states and amortized—not worst-case—claims.
  - learnings: Charge actual state products/container work; a proof of one merge-size case is not a full O(n) proof.

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

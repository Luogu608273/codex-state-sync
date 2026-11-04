v1

## User Profile

- Chinese-speaking competitive-programming user who values exact state semantics, qualified complexity proofs, and evidence-grounded debugging.
- Uses contest C++, persistent OI training records, Codex for Windows/MAA utilities, and both connected Google Drive and a user-specified local CKK sync folder for deliverables.
- Distinguishes local compile/brute-force/stress evidence, user-reported AC, and official evaluation; prompt-assisted completion is not independent mastery.

## User preferences

- For OI tutoring, first establish the current derivation/card point; use Chinese, give exactly one advancing hint/invariant, then wait. Continue from the user's symbols/state rather than re-teaching the whole problem.
- For `[debug]`, preserve the user’s approach and style for fixable code faults; but once the approach itself is confirmed wrong, report “做法不正确” with a reason/counterexample and stop—do not switch approaches or send a replacement solution.
- On “过了，总结记录吧”, stop teaching and update the existing record/review; preserve “提示后/订正” versus independent mastery and do not invent code/judge evidence.
- Respect literal limits such as “是/否”, “只找原题”, “不要给思路”, and “暂不修改训练记录”.
- Follow the user’s contest-C++ conventions. Self-authored materials need Chinese proof, complexity, and explicitly bounded partial coverage; interactive deliverables should retain a compilable C++ `.cpp` SPJ and run notes.
- Keep generated `.in` and `.exe` under `C:\Users\605\Documents\Output`, outside the Codex tree.
- The old `H:\我的云端硬盘` mount is retired; use connected Google Drive unless the user specifies another current destination, such as `C:\Users\605\我的云端硬盘\CKK`. [ad-hoc note]
- For Windows window tools, avoid activating the target window unless asked to confirm it; preserve exact requested product naming and implement “100% opacity” as Alpha=255.

## General Tips

- For derivations, retain exact invariants, boundary semantics, and complexity qualification; a sound derivation is not an implementation test.
- Before editing a similarly named project path, locate the real target file; the `MAA OI Assistant!` rollout cwd differed from the actual `MAA OI Assistant\AGENTS.md`.
- Training truth is in `outputs/训练记录.md`, `outputs/训练档案.md`, and `outputs/复盘/`; revise earlier entries rather than duplicating later AC feedback.
- For contest delivery, compile each program, run samples plus appropriate independent/file-IO/interactor checks, then use SHA-256/read-back verification appropriate to the destination. Report local evidence separately from official judgment.
- In multi-case DP/debugging, give every index one semantic role and audit empty containers, first elements, binary-search `end()`, empty ranges, and state reset.
- For Qt-hosted windows such as MuMu, native layered-style read-back is insufficient when Qt resets it: use the app's Qt opacity API and visually test lifecycle/restore paths for flicker.

## What's in Memory

### C:\Users\605\Documents\Codex\MAA OI Assistant*

#### 2026-11-03

- Debug-stop rule and Codex build-artifact migration: AGENTS.md, 做法不正确, stop debugging, Documents/Output, SHA256
  - desc: Current project/global behavior rule plus the verified `.in`/`.exe` placement constraint; search first before debugging an invalid approach or writing generated artifacts.
  - learnings: Confirmed-wrong approach means report the reason/counterexample and stop; 303 migrated files were SHA-256 verified outside the Codex tree.

#### 2026-11-02

- Zhengrui ZR2-4/6/7/8/9 local CKK delivery and C++ SPJ: 正睿, ZR2-4, ZR2-9, `std.cpp`, `partial.cpp`, `solution.md`, `spj.cpp`, CKK
  - desc: Five-contest, 20-problem package delivered to `C:\Users\605\我的云端硬盘\CKK`; search first for required layout, compilation/interactor checks, and C++ SPJ artifacts.
  - learnings: 78 files passed SHA-256 read-back; `check` random behavior is not an 8-round proof, while the deterministic partial certificate is 9 rounds.
- CSP-S 2026 T4 研发基地 stepwise tutoring: P17834, hub, `f_{u,s,d,k,1/2}`, 固定半径, 二分答案, 状态压缩
  - desc: One-hint continuation from an existing O(n^4) tree DP; use for the fixed-radius/minimum-selected-count reduction.
  - learnings: Confirm the shorthand/actual problem first; next prompt is to move selected count from the state dimension to the DP value.
- P17833 迁徙 prompt-assisted AC review: P17833, 迁徙, pre, suf, L_b=a, R_{b+1}=c, 桶统计
  - desc: Training-record update and the path-count state compression; use when reviewing the hint-assisted solution or explaining its O(n) aggregation.
  - learnings: Direct `(pre_a+1)(suf_c+1)` misses the splice constraints; user-reported AC is not implementation or judge verification.

#### 2026-10-30

- Möbius inclusion-exclusion lexicographic binary construction: Möbius, `C(L)`, floor division, 连续0, 连续1, `r=T-k+1`, `u0`
  - desc: Safe per-term counting and ranking transformations for a binary lexicographic construction; implementation remains untested.
  - learnings: Never exchange floors with signed Möbius sums; use nonnegative staged division and test reverse ranking/terminal boundaries after coding.
- OI training records and mathematical proof review: CF455D, P13270, QOJ7895, `O((n+q)log V)`, merge tree
  - desc: Evidence-bound AC-record maintenance plus exact amortized-analysis shields; inspect before updating training artifacts or stating complexity.
  - learnings: User-reported AC is not inspected submission evidence; charge resettable per-position potential separately from persistent work.

### C:\Users\605\Documents\Codex\2026-10-29\mumu

#### 2026-10-30

- MuMu virtrite 2 transparency utility: MuMuPlayer, Qt 5.15.6, MuMuQtBridge.dll, `QWidget::setWindowOpacity`, Alpha=255
  - desc: Stable opacity controls, boss-key restoration, and ZIP packaging; recheck installed paths and runtime behavior first.
  - learnings: MuMu overwrites direct layered styles; apply Qt opacity on the GUI thread and repair lifecycle drift rather than polling.

### Older Memory Topics

#### C:\Users\605\Documents\Codex\MAA OI Assistant!

- Contest collaboration, training, and records: `完整代码`, `码风`, `outputs/训练记录.md`, one hint
  - desc: Persistent debugging, tutoring, record-maintenance, and C++ style defaults; includes P9013, CF379F, CF438D, G123913, Crystal, and problem-selection history.
- Four contest C++ debugging: `[debug]`, P4503, P4802, P11267, P10526, collision, Trie
  - desc: Use for minimal-change complete-code fixes and boundary-oriented validation; local builds/stress are not online AC.
- ZR2-6 Google Drive delivery: contest-2225, Google Drive, `ALL PASS`, `FILE IO PASS 8`, `STRESS PASS`
  - desc: Earlier remote-delivery workflow and `skills/google-drive-verified-delivery/SKILL.md`; use only when the user explicitly requests Google Drive upload.
- Algorithm derivations and complexity qualification: P11234, divide-and-conquer, QOJ7895, `O(nk²log n)`
  - desc: Exact-state derivations, midpoint preprocessing, and merge-tree amortization; use when a proof needs a concrete charging argument.

#### C:\Users\605\Documents\Codex\MAA Arknights Assistant!

- Copilot adaptation and runtime configuration: prts://104914, `range_table.json`, OperatorMissing, RX550
  - desc: Operator-range/job adaptation and runtime diagnosis; static validation does not prove a raid clear.

#### Windows/Codex desktop/research chats

- Windows graphics, power scheduling, and Codex: UIPI, `SetWindowLongPtrW`, ScheduledTask, `SetSuspendState`, RX550
  - desc: Transient desktop diagnosis and one-time sleep scheduling; check real observed execution/state.
- NetEase, BOF22, Arknights, and redirects: `order=hot`, playlist 8483155610, `aha.wasm`, 参数预设
  - desc: Evidence-led public-web research; preserve API order, validate credits manually, and distinguish removed historical features from current routes.

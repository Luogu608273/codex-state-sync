v1

## User Profile

- Uses Codex primarily for Chinese OI training in `MAA OI Assistant!`: interactive teaching, contest-C++ debugging, solution delivery, training records, and verified practice problems.
- Also uses evidence-first Windows/MAA troubleshooting, Copilot adaptation, Codex workspace management, and source-sensitive game/product research.
- Distinguishes user-reported AC, local/static validation, successful task registration, diagnostics, and confirmed root cause; reports must preserve that status.
- Uses connected Google Drive; the former `H:\我的云端硬盘` route is retired. [ad-hoc note]

## User preferences

- “中文回答，省略背景，每次只给一个推进提示，不直接给完整解法或代码”; wait for their derivation, then advance one observation/proof step.
- “过了，总结记录吧”: record method, sticking points, proof, validation, and prompted-vs-independent redo status; never call prompted AC mastery.
- For a requested next OI problem, give exactly one verified ID/link, difficulty, and formal statement—no rationale, algorithm label, solution, or key observation.
- For `[debug]` contest code, preserve their approach and style with minimal edits; check bounds, overflow, complexity, and exact counterexamples.
- “我不会这个，你在当前位置 fork 教我这道题” / “依旧 fork 然后本对话继续” -> fork a Chinese one-hint teaching chat and continue the main thread without waiting for it.
- “有任何异常（文件位置不对或者与描述不符），立刻停止并报告”; verify first and report mismatch/access limits before proceeding.
- For Copilot adaptation, update requirements, skills/modules, support, deployment, and explanation together; call map/range-only proposals pending live validation.
- Do not inspect or alter the Windows/MAA fault environment until the user explicitly says “继续排查”; do not state inference as confirmed root cause.

## General Tips

- Preserve evidence status; for contest-code fixes, use brute/differential checks and exact counterexamples where feasible.
- OI delivery baseline: TDM-GCC C++17 `-std=c++17 -O2 -Wall -Wextra`; test normal file I/O and `-DLOCAL`; local tests are not official AC.
- Google Drive delivery: confirm actual folder/ID, upload absolute local files, then metadata-readback and folder listing. See `skills/google-drive-verified-delivery/SKILL.md`.
- Closed binary-search count `[L,R]` is `upper_bound(R)-lower_bound(L)`; do not mix manual endpoint offsets.
- For source-sensitive rankings, distinguish API field values, API return order, and proxy metrics; for lore, mark official text, secondary sources, and player theory separately.
- `memories` is a nested Git repository (mode `160000` from its parent); exclude credentials/cache/SQLite live state from ordinary sync.

## What's in Memory

### C:\Users\605\Documents\Codex\MAA OI Assistant!

#### 2026-10-20

- Queue GCD forked teaching and CF1548B practice: queue gcd, two stacks, amortized O(1), CF1548B, range modulo
  - desc: One-hint queue-GCD teaching, a verified practice link, and the still-unanswered range-modulo prompt.
  - learnings: Store bottom-to-node gcd in each stack; every item has at most four stack actions; do not claim the range-modulo method was learned.
- Dynamic tree diameter and CF379F: tree diameter, CF379F, New Year Tree, LCA, binary lifting
  - desc: Dynamic leaf-insertion endpoint update and original-problem routing.
  - learnings: Compare old diameter and two new distances; the general farthest-endpoint proof remains incomplete.
- QOJ9903 shortest-path divide-and-conquer Floyd debugging: QOJ9903, Floyd, add, mp[i][j], vec, tvec, 2 -> 4 -> 3
  - desc: Minimal repair of the Floyd-state optimization and training recap.
  - learnings: `mp[i][j]` restricts intermediates only; `add(k)` still uses all endpoints, and recursive branches restore their common parent state.

### C:\Users\605\Documents\Codex\MAA Arknights Assistant!

#### 2026-10-20

- GO-EX-7 raid Copilot adaptation: prts://51044, GO-EX-7, act37side_ex07#f#, Makoto, copilot-51044, Python 3.8
  - desc: Static adaptation of a PRTS Plus job to user levels and Makoto deployment; separate from the unresolved Windows/MAA handoff.
  - learnings: Decode PRTS `content` again; convert rows with `y=height-1-row`; Python 3.8 cannot load the 3.10+ SDK; no live clear was verified.

### C:\Users\605\Documents\Codex\CHAT with GPT

#### 2026-10-20

- BOF22 ranking rules and current high-rated entries: BOF22, event=152, average, median, individual total, Ratio Points, FINAL STRIKER
  - desc: Official-data high-score shortlist, Tripcode/Delete Key, final-ranking formulas, and “个人战优胜”.
  - learnings: Current average shortlist is not an official final/personal-total ranking; timestamp and state the review floor.
- 网易云热门歌曲排序与明日方舟设定: artist_songs, order=hot, popularity=100, 克莱门莎, 伊莎玛拉, 非熵, 负熵
  - desc: API-order versus proxy-rank investigation and evidence-scoped Arknights lore.
  - learnings: Tied 100 fields cannot distinguish rank; formula remains undisclosed; non-entropy/negative-entropy claims were not traced to official wording.

### Older Memory Topics

#### C:\Users\605\Documents\Codex\MAA OI Assistant!

- Solution authoring and Drive delivery: solution.md, std.cpp, partial.cpp, CKK, Google Drive
  - desc: Chinese OI reference delivery, local validation, and metadata/listing-verified Drive uploads.
- Earlier OI training/debugging: CF436E, CF2276F, ABC091D, ARC092B, prompted AC, iterative DSU find
  - desc: Regret-greedy, DP/graph debugging, binary-search counts, formal recommendation limits, and recordkeeping.
- Divide-and-conquer DP explanation: B[p][v], C[u][p], O(nk^2 log n)
  - desc: Cross-midpoint states and accurate endpoint-scan complexity.
- C《组合技》 and D《最初的博弈》: AC自动机, 单提示, training record
  - desc: Prompted-AC recap and stepwise teaching setup.

#### C:\Users\605\Documents\Codex\MAA Arknights Assistant!

- Windows/MAA handoff: 继续排查, Radeon RX550, OperatorMissing, WPR 0xc5585011
  - desc: Machine-specific slowdown leads, formation preflight, and verified AMD selection; root cause remains unresolved.
- Windows performance/MAA diagnosis handoff: Shadow Defender, Kernel-Boot 16, WPR 0xc5585011
  - desc: Read-only, user-authorized investigation boundary and unresolved system-wide slowdown evidence.

#### C:\Users\605\Documents\Codex\CHAT with GPT

- Game research and reverse engineering: Blue Archive, rhythm game, random redirect, WASM, api.mihoyo.com
  - desc: Reverify time-sensitive facts and keep endpoint/version-specific conclusions bounded.

#### C:\Users\605\Documents\Codex and C:\Users\605\.codex

- Codex configuration and workspace migration: AGENTS.md, SHA256, quick_validate.py, gitlink 160000
  - desc: Safe OI migration, instruction-scope boundaries, and selective `.codex` synchronization.
- Codex desktop feature gates and one-time power scheduling: More details, scheduled task, SetSuspendState, -ValidateOnly
  - desc: Locate feature-gated UI behavior and safely register a one-time sleep; registration does not prove later sleep.

#### C:\Users\605\Documents\Codex\2026-10-14\w

- Vitrite transparency and UIPI: Ctrl+Shift+0, WS_EX_LAYERED, SetLayeredWindowAttributes, SameStyleWriteError=5
  - desc: Target-window hotkey diagnosis, standalone replacement, and privilege barrier.

#### Cross-workflow Google Drive access

- Retired local-sync path: Google Drive, connected Drive search
  - desc: Use connected Drive interfaces instead of the retired mounted route. [ad-hoc note]

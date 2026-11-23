v1

## User Profile

- Primarily works in Chinese on OI/C++ training and contest materials, alongside Windows, Minecraft/PCL, MAA Copilot, Arknights, game research, and local tooling.
- Uses Codex checkouts under `C:\Users\605\Documents\Codex`; commonly brings a derivation or partial/full code and expects work to continue from it.
- Values concrete artifacts and calibrated status: compilation/local tests, static checks, user-reported AC, and official AC are distinct.
- Keeps distinct game-account contexts and expects supplied roster data to remain account-specific.

## User preferences

- For OI teaching, preserve the user’s derivation and give one advancing hint/question in Chinese; challenge assertions with a concrete counterexample before accepting them, and do not disclose a full solution early.
- When a problem page shows a live timed contest, first ask whether it is a contest/simulation or off-contest learning; provide no solution hint until that is resolved.
- When discussing an LIS task, the user may supply the high-efficiency route directly (“二分求 LIS 的做法，正反各跑一遍”); start from the decisive criterion rather than a brute-force derivation.
- For viable C++ `[debug]`, retain the approach, make minimal changes, explain substantive defects, follow the user’s real code style, and give complete modified code. If the approach is wrong, explicitly say “做法不正确” with a reason/counterexample and stop.
- “过了，总结记录吧” means update the single-problem review plus training record/archive, preserving “提示后 AC/完成” versus independent mastery.
- Put generated `.in` and `.exe` under `C:\Users\605\Documents\Output`, not a Codex checkout.
- For FlClash subscription customization, use “扩展 → 脚本” overrides; “除了这个新增配置以外其他的全部保留” means append only the new group and priority rules.
- Use connected Google Drive to inspect code or deliver to Drive; do not infer a retired local sync path or make extra backups for Git-tracked, non-ignored files. [ad-hoc note]
- For small-account Arknights roster questions, first pin down unlock/transform state, recipient class/rank, “常态,” and whether training is allowed; never mix main-account data.
- For MAA Copilot edits, “合适的位置” means update deployment plus `opers`/requirements and validate legal tiles, skill semantics, deployment order, and stage mechanisms; report static checks separately from combat verification.

## General Tips

- Locate the actual `AGENTS.md` before editing: similarly named MAA OI/Arknights directories differ.
- State validation limits exactly; static/local tests do not prove a combat clear, deployment, or online AC.
- For interval/subset DP, check right sentinels, state indices, capacity, empty-set, singleton, and empty-interval semantics alongside the recurrence.
- For Windows service-handle diagnosis, collect elevated before/after memory/object/handle snapshots; high handles alone do not rank RAM impact.
- For Windows memory pressure, compare RAMMap `Driver Locked` with MuMu `debugvm` allocation before calling it a leak; `Unused`/`Zeroed`/`Free` pages are ordinarily reclaimable.
- For MAA Copilot and roster work, account state, game data, assets, and unlocks are time-specific; recheck before reuse and never store secrets.
- In multi-test constructive code, reset output-state structures as well as numeric state; a tiny two-case regression catches retained matrices/arrays.

## What's in Memory

### C:\Users\605\Documents\Codex\2026-11-19\z

#### 2026-11-19

- FlClash ChatGPT US subscription script: `FlClash`, `main(config)`, `proxy-groups`, `ChatGPT`, `OpenAI`, `REJECT`
  - desc: Non-destructive JS override that adds a US ChatGPT group and places routes before original rules.
  - learnings: import/create under “扩展 → 脚本”, then select/apply it for the subscription; local preservation checks do not prove US egress or UDP capture.

### C:\Users\605\Documents\Codex\2026-11-04\cong / C:\Users\605\Documents\FileSync

#### 2026-11-19

- FileSync Codex online-sync scope: `sync.ps1`, `NonInteractive`, `codexRunning`, `Push`, `Sync`, `Export-MemorySnapshot`
  - desc: Online mode uses the normal upload exclusions but converts active-Codex `Sync` into one-way Push; normal Pull/Sync is needed later for remote changes.
  - learnings: no extra ordinary-file exclusion was found; it skips download/merge/restore and stops if snapshot export is unstable.

### C:\Users\605\Documents\Codex\MAA OI Assistant

#### 2026-11-21

- BST delete-minimum depth maintenance: `BST`, `删除最小值`, `fa[x]`, `x 原来的右子树`, `深度区间加`, `线段树`, `set`
  - desc: Local rotation-pointer changes and an `O(m log m)` set/segment-tree design for maintaining depths after deletion. cwd=`C:\Users\605\Documents\Codex\MAA OI Assistant`.
  - learnings: Only the deleted minimum `x`'s original right subtree loses one depth; use its key interval for range add, not per-node updates.

- QOJ 24893 “猜编号” teaching setup: `QOJ24893`, `猜编号`, `oi-training`, `Cloudflare`, `Chrome`, `先序序列`
  - desc: Statement retrieval and safe stepwise-teaching setup for `B. 猜编号`; no solution discussion began pending contest-status confirmation. cwd=`C:\Users\605\Documents\Codex\MAA OI Assistant`.
  - learnings: Direct QOJ access hit Cloudflare; use the authenticated Chrome DOM session. Confirm contest/simulation versus off-contest learning, then give only one hint at a time.

#### 2026-11-20

- Delete-one-element LIS mandatory-level test: `LIS`, `f_i`, `g_i`, `f_i + g_i - 1 = L`, `mandatory element`, `unique level`
  - desc: User-derived `O(n log n)` criterion for whether independently deleting an element lowers a strictly increasing LIS. cwd=`C:\Users\605\Documents\Codex\MAA OI Assistant!`.
  - learnings: A point is on some LIS iff `f_i + g_i - 1 = L`; among such points, a unique `f_i` layer is mandatory, so its deletion gives `L-1`. Confirm strict-vs-nondecreasing bounds before implementation.

#### 2026-11-19

- P10197 Minimum Sum of Maximums debug and review: `P10197`, `interval DP`, `subset DP`, `sentinel`, `lst`, `empty interval`, `O(m^2 3^q)`
  - desc: Minimal repair of the user’s dual-array DP, differential validation, user-reported AC, and prompt-assisted training records.
  - learnings: explicitly make nonempty empty-interval states infinity; audit right sentinel, `lst`, `m`/`n`, extrema, singleton formula, and submask minimum.

#### 2026-11-17

- P12445 `数好图` and adjacent OI debugging: `P12445`, `P10441`, `P11994`, `P14347`, `P17834`, `h[i][0]`, `ans矩阵`
  - desc: DP repairs, constructive proof, multi-test reset shields, local validation, and training records.
  - learnings: formal endpoint arguments and minimal counterexamples matter; local checks remain distinct from online AC.

### Windows desktop / C:\Users\605\Documents\Codex\2026-11-13\d-2

#### 2026-11-21

- PcaSvc, WpnUserService, and MuMu Driver Locked memory: `PcaSvc`, `NtQuerySystemInformation`, `RAMMap`, `Driver Locked`, `MuMuVMMManage.exe`, `/GMM/VM/Allocated/cBasePages`
  - desc: Repeated service-handle diagnosis, approved PcaSvc disablement, and correlation of large locked memory to MuMu guest allocation. cwd=`C:\Users\605\Documents\Codex\2026-11-13\d-2`.
  - learnings: High handles alone do not rank RAM impact; MuMu's ~3.72 GiB allocation closely matched RAMMap's ~3.84 GiB Driver Locked, but repeated equal snapshots do not prove a leak.

### C:\Users\605\Documents\Codex\MAA Arknights Assistant

#### 2026-11-21

- MAA Copilot 96155 Mon3tr S1 adaptation: `prts://96155`, `SL-MO-1`, `Mon3tr`, `重构体`, `skill_usage=0`, `SL-MO-1-Mon3tr-S1.json`
  - desc: Replace 遥 at its original tile, deploy 重构体 early, and reconcile roster/cost/chain-healing constraints; static validation only. cwd=`C:\Users\605\Documents\Codex\MAA Arknights Assistant`.
  - learnings: Decode PRTS `content` JSON twice; S1 AUTO has no `SkillUsage`; summons stay out of `opers`; S1 target selection remains HP-dependent and static geometry does not prove combat.

#### 2026-11-18

- Small-account six-star Guard constant-ATK screening: `小号`, `六星近卫`, `常态加攻`, `阿米娅升变`, `JT8-2`, `杜宾`, `波登可`
  - desc: Account-specific roster screen under “未升变、不提升练度、常态” constraints.
  - learnings: no qualifying self-owned operator was found; filter unlock, E-level, recipient class, and rank first.

### C:\Users\605\Documents\Codex\CHAT with GPT

#### 2026-11-17

- Arcaea free songs and main-story packs: `Arcaea`, `World Mode`, `World Extend`, `Memory Archive`, `Adverse Prelude`
  - desc: Platform/server-sensitive free-content categories, dated events, vouchers, and pack purchasing.
  - learnings: confirm platform/server and current prices rather than reuse historical event data.

### Older Memory Topics

#### C:\Users\605\Documents\Codex\MAA OI Assistant*

- Contest collaboration, training, debugging, and artifact layout: `AGENTS.md`, `[debug]`, `做法不正确`, `Documents/Output`, `outputs/训练记录.md`
  - desc: Core OI interaction defaults, record handling, algorithms/proofs, contest-material delivery, and actual rules paths. cwd=`C:\Users\605\Documents\Codex\MAA OI Assistant*`.

- Two-dimensional prefix-sum string DP: `f[i,j]`, `g[i,j]`, `S_i=S_j`, `O(n^2)`
  - desc: Strict upper-left-rectangle transition optimization; preserve zero boundaries and match symbols, not indices. cwd=`C:\Users\605\Documents\Codex\MAA OI Assistant`.

#### D:\PCL 正式版 2.12.7.3 / Minecraft

- PCL Fabric repair and Minecraft 26.3: `26.3.json`, `InstallManifest`, `InstanceCache`, `KnotClient`, `trial vault`
  - desc: Static profile repair, mod-side requirements, and version-specific gameplay research.

#### Minecraft Java research

- Version history and emerald farming: `Pocket Edition 0.15.0`, `observer`, `string duper`, `random_tick_speed`, `Paper`, `toolsmith`
  - desc: Historical PE/Java feature mapping and version/server-sensitive emerald-production research. cwd=`C:\Users\605\Documents\Codex\2026-11-05\xian`.

#### Windows desktop / CHAT with GPT

- Windows transparency and scheduling: `MuMuQtBridge.dll`, `UIPI`, `ScheduledTask`, `SetSuspendState`, `WS_EX_LAYERED`
  - desc: MuMu virtrite opacity utility and one-time sleep scheduling; reinspect live-program and task state before reuse.

- BOF22 / NetEase / game research: `BOF22`, `Tripcode`, `Delete Key`, `8483155610`, `BMS genre`, `参数预设`
  - desc: Rules/ranking and playlist cross-checks, genre explanations, NetEase limitations, and Arknights seed-setting research. cwd=`C:\Users\605\Documents\Codex\CHAT with GPT`.

#### C:\Users\605\Documents\Codex\2026-11-05\b-n

- CSP-S submission archive reporting: `CSP-S 2026`, `Markdown`, `submission archive`, `distinctive examples`
  - desc: Evidence-checked Chinese reporting that separates recurring mistakes from representative submissions.

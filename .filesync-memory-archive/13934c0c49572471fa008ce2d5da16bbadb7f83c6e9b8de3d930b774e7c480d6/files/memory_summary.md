v1

## User Profile

- Works mainly in Chinese on advanced OI/C++ training, contest materials, proofs, and debugging; also uses Windows tooling, MAA/Arknights, Minecraft, and Codex desktop.
- Uses Codex projects under `C:\Users\605\Documents\Codex`; distinguishes similarly named checkout paths and game accounts.
- Expects concrete deliverables and honest status boundaries: local/static tests, user-reported AC, live deployment, and combat/online proof are different.
- Values own derivations and competitive C++ conventions: global arrays, 1-based entity indices, short names, and `init/solve/main` where source style supports it.

## User preferences

- For OI teaching, first continue from the user's current derivation; give one advancing hint/question in Chinese and wait. Honor “是或否”, “只找原题”, and “不要给思路”.
- If a timed contest is visible, first ask whether it is contest/simulation or off-contest learning; give no solution hint until resolved.
- For viable `[debug]`, preserve the approach and style, make minimal changes, explain each substantive fault, and give complete modified code. If the approach is wrong, say “做法不正确” with a concrete reason/counterexample and stop.
- “过了，总结记录吧” means update the review plus training record/archive, retaining “提示后 AC/完成” versus independent mastery.
- Before recommending training, search `outputs/训练记录.md`; avoid already solved or merely nominally black problems. Meaningful property subtasks and downloadable Markdown are expected when requested.
- Put generated `.in` and `.exe` in `C:\Users\605\Documents\Output`, not a Codex checkout.
- For FlClash, use “扩展 → 脚本” and preserve all existing subscription configuration except the new group/rules.
- For Windows/Codex feature questions, distinguish user-operable settings from product modes, remote gates, and unverified inference.
- Use connected Google Drive to inspect/deliver cloud files; do not treat retired local cloud-drive mounts as active paths. [ad-hoc note]
- When any local file path/name/type/content is unlike the user's description, stop after read-only verification and report the mismatch.

## General Tips

- Locate the actual `AGENTS.md` before editing; project-scoped and global `C:\Users\605\.codex\AGENTS.md` instructions differ. Do not overwrite unread global personalization.
- State validation limits exactly. Static/local tests do not prove online AC, real egress, device behavior, or combat clears.
- Use authenticated browser DOM for sites blocked by direct access/Cloudflare.
- For Windows memory pressure, compare RAMMap `Driver Locked` with MuMu `debugvm` allocation before calling it a leak; high handle counts alone do not rank RAM impact.
- For MAA work, recheck account, roster, theme/resources, assets, and unlocks; never mix main- and small-account facts or store secrets.
- For modular normalization, multiplying by `x^{-1}` needs `gcd(x,P)=1`; do not silently generalize to non-units.

## What's in Memory

### C:\Users\605\Documents\Codex\MAA OI Assistant

#### 2026-11-23

- High-difficulty DP selection and P9171 sheet: `P9171`, `染色数组`, `NOI+/CTS`, `48+28+24`, `outputs/P9171-染色数组-训练题面.md`
  - desc: Unsolved high-difficulty DP selection, 100-point Markdown training sheet, and verification boundary for self-designed subtasks.
  - learnings: Check training records first; only `n=2m` had stated O(m^2) support, so do not present the property scores as official/proved.

- Greedy majority modular proof: `众数`, `前缀和`, `模P`, `gcd`, `x^{-1}`
  - desc: Incomplete proof of stuck greedy state and normalizing a modal value to one.
  - learnings: The count-gap invariant proves unique mode; normalization needs an explicit unit/invertibility case split.

- P3721 and OI debugging/training: `P3721`, `单旋`, `P10197`, `P12445`, `训练记录`, `提示后 AC`
  - desc: Minimal C++ repairs, differential validation, proof/debug shields, and archive conventions.
  - learnings: Translate key intervals directly to difference endpoints; preserve status evidence and source-style boundaries.

### Windows desktop / C:\Users\605\Documents\Codex\2026-11-13\d-2

#### 2026-11-23

- PcaSvc, WpnUserService, and MuMu memory: `PcaSvc`, `RAMMap`, `Driver Locked`, `MuMuVMMManage.exe`, `Allocated/cBasePages`
  - desc: Measured process-handle accumulation, approved PcaSvc disablement, and MuMu driver-locked allocation correlation.
  - learnings: Restart snapshots showed PcaSvc recovery; MuMu's allocation matched locked memory but does not establish a leak.

### Codex desktop / C:\Users\605\Documents\Codex\2026-10-15\w

#### 2026-11-23

- Side chat and “更多详情” gates: `canOpenTextSideChat`, `isEverydayWorkMode`, `Alt+3`, `Statsig`, `4290238484`
  - desc: Product-mode restoration for selection-to-side-chat plus remote-gate investigation for “更多详情”.
  - learnings: Side chat and selection follow-up are separate; no manual More Details switch was found and stale cache cannot prove gate state.

### Codex instructions / C:\Users\605\Documents\Codex\2026-09-17\h

#### 2026-11-23

- Local memory, AGENTS.md, hint/teach: `[本地记忆]`, `AGENTS.md`, `hint`, `teach`, `reparse point`, `Google Drive`
  - desc: Scope-safe instruction merging, file mismatch stop rule, and stepwise OI teaching defaults.
  - learnings: Global instructions live under `.codex`; use Drive rather than the retired mounted cloud path. [ad-hoc note]

### C:\Users\605\Documents\Codex\MAA Arknights Assistant

#### 2026-11-23

- Resume existing roguelike exploration: `Roguelike@Continue`, `Roguelike@Stages`, `ExitThenAbandon`
  - desc: Source-chain analysis of taking over an existing exploration without abandonment.
  - learnings: Manually continue to route/node selection first; map-recognition failure can abandon, so this remains untested inference.

- Copilot and small-account roster constraints: `prts://96155`, `Mon3tr S1`, `重构体`, `小号`, `JT8-2`, `常态加攻`
  - desc: Static Copilot adaptation and account-specific operator-buff screening.
  - learnings: Keep summons out of `opers`; distinguish static tile/chain validation from combat, and filter roster candidates by unlock, recipient, and training state first.

### Older Memory Topics

#### C:\Users\605\Documents\Codex\MAA OI Assistant*

- Contest collaboration and artifacts: `AGENTS.md`, `[debug]`, `Documents/Output`, `std.cpp`, `solution.md`, `partial.cpp`
  - desc: OI workflow, code-style, training-record, contest-material, and special-judge delivery defaults.

#### Windows / CHAT with GPT

- Utilities and research: `Vitrite Fixed`, `UIPI`, `ScheduledTask`, `FlClash`, `main(config)`, `BOF22`, `NetEase`
  - desc: Transparency diagnosis, one-time sleep, subscription script override, and time-sensitive music/game research; recheck live state first.

#### Minecraft / PCL

- Repair and gameplay research: `Fabric`, `26.3`, `Pocket Edition 0.15.0`, `emerald farms`
  - desc: Version-sensitive launcher repair and gameplay research; use current sources and server/version context.

v1

## User Profile

- Works mainly in Chinese on advanced OI/C++ training, contest materials, proofs, and debugging; also uses Windows tooling, MAA/Arknights, Minecraft, and Codex desktop.
- Uses Codex projects under `C:\Users\605\Documents\Codex`; expects concrete deliverables and honest boundaries between local/static checks, user-reported AC, and live/online proof.
- Values own derivations and competitive C++ conventions: global arrays, 1-based entity indices, short names, and `init/solve/main` where source style supports it.

## User preferences

- For OI teaching, continue from the user's derivation; give one advancing Chinese hint/question and wait. Honor “是或否”, “只找原题”, and “不要给思路”.
- If a timed contest is visible, first ask whether it is contest/simulation or off-contest learning; give no solution hint until resolved.
- For viable `[debug]`, preserve the approach/style, make minimal changes, explain each substantive fault, and give complete modified code. If the approach is wrong, say “做法不正确” with a concrete reason/counterexample and stop.
- When asked to “改成线性的”, retain the working main-loop/data-maintenance structure and replace the specified bottlenecks instead of broadly rewriting it.
- “过了，总结记录吧” means update the review plus training record/archive, retaining “提示后 AC/完成” versus independent mastery.
- Before recommending training, search `outputs/训练记录.md`; avoid already solved or merely nominally black problems. Meaningful property subtasks and downloadable Markdown are expected when requested.
- Put generated `.in` and `.exe` in `C:\Users\605\Documents\Output`, not a Codex checkout.
- For FlClash, use “扩展 → 脚本” and preserve all existing subscription configuration except the new group/rules.
- In live Windows debugging, inspect logs/dumps and test the shared affected path rather than accepting a restart workaround or a synthetic test as proof.
- Use connected Google Drive; do not treat retired local cloud-drive mounts as active paths. [ad-hoc note]
- When any local file path/name/type/content is unlike the user's description, stop after read-only verification and report the mismatch.

## General Tips

- Locate the actual `AGENTS.md` before editing; project-scoped and global `C:\Users\605\.codex\AGENTS.md` instructions differ. Do not overwrite unread global personalization.
- State validation limits exactly. Static/local tests do not prove online AC, real egress, device behavior, or combat clears.
- Use authenticated browser DOM for sites blocked by direct access/Cloudflare.
- For Windows memory pressure, compare RAMMap `Driver Locked` with MuMu `debugvm` allocation before calling it a leak; high handle counts alone do not rank RAM impact.
- For fixed global Windows shortcuts, prefer `RegisterHotKey`/`WM_HOTKEY` with diagnostics over `WH_KEYBOARD_LL`; check ordinary and MuMu windows.
- For MAA work, recheck account, roster, theme/resources, assets, and unlocks; never mix main- and small-account facts or store secrets.
- For modular normalization, multiplying by `x^{-1}` needs `gcd(x,P)=1`; do not silently generalize to non-units.

## What's in Memory

### C:\Users\605\Documents\Output\stock-3758-debug-1795586054248

#### 2026-11-25

- Zhengrui 2246 “股票” linearization and source lookup: `linear/stock.cpp`, `lim[l]`, `monotonic queue`, `prefix shift`, `63972`, `contest-2246`
  - desc: Validated O(n) replacement for sparse-table/discretization work and bounded lookup of 3757–3760 sources.
  - learnings: Precompute `lim`, shift prefix values into direct buckets, and reset checker globals; no verified external original was found, not proof of originality.

### Windows desktop / C:\Users\605\Documents\Codex\2026-10-29\mumu

#### 2026-11-25

- virtrite 2 MuMu bridge and hotkey repair: `MuMuQtBridge.dll+0x96EC`, `TlsAlloc`, `RegisterHotKey`, `WM_HOTKEY`, `22/22`, `Ctrl+Shift+5`
  - desc: Superseding crash and post-wake/global-shortcut repair for virtrite 2; also routes Vitrite/Milthm/Endfield diagnosis.
  - learnings: Replace emulated TLS guard; use Qt opacity bridge for MuMu; 2.0.4’s registered hotkeys were user-confirmed, while Endfield still needs equal/elevated-integrity testing.

### C:\Users\605\Documents\Codex\MAA OI Assistant

#### 2026-11-23

- High-difficulty DP selection and P9171 sheet: `P9171`, `染色数组`, `NOI+/CTS`, `48+28+24`, `outputs/P9171-染色数组-训练题面.md`
  - desc: Unsolved hard-DP selection, 100-point Markdown sheet, and verification boundary for self-designed subtasks.
  - learnings: Check training records first; only `n=2m` had stated O(m^2) support, so do not present property scores as official/proved.

- Greedy majority modular proof and OI debugging/training: `众数`, `gcd`, `x^{-1}`, `P3721`, `单旋`, `P10197`, `训练记录`
  - desc: Incomplete proof conditions plus minimal C++ repairs, differential validation, and archive conventions.
  - learnings: Normalization needs a unit case split; translate derived key intervals directly to difference endpoints; preserve source-style/status evidence.

### Windows desktop / C:\Users\605\Documents\Codex\2026-11-13\d-2

#### 2026-11-23

- PcaSvc, WpnUserService, and MuMu memory: `PcaSvc`, `RAMMap`, `Driver Locked`, `MuMuVMMManage.exe`, `Allocated/cBasePages`
  - desc: Measured process-handle accumulation, approved PcaSvc disablement, and MuMu driver-locked allocation correlation.
  - learnings: Restart snapshots showed PcaSvc recovery; MuMu's allocation matched locked memory but does not establish a leak.

### Codex instructions / C:\Users\605\Documents\Codex\2026-09-17\h

#### 2026-11-23

- Local memory, AGENTS.md, hint/teach: `[本地记忆]`, `AGENTS.md`, `hint`, `teach`, `reparse point`, `Google Drive`
  - desc: Scope-safe instruction merging, file mismatch stop rule, and stepwise OI teaching defaults.
  - learnings: Global instructions live under `.codex`; use Drive rather than the retired mounted cloud path. [ad-hoc note]

### Older Memory Topics

#### C:\Users\605\Documents\Codex\MAA OI Assistant*

- Contest collaboration and artifacts: `AGENTS.md`, `[debug]`, `Documents/Output`, `std.cpp`, `solution.md`, `partial.cpp`
  - desc: OI workflow, code style, training records, contest-material delivery, and special-judge defaults; includes verified Drive-delivery skill.

- Guided teaching, DP, and proof qualification: `QOJ24893`, `P11994`, `2D prefix sum`, `QOJ7895`, `P9531`, `P17834`
  - desc: One-step teaching boundaries, DP/complexity derivations, and debugging/optimization shields in the MAA OI Assistant checkouts.

#### C:\Users\605\Documents\Codex\MAA Arknights Assistant

- Copilot, roster, and roguelike: `prts://96155`, `Mon3tr S1`, `重构体`, `Roguelike@Continue`, `ExitThenAbandon`
  - desc: Static Copilot adaptation, small-account screening, and untested existing-exploration takeover behavior.

#### Windows / CHAT with GPT

- Utilities and research: `Vitrite`, `UIPI`, `WS_EX_LAYERED`, `FlClash`, `main(config)`, `BOF22`, `NetEase`
  - desc: Transparency diagnosis, subscription-script override, and time-sensitive music/game research; recheck live state first.

- Mobile games and music research: `Arcaea`, `World Extend`, `Memory Archive`, `BOF22`, `NetEase`, `Arknights terrain`
  - desc: Date/server-sensitive acquisition, ranking, and game-mechanics answers; verify current events, prices, and source conditions.

#### Codex desktop / FileSync

- Product UI, local instructions, and sync hygiene: `canOpenTextSideChat`, `Statsig`, `FileSync`, `.rmp`, `scan.json`
  - desc: Separate product modes from remote gates; preserve ignored large-file exclusions and scope-safe instruction edits.

#### Minecraft / PCL

- Repair and gameplay research: `Fabric`, `26.3`, `Pocket Edition 0.15.0`, `emerald farms`
  - desc: Version-sensitive launcher repair and gameplay research; use current sources and server/version context.

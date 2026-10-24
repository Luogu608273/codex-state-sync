thread_id: 01a1250f-66a5-7341-be42-bed5847d6439
updated_at: 2026-10-17T06:09:45+00:00
rollout_path: C:\Users\605\.codex\sessions\2026\10\10\rollout-2026-10-10T17-05-28-01a1250f-66a5-7341-be42-bed5847d6439.jsonl
cwd: \\?\C:\Users\605\Documents\Codex\2026-10-10\referenced-chatgpt-conversation-this-is-an
git_branch: main

# Reverse-engineered the public random-redirect implementation of www.米哈游.com

Rollout context: Windows PowerShell workspace `C:\Users\605\Documents\Codex\2026-10-10\referenced-chatgpt-conversation-this-is-an`; target `https://www.米哈游.com/` (ASCII/Punycode `https://www.xn--qvrw50dh7j.com/`).

## Task 1: Inspect HTTP chain, source, scripts, and random redirect logic

Outcome: success

Key steps:
- Direct HTTPS GET returned `200 OK`; the HTML is nearly empty and loads `aha.js`.
- HTTP redirects: `http://www...` → `301` to HTTPS → `200`; bare HTTPS domain returned `200`; `/search.html?...` → `307 /search?...` → `200`.
- Downloaded and decoded obfuscated `aha.js`; it loads `aha.wasm`, passes browser state/entropy to WASM, and executes WASM commands including `location.replace()`.
- Downloaded the 178,753-byte WASM and invoked its real `alloc/dispatch/output_len` interface in Node. Extracted the embedded configuration and reproduced runtime behavior.
- Confirmed the public repository `kaitoulapin/xn--qvrw50dh7j.com` at commit `0cf9782acf0c31ac4b21c7a47171ff8c6f9b1a37` is materially consistent with the deployed loader/config. Loader text matched exactly; config matched except generated `media.videoBytes`.
- Extracted 51 distinct candidate URLs: UR 1, SSR 2, SR 22, R 23 ordinary plus 3 featured.
- Verified 43 comparison cases / 23,000 draws against the historical JS reference after updating the fixture to the live candidate configuration; also verified pity boundaries, persistent state, probe/simulation/reset/multi-pull, and video event transitions.

Reusable findings:
- Selection uses a Mulberry32-compatible seeded PRNG. Default seed is `(Date.now() ^ Math.floor(Math.random()*0xffffffff)) >>> 0`; `?seed=` makes runs reproducible only when saved state and parameters also match.
- Default fresh-state rarity probabilities: UR 2%, SSR 2%, SR 30%, R 66% (R ordinary/featured split 50/50). Pool entries default to equal weight; SSR repeat damping halves the previous standard URL's weight.
- Five-star rate: 4% for pity values 0–10; 12% at 11, then +8 percentage points per draw through 68% at 18; 100% at pity 19 (20th draw hard pity). Four-star base allocation is `min(30%, 1-rate5)` with a 10-draw hard pity.
- Five-star normally has 50% UR/SSR allocation; an SSR sets next-five-star guarantee to UR. Three consecutive losses can raise non-guaranteed UR probability to 80% (“radiance”). State is persisted under `localStorage` key `buwanyuanshen.gacha.v2`.
- Ordinary cards redirect immediately. The UR card (`https://ys.mihoyo.com/`) first shows a guide and plays `video/startup-01.mp4`; `ended`, `skip`, media/source error, or timeout then redirects. The loader calls `location.replace()`.
- The dormant live-status function/branch is present in source but current runtime uses `Promise.resolve(null)` and the Rust live redirect branch is commented out; no evidence supports an active live-priority redirect.

Artifacts created under `outputs/`: `analysis.md`, `candidates.csv`, `live-config.json`, `aha-decoded.js`, `wasm-observations.json`, and `http-evidence.txt`. No real-browser manual media test or exhaustive follow-up crawl of all external targets was performed.

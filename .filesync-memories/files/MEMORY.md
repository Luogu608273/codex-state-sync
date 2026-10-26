# Task Group: MAA OI Assistant contest collaboration, training, and debugging

scope: Chinese OI teaching, recommendations/training records, contest-C++ debugging, and persistent project/global coding rules.
applies_to: cwd=C:\Users\605\Documents\Codex\MAA OI Assistant!; reuse_rule=Reuse interaction and coding defaults broadly; status, files, and write locations are checkout-specific.

## Task 1: Persist debug, coding-style, Drive, and Git backup rules

### rollout_summary_files

- rollout_summaries/2026-09-30T08-53-18-5kYf-persist_project_and_global_coding_preferences.md (cwd=\\?\C:\Users\605\Documents\Codex\MAA OI Assistant!, rollout_path=\\?\C:\Users\605\.codex\sessions\2026\10\21\rollout-2026-10-21T12-18-53-01a0f184-ab47-7b92-81fe-2d65c1d6977f_01a15cae-f9b6-72a1-b647-fadb21eb1e7e.jsonl, updated_at=2026-10-23T07:45:11+00:00, verified writes)
- rollout_summaries/2026-09-17T02-44-10-nub6-read_cloud_chat_history_and_merge_local_memory_preferences.md (cwd=\\?\C:\Users\605\Documents\Codex\2026-09-17\h, rollout_path=\\?\C:\Users\605\.codex\sessions\2026\09\17\rollout-2026-09-17T10-44-10-01a0ad40-0a71-7253-b435-433591a7cbc0.jsonl, updated_at=2026-10-24T08:58:50+00:00, Drive facts superseded by ad-hoc note)

### keywords

- AGENTS.md, [debug], 完整代码, 码风, 云端硬盘/CKK, Google Drive, .gitignore, Git, 备份

## Task 2: Record training, recommend problems, and debug P8820

### rollout_summary_files

- rollout_summaries/2026-10-21T08-24-33-uLcG-p8820_debug_matrix_k3_state_fix.md (cwd=\\?\C:\Users\605\Documents\Codex\MAA OI Assistant!, rollout_path=C:\Users\605\.codex\archived_sessions\rollout-2026-10-21T16-24-38-01a15d8f-e2f3-7233-bdf5-7dd279191e6e.jsonl, updated_at=2026-10-22T09:20:51+00:00, random/brute-force validation, not official AC)
- rollout_summaries/2026-10-20T07-50-36-FHoa-gcd_queue_tutoring_and_cf1548b_practice.md (cwd=\\?\C:\Users\605\Documents\Codex\MAA OI Assistant!, rollout_path=\\?\C:\Users\605\.codex\sessions\2026\10\20\rollout-2026-10-20T15-50-37-01a1584a-74ae-7f32-975c-19d77940e5ce.jsonl, updated_at=2026-10-22T09:20:51+00:00)

### keywords

- oi-training, 过了，总结记录吧, [hint], fork_thread, CF1548B, P8820, k=3, num[w], ABC091D, upper_bound

## Task 3: Find a practice problem for dynamic tree diameter endpoints

### rollout_summary_files

- rollout_summaries/2026-10-19T09-02-00-Eksm-cf379f_dynamic_tree_diameter.md (cwd=\\?\C:\Users\605\Documents\Codex\MAA OI Assistant!, rollout_path=\\?\C:\Users\605\.codex\sessions\2026\10\19\rollout-2026-10-19T17-09-23-01a15365-74a6-7730-a584-61faae140e3e_01a1536c-35e1-7fc2-8b2c-976dc3605faf.jsonl, updated_at=2026-10-23T09:24:53+00:00)

### keywords

- CF379F, New Year Tree, 动态树直径, 最远两点, LCA, 倍增

## Task 4: Start stepwise tutoring for G123914/P11089 crystal

### rollout_summary_files

- rollout_summaries/2026-10-24T06-11-17-jf3i-oi_training_stepwise_crystal_problem.md (cwd=\\?\C:\Users\605\Documents\Codex\MAA OI Assistant!, rollout_path=\\?\C:\Users\605\.codex\sessions\2026\10\24\rollout-2026-10-24T14-11-17-01a16c88-f53f-7852-a719-6d6d3279b600.jsonl, updated_at=2026-10-24T06:17:11+00:00, tutoring start only)

### keywords

- G123914, P11089, crystal, oi-training, 分步提示, 中文教学, 卡点, 不修改训练记录

## User preferences

- when the user says "[debug]时还要给出完整代码。写入。" -> explain faults/minimal changes and provide modified complete code without changing the idea. [Task 1]
- when the user says "编写代码时学习我的码风" -> follow their actual naming, layout, template, structures, and implementation habits; do not modernize gratuitously. [Task 1]
- when the user says "我已经接入了 git，只要是在 gitignore 以外的文件应该都不用备份" -> do not create extra backups for non-ignored project files. [Task 1]
- when the user says "过了，总结记录吧" -> update training record and single-problem review, preserving prompt-assisted AC versus independent mastery. [Task 2]
- for [hint], give one advancing hint and wait; honor "是/否", "只找原题", and "不要给思路" literally. [Task 2]
- when the user says "有原题吗，我想做一下" -> prioritize a submit-ready problem/link and necessary property hint, not full code/solution. [Task 3]
- when teaching a new OI problem, the user asked "先确认我目前已有的推导与卡点……一次只给一个推进提示，等我回复后再继续" -> ask for their derivation, state, code, or exact blockage first; do not infer ability from a historical score or alter training records unless asked. [Task 4]

## Reusable knowledge

- The retired H:\我的云端硬盘 mount is not a current route; use connected Google Drive search/list/read interfaces. [Task 1] [ad-hoc note]
- Training truth is in outputs/训练记录.md, outputs/训练档案.md, and outputs/复盘/; user report, compile/static/random testing, and official AC are distinct. P8820 k=3 also needs LCA-neighbor handling: min(l1.a[0],l1.a[1])+num[w]+min(l2.a[0],l2.a[1]). [Task 2]
- CF379F: dynamic leaf additions update diameter endpoints by comparing distances to both old endpoints via LCA/binary lifting; prove the diameter-endpoint property before relying on it. [Task 3]
- .agents/skills/oi-training/SKILL.md calls for checking constraints and the user's attempt first; expose one concrete flaw/counterexample if needed, otherwise ask one advancing question and wait. [Task 4]

## Failures and how to do differently

- A write-script validation failure is not success: re-read target state before claiming a rule was written. [Task 1]
- Do not revive old mount/permission guidance for H:\我的云端硬盘. [Task 1] [ad-hoc note]
- Random/brute-force checks do not establish official AC; P8820 must also remove or conditionalize freopen("transmit2.in",...). [Task 2]
- Do not begin a full solution before the user supplies their present reasoning; G123914 facts in the initial prompt are not evidence of the user's own approach. [Task 4]

# Task Group: MAA OI Assistant algorithm derivations and complexity qualification

scope: Explain contest DP, competition-tree, and mathematical-model derivations with exact state semantics and qualified complexity claims.
applies_to: cwd=C:\Users\605\Documents\Codex\MAA OI Assistant!; reuse_rule=Reuse mathematical shields for analogous derivations, not as a completed solution for an unspecified problem.

## Task 1: P11234 competition-tree dynamic maintenance and optimization review

### rollout_summary_files

- rollout_summaries/2026-10-20T08-49-16-yJyD-p11234_competition_tree_amortized_optimization_review.md (cwd=\\?\C:\Users\605\Documents\Codex\MAA OI Assistant!, rollout_path=\\?\C:\Users\605\.codex\sessions\2026\10\23\rollout-2026-10-23T17-23-50-01a15880-29e4-72f1-8068-e1f4ca2eb757_01a16812-e15f-7162-8356-e604bd1348e4.jsonl, updated_at=2026-10-24T06:02:27+00:00, user-reported AC)

### keywords

- P11234, 擂台游戏, competition tree, b, q, b_p=min(R,b_v), 逆序解除固定, 均摊复杂度, 切根, 卡常, O(T(n+m))

## Task 2: Divide-and-conquer cross-midpoint subsequence preprocessing

### rollout_summary_files

- rollout_summaries/2026-10-15T01-53-18-i0fA-divide_conquer_subsequence_preprocessing.md (cwd=\\?\C:\Users\605\Documents\Codex\MAA OI Assistant!, rollout_path=\\?\C:\Users\605\.codex\sessions\2026\10\15\rollout-2026-10-15T14-21-28-01a13d43-893b-7dc1-8124-b32eb06745b6_01a13e39-0af9-75e3-b7db-95308a0e9dd2.jsonl, updated_at=2026-10-24T08:52:28+00:00, unconfirmed by code/user validation)

### keywords

- divide-and-conquer, midpoint, subsequence DP, B[p,v], C[u,p], incremental update, O(nk^2 log n)

## Task 3: Parity-demand layer decomposition

### rollout_summary_files

- rollout_summaries/2026-10-24T06-11-00-boCA-parity_demand_layer_decomposition.md (cwd=\\?\C:\Users\605\Documents\Codex\MAA OI Assistant!, rollout_path=\\?\C:\Users\605\.codex\sessions\2026\10\24\rollout-2026-10-24T15-25-13-01a16c88-b30c-72f2-b5d9-061256796880_01a16ccc-a619-7ed0-9442-d41380a36a01.jsonl, updated_at=2026-10-24T07:26:12+00:00, proof incomplete)

### keywords

- parity, d0, d1, s(v), layer decomposition, cross-layer edges, (y-1,x+1), (y+1,x-1)

## User preferences

- when checking a derivation, the user corrected: "不是 u 全部都删掉，而是只删掉 < R 的部分吧" -> state the surviving candidate set, not a whole-side deletion. [Task 1]
- when asked "这个怎么线性提前准备好", show state definitions, incremental scan updates, and per-level aggregation; distinguish linear positions from O(k^2) state updates. [Task 2]

## Reusable knowledge

- P11234: reverse fixed operations so edges only open and constraints only relax. b is the minimum feasible winner ability, not the candidate-ID set; q=1 preserves champion-side candidates meeting the round threshold. Per height, q changes once and b only decreases in [0,h], yielding total/amortized O(T(n+m)), not worst-case O(1) per modification. [Task 1]
- P11234 implementation shields: use a>=lim; do not truncate original ability before XOR; size vis/op/ok for tree nodes; on active-root changes, update leaf mapping, height, connectivity, and constraints together. User reported the final version passed, while official records were not read. [Task 1]
- At a midpoint, scan left with B[p,v] and right with C[u,p]. Each endpoint enters once but costs up to O(k^2), so preprocessing is O(nk^2) per divide-and-conquer level, O(nk^2 log n) overall. [Task 2]
- For the parity model, define s(v)=d0(v)+d1(v). Check whether every candidate edge's satisfied demands belong to one s layer before decomposing the objective by layer. [Task 3]

## Failures and how to do differently

- Raising an ability lower bound can remove multiple weak candidates; do not reduce it to deleting only the fixed player or an entire side. [Task 1]
- Do not label a total/amortized activation argument as per-update worst-case O(1). [Task 1]
- The parity decomposition is unfinished: prove both unique-layer contribution and no cross-layer competition before summing independently optimized layers. [Task 3]

# Task Group: MAA Arknights Assistant copilot adaptation and runtime configuration

scope: Adapt MAA Copilot jobs, diagnose formation prechecks, and preserve GPU/runtime configuration evidence.
applies_to: cwd=C:\Users\605\Documents\Codex\MAA Arknights Assistant!; reuse_rule=Reinspect current job/assets/logs before reuse; roster, MAA version, and results are time-specific.

## Task 1: TW-EX-7, GO-EX-7, and AMD inference setup

### rollout_summary_files

- rollout_summaries/2026-10-20T07-17-54-WET2-arknights_maa_prts_job_adaptation.md (cwd=\\?\C:\Users\605\Documents\Codex\MAA Arknights Assistant!, rollout_path=C:\Users\605\.codex\sessions\2026\10\20\rollout-2026-10-20T15-17-55-01a1582c-844c-7c13-b25b-67921b416404.jsonl, updated_at=2026-10-23T11:11:02+00:00, static validation only)

### keywords

- prts://104914, TW-EX-7, 塞雷娅, range_table.json, GO-EX-7, OperatorMissing, RX550, GpuDescription

## User preferences

- when adapting jobs, "同时修改作业的干员适配等信息" -> synchronize actions, opers, skills, levels, modules, support, and explanation. [Task 1]
- when the user says "塞雷娅不要奶到结城理", treat range exclusion as a measured hard constraint. [Task 1]

## Reusable knowledge

- Saria S2 at (8,4) Up covers Snow and SilverAsh, not Makoto; derive from range_table.json. OperatorMissing can mean level/elite/skill mismatch. GPU config needs restarted logs resolving Radeon. [Task 1]

## Failures and how to do differently

- Static validation, connection, or screenshot success does not prove raid clear; do not alter paused diagnosis/configuration without new instruction. [Task 1]

# Task Group: Windows graphics, Codex desktop, and power scheduling

scope: Diagnose Windows graphics/desktop faults, investigate Codex UI/sync, and schedule explicit one-time system sleep.
applies_to: cwd=Windows desktop and Codex desktop; reuse_rule=Hardware, feature gates, paths, and scheduled-task state are transient; recheck first.

## Task 1: RX550, Vitrite/UIPI, Codex sync, and one-time Windows sleep

### rollout_summary_files

- rollout_summaries/2026-10-18T13-40-00-Yy29-windows_schedule_one_time_sleep_2200.md (cwd=\\?\C:\Users\605\Documents\Codex\2026-10-18\d, rollout_path=\\?\C:\Users\605\.codex\sessions\2026\10\18\rollout-2026-10-18T21-40-00-01a14f3d-9c2b-7962-be4f-914b977763dd.jsonl, updated_at=2026-10-25T23:42:30+00:00, registration/permission verified; actual sleep unobserved)
- rollout_summaries/2026-10-17T09-25-03-jNMj-amd_rx550_code31_watchdog_recovery.md (cwd=\\?\C:\Users\605\Documents\Codex\2026-10-17\windows-performance-followup, rollout_path=C:\Users\605\.codex\archived_sessions\rollout-2026-10-17T17-25-03-01a1492d-d69a-7b10-8113-9548fa69359f.jsonl, updated_at=2026-10-22T09:20:51+00:00, recovery unverified)
- rollout_summaries/2026-10-16T04-33-46-Hlpx-codex_folder_sync_scan_and_thread_handoff.md (cwd=\\?\C:\Users\605\Documents\Codex\2026-10-16\codex-codex, rollout_path=C:\Users\605\.codex\archived_sessions\rollout-2026-10-16T12-33-46-01a142fc-cea0-7e92-b74b-bacc1beb2b1b.jsonl, updated_at=2026-10-22T09:20:51+00:00)

### keywords

- RX550, Code 31, Code 43, DxDiag, DXGI, Vitrite Fixed, UIPI, ScheduledTask, SetSuspendState, SeShutdownPrivilege, .codex, FileSync, auth.json

## User preferences

- when the request says "睡眠", the user distinguished "电脑自动睡眠" from "提醒我睡觉" -> clarify whether to perform the system action or send a reminder before acting. [Task 1]

## Reusable knowledge

- One-time sleep: confirm the target time/timezone and S3 support, enable SeShutdownPrivilege, call SetSuspendState(false,false,false), register New-ScheduledTaskTrigger -Once with Register-ScheduledTask, then check Get-ScheduledTaskInfo for State and NextRunTime. [Task 1]
- Code 31 is driver AddDevice failure, not root cause; Code 0 did not prove acceleration. Verify DxDiag plus DXGI/D3D. Feature-gate state cannot be proven by stale cache; .codex sync excludes credentials/caches/runtime payloads. [Task 1]

## Failures and how to do differently

- The 2026-10-18 task proved compilation, privilege, and registration, not that the machine actually slept at 22:00; inspect task history/LastRunResult and observed power state for execution confirmation. [Task 1]
- Never declare GPU recovery from device code alone. [Task 1]

# Task Group: Chat research on NetEase rankings, BOF22 playlist authors, game lore, and redirects

scope: Evidence-led public-web research for NetEase music ordering, BOF22 participation audits, Arknights/Endfield wording, and client-side redirects.
applies_to: cwd=C:\Users\605\Documents\Codex\CHAT with GPT and research-only chats; reuse_rule=Recheck platform data and sources; do not promote incomplete or secondary-source claims as verified.

## Task 1: NetEase equal-popularity ordering and Arknights/Endfield epithets

### rollout_summary_files

- rollout_summaries/2026-10-12T11-21-15-0NtU-netease_hot_ranking_and_arknights_epithets.md (cwd=\\?\C:\Users\605\Documents\Codex\2026-10-22\new-chat, rollout_path=\\?\C:\Users\605\.codex\sessions\2026\10\12\rollout-2026-10-12T19-59-03-01a12fd8-6c2e-79d0-ad7d-1a99f236e032_01a12ffb-0abe-75f2-9fed-e757aa81a3d5.jsonl, updated_at=2026-10-25T23:42:34+00:00, ranking and lore source checks remain partial)

### keywords

- 网易云, popularity, api/artist/top/song, api/v1/artist/songs, order=hot, comments total, 塞壬唱片-MSR, HOYO-MiX, 明日方舟, 终末地, 判词

## Task 2: Full NetEase playlist 8483155610 extraction and BOF22 cross-check

### rollout_summary_files

- rollout_summaries/2026-10-14T12-49-48-QJBa-bof22_netease_playlist_full_artist_crosscheck.md (cwd=\\?\C:\Users\605\Documents\Codex\CHAT with GPT, rollout_path=\\?\C:\Users\605\.codex\sessions\2026\10\19\rollout-2026-10-19T20-48-58-01a13a76-3840-7ff1-9bb2-e275f75b1894_01a15435-3eec-7482-ba85-cc8a640b9828.jsonl, updated_at=2026-10-24T08:49:49+00:00, complete audit)

### keywords

- BOF22, 网易云, playlist 8483155610, api/v6/playlist/detail, api/song/detail, event=152, List_def, teamprofile, Credits, NoKANY, Kankitsu, Lime, Cranky, ARForest, OfficialAz3

## Task 3: Mihoyo client-side random redirect analysis

### rollout_summary_files

- rollout_summaries/2026-10-10T09-05-28-qGsV-analyze_mihoyo_random_redirect_wasm.md (cwd=\\?\C:\Users\605\Documents\Codex\2026-10-10\referenced-chatgpt-conversation-this-is-an, rollout_path=\\?\C:\Users\605\.codex\sessions\2026\10\10\rollout-2026-10-10T17-05-28-01a1250f-66a5-7341-be42-bed5847d6439.jsonl, updated_at=2026-10-22T09:20:51+00:00)

### keywords

- aha.wasm, aha.js, location.replace, random redirect, candidate set

## User preferences

- when platform scores tie, the user corrected: "不对不对，你研究一下网易云相同热度是怎么排的" -> reproduce displayed/API order or state the formula is undisclosed; do not substitute comments as ranking. [Task 1]
- when asking "把所有作者扒下来全部查一遍" -> cover the full set, retain per-item results, and distinguish confirmed, pending, and not found instead of returning representative names. [Task 2]
- for random-page analysis, identify candidate set/random method/trigger and separate proven facts from inference. [Task 3]
- for fixed-format epithets, list every requested character but mark missing reliable copy as unverified rather than inventing a completion. [Task 1]

## Reusable knowledge

- NetEase popularity/pop=100 does not resolve rank. /api/artist/{id} or /api/v1/artist/songs?id={id}&order=hot gives a single artist's hot-work order; comment total is a separate metric and cannot reconstruct it. [Task 1]
- Playlist 8483155610: /api/v6/playlist/detail?id=...&n=100000&s=0 returns trackIds; batch /api/song/detail?ids=[...] for full details. Preserve ID-0 artists by name. The verified audit recovered 373/373 tracks, 270 display artist names, and used official BOF22 work pages, Credits, and team table before confirming matches. [Task 2]
- Short-string matching creates false positives such as xi/Yi Xi and uma/JURUMA. Do not equate virtual singers, comment appearances, source songs, or acknowledgements with a real-world BOF22 author entry; leave Tsugu/Plum pending where identity evidence is insufficient. Set UTF-8 stdout on Windows to avoid GBK UnicodeEncodeError. [Task 2]
- Mihoyo redirect evidence was client-side: aha.js loads aha.wasm and then uses location.replace. [Task 3]

## Failures and how to do differently

- Do not infer a cross-artist/global Top 20 from a single artist's hot ordering. The formal NetEase ranking formula remains unverified. [Task 1]
- Arknights/Endfield epithets were mostly secondary-source leads; verify each source and clarify the 13-character list before treating wording as official. [Task 1]
- Boundary-aware automated matching is only a candidate filter; manually validate official Credits/roles before declaring BOF22 participation. [Task 2]

thread_id: 01a13a76-3840-7ff1-9bb2-e275f75b1894
updated_at: 2026-10-23T13:40:41+00:00
rollout_path: \\?\C:\Users\605\.codex\sessions\2026\10\19\rollout-2026-10-19T20-48-58-01a13a76-3840-7ff1-9bb2-e275f75b1894_01a15435-3eec-7482-ba85-cc8a640b9828.jsonl
cwd: \\?\C:\Users\605\Documents\Codex\CHAT with GPT
git_branch: main

# BOF22 rules, rankings, pre-release policy, and Long Impression access

Rollout context: The user asked in Chinese about BOF22 terminology, current rankings, official scoring, pre-registration uploads, and why the Long Impression option was not visible. Primary workspace: `C:\Users\605\Documents\Codex\CHAT with GPT`.

## Task 1: Tripcode and Delete Key

Outcome: success

Key steps:
- Explained Tripcode as a public identifier for recognizing the same reviewer, and Delete Key as the password used to modify/delete an impression.
- Clarified these are not login or email passwords; Tripcode may be left blank.

Reusable knowledge:
- BOF22 rules recommend longer Tripcodes because short strings may collide.
- Impression deletion/editing can have time-window restrictions.

## Task 2: Current high-rated BOF22 entries

Outcome: success

Preference signals:
- The user asked to “筛选10篇目前评分较高的”; future similar requests should use current official data, explicitly state the metric and review-count threshold, timestamp the snapshot, and link each work rather than present subjective recommendations.

Key steps:
- Fetched `https://manbow.nothing.sh/event/event.cgi?action=sp&event=152`.
- Excluded disqualified entries, required at least 10 impressions, sorted by raw average descending, then median, impression count, and ID.
- Found 396 numeric entries, 38 meeting the threshold, and saved a snapshot under `outputs/bof22-20261019/high-rated-snapshot.json`.

Reusable knowledge:
- The previously supplied top 10 was an average-score recommendation list, not the official final individual-total ranking; scores are time-sensitive.

## Task 3: BOF22 ranking and “个人战优胜”

Outcome: success

Key steps:
- Verified official rules: individual old total-score ranking sums valid impression points without bonuses; individual new total-score ranking applies Ratio and FINAL STRIKER bonuses; individual median ranking uses the median, breaking ties by average.
- Clarified that “个人战优胜” conventionally means the top single work by cumulative total score, not highest average or median. In BOF22, specify whether new or old individual-total ranking is meant.

Reusable knowledge:
- BOF22 impressions are scored 100–1000 and ranking depends on total points and impression count, not gameplay scores.
- Team median excludes Ratio/FINAL STRIKER adjustments; team total includes them.

## Task 4: Publishing before BOF registration

Outcome: partial

Key steps:
- Official BOF22 rules show normal promotion begins 2026-09-01, registration begins 2026-10-01 23:00 JST, registration reveal is 2026-10-09 19:00 JST, and FINAL STRIKER reveal is 2026-10-16 00:00 JST.
- Official entry HTML confirmed `クレオメ` registration at `2026/10/01 23:03`, with Ratio Point 17.

Failures and how to do differently:
- The YouTube page could not be independently fetched because of throttling, so the claimed 2026-09-25 upload date and exact video contents remained unverified.
- The safe conclusion is conditional: ordinary music/BGA promotion after September 1 is allowed, but full chart/playable BMS disclosure before the reveal is prohibited; FINAL STRIKER material has stricter restrictions.

## Task 5: Long Impression access

Outcome: partial

Key steps:
- The user showed a screenshot and said there appeared to be no Long Impression entry.
- Directly fetched the official `クレオメ` page HTML and found the actual button:
  `event.cgi?action=PrintImpression&num=8&event=152`
  displayed as `長文を投稿する` (“Post Long Impression”), beside the short-impression button `短い文章で投稿・投票する`.
- The page also contains a `Long Impression` section and confirms the impression period is active.

Reusable knowledge:
- Long Impression is available to ordinary users without mandatory impression-account registration; the account is only a convenience feature.
- On the work page, the long-review entry is the separate aqua button `長文を投稿する`, not the collapsed short-impression form. If it is absent visually, inspect the page around the `Impression` heading or open the `PrintImpression` URL directly.

References:
- Official rules: `https://www.bmsoffighters.net/bof22/rule.html`
- BOF22 event list: `https://manbow.nothing.sh/event/event.cgi?action=sp&event=152`
- Work page: `https://manbow.nothing.sh/event/event.cgi?action=More_def&num=8&event=152`
- Long Impression URL: `https://manbow.nothing.sh/event/event.cgi?action=PrintImpression&num=8&event=152`
- Exact HTML evidence: `<a href="event.cgi?action=PrintImpression&num=8&event=152" ...>長文を投稿する</a>`

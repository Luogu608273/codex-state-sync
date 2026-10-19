# Task Group: Google Drive access after retired local-sync path removal

scope: Current guidance for locating the user's Drive content after retirement of the former local mounted-sync path.
applies_to: cwd=all workflows that need the user's Google Drive content; reuse_rule=Use connected Google Drive search, folder listing, and read interfaces; do not treat a local mounted/sync path as an available Drive entrypoint unless the user explicitly supplies a current one.

## Task 1: Retire the obsolete local Google Drive sync path

### rollout_summary_files

- None available; this task is supported only by `extensions/ad_hoc/notes/20261006-172853-remove-drive-sync-path.md` [ad-hoc note]

### keywords

- Google Drive, connected Drive search, folder list, read interface, local sync path, H:\\我的云端硬盘, CKK, Gemini, Google AI Studio

## User preferences

- The user explicitly requested deletion of the obsolete local-sync-path guidance; do not present `H:\\我的云端硬盘` or its `CKK`, `Gemini`, and `Google AI Studio` subdirectories as a current Drive access route. [Task 1] [ad-hoc note]

## Reusable knowledge

- To find Drive content, use the connected Google Drive search, folder-listing, and read interfaces rather than defaulting to a local mounted drive. [Task 1] [ad-hoc note]

## Failures and how to do differently

- Symptom: a workflow looks for the retired mounted/sync path by default -> pivot to connected Google Drive interfaces; do not revive old path or permissions guidance without a newly supplied, current path. [Task 1] [ad-hoc note]

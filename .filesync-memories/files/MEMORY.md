# Task Group: Delivery destination and retired local sync-path guidance

scope: Choose a delivery destination when a task refers to the retired movable-disk sync setup; do not treat old local paths as current destinations.
applies_to: workflow=deliverables and cloud storage; reuse_rule=Apply until the user supplies a current local destination or changes this preference; this entry is sourced from an ad-hoc note, not a rollout summary.

## Task 1: Retire obsolete movable-disk sync-path guidance

### rollout_summary_files

- extensions/ad_hoc/notes/20261006-172853-remove-drive-sync-path.md (source=ad-hoc note; no rollout summary metadata available)

### keywords

- H:\\我的移动硬盘, CKK, Gemini, Google AI Studio, Google Drive, 本地同步路径, 交付目录

## User preferences

- when selecting a delivery location, the user explicitly retired `H:\\我的移动硬盘` and its `CKK`, `Gemini`, and `Google AI Studio` directories as current local sync paths -> do not default to, seek, or request access to that movable-disk mount; use connected Google Drive for delivery unless the user specifies a current destination. [Task 1]

## Reusable knowledge

- Remove old references, access assumptions, and delivery suggestions tied to the retired movable-disk sync paths; do not change unrelated C++ or contest-delivery preferences. [Task 1]

## Failures and how to do differently

- Symptom: a delivery workflow proposes or searches `H:\\我的移动硬盘` as a default -> cause: stale historical sync-path guidance -> pivot to connected Google Drive or ask for an explicitly current destination. [Task 1]

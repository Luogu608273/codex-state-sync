---
name: google-drive-verified-delivery
description: Deliver files to a requested Google Drive folder and prove the remote contents match the local delivery.
argument-hint: "<target folder or ID> <local delivery root>"
disable-model-invocation: true
allowed-tools: Read, Grep
---

# Verified Google Drive delivery

## When to use

Use for a request to upload/store finished local files in Google Drive. Do not use a retired local sync/mounted-drive path as the Drive entrypoint.

## Inputs / context to gather

1. Confirm $ARGUMENTS[0] by connected Drive search or supplied folder ID.
2. Inventory actual files and required subfolders under $ARGUMENTS[1].

## Procedure

1. Search for and list the target; confirm name and parent before creating anything.
2. Create needed child folders and retain their real IDs.
3. Upload each actual file using its absolute path, filename, MIME type, and parent ID.
4. Read metadata back for every file; compare name, byte size, and parent.
5. List the target and children; compare entries/counts to the local inventory.
6. Report only what those checks establish.

## Efficiency plan

- Build one local path -> expected parent-ID map.
- Batch searches/listings where supported.
- Stop for user direction if destination is ambiguous; never guess IDs or URLs.

## Pitfalls and fixes

- Upload reports success but placement is unknown -> use metadata readback and folder listing.
- Local sync path is absent/stale -> use connected Drive interfaces.
- Expected file is missing -> report it missing; do not create a placeholder.

## Verification checklist

- [ ] Actual target/children identified by Drive IDs.
- [ ] Every planned file uploaded from an absolute local path.
- [ ] Readback matches name, size, and parent.
- [ ] Folder listings match expected structure/counts.
- [ ] Report separates remote-delivery verification from local/test validation.

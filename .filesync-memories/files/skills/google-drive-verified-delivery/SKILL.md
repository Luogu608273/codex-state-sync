---
name: google-drive-verified-delivery
description: Create a requested contest-material tree, validate it locally, and upload it to Google Drive with a file-by-file read-back check. Use for explicit write-and-upload requests, not ordinary Drive browsing.
---

# Google Drive verified delivery

## When to use

Use when the user explicitly asks to create materials and place them in a Google Drive folder, especially contest `std.cpp` / `partial.cpp` / `solution.md` deliverables. Do not use merely to inspect or download Drive content.

## Inputs and context

1. Confirm the requested deliverable is self-authored rather than an existing file to download when wording is ambiguous.
2. Identify the connected Drive target, desired directory layout, and source contest/problem material. Treat Drive locations as remote; do not substitute a retired local sync mount.
3. Read the project instructions and actual user code when coding style or output conventions are in scope.

## Procedure

1. Create the requested local tree; preserve the agreed filenames and include only requested artifacts.
2. For contest solutions, write Chinese explanation with correctness reasoning, complexity, edge cases, and clearly labelled partial-score scope. Do not label partial analysis as official score.
3. Compile every submitted code variant with the project compiler/settings. Run supplied samples and an appropriate independent check (brute force, randomized differential test, stress test, or all applicable checks).
4. Upload only after the local deliverables are ready and the user has explicitly requested the upload. Read back each uploaded file and compare it against the local source; check the expected file count/layout.
5. Report the destination, what was locally validated, and what was not submitted or officially judged.

## Efficiency plan

- Cache the Drive parent ID and problem IDs for the current task; use one local validation harness for repeatable checks.
- Stop and request the user's login if a contest page/API is unauthorized. If a download event times out, check the downloads directory before retrying.
- Use the smallest credible test suite, then add boundary/stress checks only where the algorithm needs them.

## Pitfalls and fixes

- Symptom: Zhengrui page/API returns an unknown error or 401. Cause: unauthenticated browser session. Fix: have the user log in through the embedded browser, then reload.
- Symptom: browser `download` wait times out. Cause: the file may still have landed in Downloads. Fix: inspect the download directory before treating the attachment as unavailable.
- Symptom: delivery sounds complete but only local tests ran. Fix: state `local validation` and avoid claims of official AC or official score.

## Verification checklist

- Every requested local artifact exists and compiles where applicable.
- Samples and the chosen independent tests pass; record exact command/result when useful.
- Drive has the intended directory/file layout.
- Every uploaded file was read back and matches the local artifact.
- Final report distinguishes local validation from online judging.

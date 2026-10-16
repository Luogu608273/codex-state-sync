---
name: oi-solution-drive-delivery
description: Produce Chinese OI solution/std/partial deliverables from supplied PDFs, validate them, and upload a complete verified set to a requested Google Drive folder.
argument-hint: "<PDFs or task IDs> <Drive parent/folder>"
disable-model-invocation: true
allowed-tools: Read, Grep, Bash
---

# OI solution, verification, and Drive delivery

## When to use

Use for requests such as “写 N 道题 solution std partial，存到云端硬盘/CKK/...”. It covers authored deliverables and a verified Drive upload, not official online judging or a request to upload only pre-existing files.

## Inputs / context to gather

1. Read project instructions and the supplied PDFs. Extract constraints, samples, required filenames, scoring subtasks, and IO rules; render a page if extraction is ambiguous.
2. Locate the requested Drive parent using the connected Drive search/list interfaces. Do not use retired local sync paths.
3. Confirm the requested output directory and preserve the user’s contest style: Chinese explanation, short identifiers, global arrays, ordinary functions, `solve()`/`main()`, and default file IO unless the statement says otherwise.

## Procedure

1. Create one subdirectory per problem and write a solution, a standard program, and only genuinely scoped partial-score programs. State each partial program’s applicable constraints.
2. Compile every C++ program using the project’s current compiler; recorded reliable flags were C++17 with optimization and warnings. Test both statement-prescribed file IO and `-DLOCAL` standard IO when the project convention supports it.
3. Build an independent checker or brute-force oracle for small cases. Cover samples and important boundaries (including coupled constraints, negatives/zero values, empty cases, and special edges when applicable).
4. Write a concise README plus machine- or human-readable verification record that names tests, counts, compiler, flags, and limitations.
5. Create/list the target Drive folder, upload every artifact, then list/read back the folder metadata. Compare every filename, size, and parent against the local manifest.
6. Report local evidence precisely; explicitly distinguish it from official submission/AC.

## Efficiency plan

- Extract all statements and make an artifact/test inventory before coding to prevent repeated PDF reads.
- Reuse one compilation/verification harness across problems, but independently test delicate subroutines before the integrated run.
- Cache Drive parent/folder IDs only for the active request; re-list before upload and after upload.
- Stop and resolve a constraint or IO ambiguity before choosing the algorithm; do not infer independent maxima when the statement supplies a coupled bound.

## Pitfalls and fixes

- “O(n²m) is surely too slow” -> derive implicit bounds first (for example, `nm <= 2e6`); give an operation upper bound and measure the actual implementation.
- Optional Python modules are unavailable (`fitz`, `psutil`) -> use `pypdf` plus `pdftoppm` for PDF inspection and Windows `psapi` for working-set measurement when available.
- Upload call succeeds but remote set is incomplete -> do a post-upload folder listing and compare name, size, and parent for every expected item.
- Tests pass locally -> say “local compile/differential/sample validation passed”; never call it official AC without a recorded official result.

## Verification checklist

- Every requested problem has solution, std, partial artifact(s), and stated partial applicability.
- Every program compiles and passes samples plus appropriate small oracle/differential tests.
- Default file IO and local standard IO behavior are checked where relevant.
- Verification report records compiler/flags, tests, and official-AC limitation.
- Drive folder contains every manifest item with matching filename, size, and parent.

# MOMO System v0.5 — Phase 0 status

Date: 2026-09-13
Status: **PHASE 0 IN PROGRESS / G0 NOT PASSED / STOP AT PHASE BOUNDARY**

Human explicitly authorized Phase 0 and then authorized continuation of Phase 0 local recovery / isolated restore work. Phase 1 is not authorized by this record.

## Confirmed remote baseline

All ten affected remote `main` revisions were re-read and match the planning observations. Recovery refs were created for observed remote state, with separate refs for accepted MOMO/KIBI semantic and architecture targets where repository HEAD is not itself the accepted target.

`REMOTE_BASELINE.json` records the exact observed revisions and fixed accepted targets. Preservation does not convert candidate, local-only or historical material into accepted state.

## Recovered historical local evidence

Existing durable portability/local-audit evidence establishes that local-only state previously existed and therefore cannot be silently treated as absent. Examples include:

- KIBI primary-checkout archives `KIBI.7z` and `KIBI_CONTROLLER_SPEC.tar`;
- a dirty `KIBI-conformance-remediation-v1` worktree with tracked and untracked remediation/test material;
- KIJI/MSPO local-only history, a KIJI Lab stash and ignored/raw `workspace-data`;
- SARU modified/untracked legacy material and `.saru-state`;
- SandFrog local EXP026-B files;
- MOMO local untracked icon material.

These observations are historical locators, not current facts or acceptance. Phase 0 must freshly recover or explicitly disposition them with evidence.

## Current execution package

A bounded Windows recovery package is now fixed on this Phase 0 branch:

- `windows/Invoke-Phase0Validated.ps1` — official entrypoint. It requires an independently evidenced storage destination, preserves the known historical local locators fail-closed, invokes the worker, and reconstructs all ten repositories directly from the independent copy without source remotes/original worktrees.
- `windows/Invoke-Phase0LocalRecovery.ps1` — worker. It re-checks the ten remote refs, creates/verifies full-history bundles, inventories local repos/worktrees/refs/stashes, preserves dirty/untracked work, snapshots known indispensable non-Git state, runs hash/negative checks, and creates the independent recovery copy.
- `windows/RUNBOOK.md` — bounded execution procedure and STOP behavior.

The package performs recovery-only preservation and verification. It does not clean old worktrees, merge local work, execute recovered Products, start services, retry SandFrog, activate SARU, change semantic selection, or perform migration.

## Remaining G0 evidence

G0 is still not passed until the original Windows preservation boundary runs the validated entrypoint and returns attributable evidence showing:

1. no fresh remote drift;
2. local refs/stashes/dirty/untracked material preserved or explicitly unresolved;
3. required non-Git state preserved and hash-restored;
4. a genuinely independent copy exists outside affected working copies/repositories and ordinary same-disk storage;
5. all ten repositories restore directly from that independent copy into empty destinations without source remotes/original worktrees;
6. accepted target objects and current STOP/Human Gate meaning remain recoverable;
7. corrupted recovery artifacts are rejected;
8. no historical local locator required for preservation disappeared without an evidence-backed disposition.

The machine result is `PHASE0_LOCAL_RESULT.json`. A local mechanical PASS is necessary but not itself the final durable G0 receipt; its evidence must be reviewed against the fixed Phase 0 contract.

## Boundary

Until the returned evidence is reviewed and a durable receipt records **RECOVERY INSURANCE VERIFIED / STOP**, the state remains:

**PHASE 0 IN PROGRESS / G0 NOT PASSED / PHASE 1 NOT AUTHORIZED / STOP.**

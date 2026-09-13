# Phase 0 Result Intake — Review-Wait Checklist

Status: **PREPARATION ONLY**

This checklist is for the Windows recovery run already in progress. It does not assume a successful result and does not convert Human risk acceptance into a mechanical PASS.

## Required returned artifacts

Review the newest run outputs together:

- `PHASE0_LOCAL_RESULT.json`
- `PHASE0_INDEPENDENT_RESTORE.json`
- `historical-local-locators.csv`
- supporting hash/manifests/logs only where the result points to them

## Required checks

1. `phase0_pass` / worker result is explicit and attributable to this run.
2. Independent storage remains proven external/remote; previously observed USB evidence was `EXTERNAL_OR_REMOTE_BUS:USB`.
3. Ten repositories restored from the independent copy into empty destinations without relying on original worktrees or source remotes.
4. Expected current/accepted objects are present in restored repositories.
5. Dirty/untracked/stash/local-ref preservation failures are empty or explicitly dispositioned.
6. Required non-Git state was preserved and restore hashes/counts match.
7. Corrupted bundle/artifact negative test was rejected as expected.
8. Historical-locator failures are reviewed individually rather than silently ignored.
9. The previously reported `KIJI Lab / stash source` locator absence receives an evidence-backed disposition if it remains unresolved.
10. Recovered runtime/evidence is not executed, promoted or treated as current authority merely because it was preserved.
11. SARU remains HUMAN_GATE / STOP and external-mutation authority remains zero unless a later explicit Human decision changes it.

## Result classes

### Mechanical PASS
All mandatory recovery checks passed. A durable G0 receipt may then record `RECOVERY INSURANCE VERIFIED / STOP` after evidence review.

### Mechanical FAIL / unresolved evidence
Record `PHASE 0 FAIL / STOP` or the exact unresolved condition. Do not clean source material or claim recovery insurance.

### Human-accepted residual risk
If v0.5 work continues despite an unresolved Phase 0 condition, keep the condition explicit. Human risk acceptance may allow sequencing to continue, but it must never be rewritten as mechanical recovery success.

## Cleanup rule

Do not delete original local-only material, temporary recovery packages, source worktrees or external recovery copies until the reviewed disposition identifies which artifacts are durable evidence and which are safely disposable.
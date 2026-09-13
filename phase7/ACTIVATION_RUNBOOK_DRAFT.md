# MOMO System v0.5 — Phase 7 Activation Runbook

Status: **DRAFT / NOT AUTHORIZED / DO NOT EXECUTE BEFORE PHASE 6 PASS + HUMAN DECISION**

This runbook prepares the semantic switch from v0 Current authority to the reviewed v0.5 responsibility model. Preparation is not activation.

## Preconditions

All are mandatory:

1. Fresh independent Phase 6 review returns PASS against the exact fixed targets.
2. The review result is durably recorded without Builder reinterpretation.
3. Human makes the required pre-acceptance / activation decision.
4. `review-wait/DRIFT_GATE.md` is rerun against live `main` immediately before writes.
5. No unresolved material semantic drift exists.
6. Capability/evidence drift selected for retention has a preservation/adoption path.
7. Current Phase 0 outcome or residual-risk exception is explicitly recorded; no mechanical PASS is invented.
8. Pre-activation rollback refs are created for every repository whose Current meaning will change.

If any condition is false: **STOP**.

## Reviewed semantic destination

Exactly five responsibility-bearing Actors:

- MOMO — System meaning, reusable System knowledge, Human-facing views; not Human/Supervisor.
- KIBI — semantic connection Protocol; not orchestrator and not owner of Application internals.
- KIJI — World evidence/observation/interpretation through implementable Requirements.
- INNU — accepted Product/Capability realization, completion, recovery, technology/model/tool mastery.
- SARU — Human World Activation/operation plus bounded reality experimentation; Human authority remains external.

Ownership convergence:

- MOMO-Observatory → MOMO
- references → MOMO
- Dango → INNU
- FROG → SARU
- SandFrog → SARU

Technical repositories may remain modules/evidence stores. Technical separation must not recover them as additional constitutional Actors.

## Activation sequence

### A. Freeze inputs

Record:

- Phase 6 review receipt SHA;
- reviewed candidate SHAs;
- live pre-activation `main` SHAs for all affected repositories;
- drift classifications and dispositions;
- Phase 0 disposition.

Do not activate from branch names alone.

### B. Create rollback refs

Create immutable or clearly named pre-v0.5 recovery refs for every `main` that will be changed. Verify each ref resolves to the captured pre-activation SHA before continuing.

### C. Reconcile non-material live drift

Preserve capability/evidence changes that occurred after the frozen review target without changing the reviewed constitutional meaning.

Known current example: Dango Gemini/Windows routing/evidence at `0eb12a8618ce167f6963e0d58ae6dab0944d5a7f` must not be lost when Dango responsibility is activated under INNU.

If reconciliation requires changing reviewed Actor/Authority semantics, stop and return to review.

### D. Activate owner-side Current meaning

Make only the semantic changes already covered by the reviewed candidate:

- MOMO becomes the accountable home for System meaning/reusable System knowledge/Human views.
- KIBI Current interpretation reflects the five-Actor deployment without losing Protocol topology-neutrality.
- KIJI Current interpretation makes Requirements the responsibility endpoint.
- INNU Current interpretation owns model/tool mastery and the Dango capability/module.
- SARU Current interpretation owns Reality Mentor / experimental-substrate capabilities while retaining HUMAN_GATE and bounded external-action authority.

Do not introduce new capability design in the activation patch.

### E. Activate source-module status

For MOMO-Observatory, references, Dango, FROG and SandFrog, update Current interpretation only as needed to make owner/module status unambiguous under v0.5.

This is not physical retirement. Preserve provenance/history and do not delete repositories in Phase 7.

### F. Activate MOMO System view

Update the MOMO Current/Human-facing recovery entry so a Fresh Actor can recover:

- v0.5 is Current;
- exactly five responsibility-bearing Actors;
- owner/module mapping;
- Human sovereignty;
- `Reference = evidence, not authority`;
- STOP/HUMAN_GATE boundaries;
- source of Current state and recovery precedence.

### G. Post-write verification

From remote Git, not mutable local assumptions, verify:

1. every activated `main` is the intended SHA;
2. exactly five Actors recover;
3. no source module recovers as a sixth Actor;
4. MOMO is not Supervisor/Human;
5. KIBI is not orchestrator;
6. KIJI does not own build/activation;
7. INNU routing capability does not become Task authority;
8. SARU/FROG history does not grant replay/external mutation;
9. private Observatory material has not been exposed publicly;
10. preserved capability drift is still reachable;
11. no old Task completion commissions new work.

### H. Activation receipt and STOP

Write a durable activation receipt containing exact before/after SHAs, review receipt, drift disposition and rollback refs.

Then stop at the Phase 7 boundary. Activation does **not** authorize Phase 8 behavior beyond its separately bounded Fresh Actor recovery test.

## Rollback

If post-write semantic verification fails:

- stop all further v0.5 progression;
- restore affected `main` refs to captured pre-activation SHAs using the rollback plan;
- preserve failed activation commits as evidence rather than erasing provenance;
- do not use rollback as permission to run old runtime/experiments.

Result: `ACTIVATION FAILED / ROLLED BACK / STOP` until separately repaired and reviewed.
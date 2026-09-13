# v0.5 Pre-Activation Drift Gate

Status: **DRAFT / PREPARATION ONLY / NOT AN ACTIVATION DECISION**

Purpose: prevent mutable `main` updates from silently changing or deleting the exact semantics reviewed in Phase 6.

## 1. Inputs

Immediately before any Phase 7 activation write, compare every affected repository `main` against the pinned baseline/candidate recorded in `ACTIVATION_INPUT_MANIFEST.json`.

The frozen Phase 6 review target is never moved merely to follow `main`.

## 2. Drift classes

### A. Content-neutral history

Examples: create/revert pairs with zero resulting file diff.

Disposition: record provenance; normally non-blocking.

### B. Capability / evidence drift

Examples: new evidence, routing observations, implementation evidence, experiment records or reusable knowledge that do not alter Actor identity, constitutional ownership, Human authority, STOP semantics, privacy boundary or responsibility contracts.

Disposition: preserve and reconcile into the owner-controlled module path. Do not silently discard it. It does not automatically invalidate the Phase 6 semantic review.

### C. Material semantic drift

Any change to Actor identity/cardinality, ownership, authority precedence, Current/Source meaning, KIBI orchestration boundary, KIJI/INNU/SARU responsibility boundary, Human sovereignty, external-mutation authority, STOP/HUMAN_GATE, module-vs-Actor status, public/private handling or `Reference = evidence, not authority`.

Disposition: **BLOCK ACTIVATION**. Reconcile the change into a new exact candidate and repeat the required review scope before activation.

### D. Runtime / external-world drift

Credentials, services, schedules, n8n, external APIs, runtime state or action permissions that changed independently of Git semantics.

Disposition: do not infer authority from availability. Verify separately only where Phase 7 actually needs it. Runtime drift cannot silently grant action permission.

## 3. Current review-wait snapshot

As of the review-wait recheck on 2026-09-13:

- MOMO: no file drift;
- KIBI: known two-commit create/revert history; zero file diff;
- KIJI: no drift;
- INNU: no drift;
- SARU: no drift;
- MOMO-Observatory: no drift;
- references: no drift;
- FROG: no drift;
- SandFrog: no drift;
- Dango: four commits ahead; three added files covering Gemini/Windows evidence, routing and episode data.

Dango is provisionally Class B. Its current head is `0eb12a8618ce167f6963e0d58ae6dab0944d5a7f`. Preserve it under INNU ownership during activation reconciliation. Do not replace the frozen source-side review target `f8224a6e02dbd0630cbab0e821cf5f5d73e19770` with the newer head inside the already-issued Phase 6 commission.

## 4. Gate result

Activation may proceed only when:

1. Phase 6 independent review has passed;
2. all current drift has been classified;
3. no unresolved Class C material semantic drift exists;
4. capability/evidence drift selected for retention has an explicit preservation path;
5. current Phase 0 disposition is recorded without fabricating a mechanical PASS;
6. Human gives the activation decision required by the Phase 6 recommendation.

If any condition fails: **STOP BEFORE ACTIVATION**.
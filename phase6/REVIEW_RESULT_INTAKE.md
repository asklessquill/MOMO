# Phase 6 Independent Review Result Intake

Status: **PREPARATION ONLY / DOES NOT SUBSTITUTE FOR FRESH REVIEW**

Use this after the fresh independent reviewer returns its result against the fixed Phase 6 commission.

## Required provenance

Record:

- reviewer/model/surface as reported;
- exact commission path used;
- primary fixed target `asklessquill/MOMO@0d140db495859022f0c1faeb89436e9e6c1f66d1`;
- companion fixed targets actually inspected;
- complete reviewer verdict/findings without Builder rewriting their meaning.

## PASS path

Required verdict:

`PASS — PRE-ACCEPTANCE CANDIDATE IS SEMANTICALLY COHERENT`

Check that any NON_BLOCKING findings are preserved explicitly. Do not convert them into `0 findings`.

Expected recommendation:

`READY FOR HUMAN PRE-ACCEPTANCE DECISION / STOP`

Then write a durable review receipt and stop. PASS does not itself activate v0.5; Human activation/pre-acceptance decision and the pre-activation drift gate remain required.

## FAIL path

If any BLOCKER exists or verdict is FAIL:

- record the exact blocker and source path/SHA;
- do not repair inside the reviewer context;
- do not activate;
- return to a separately bounded repair candidate;
- repeat only the review scope invalidated by the repair, with a fresh reviewer where required.

Result: `NOT READY — REPAIR BLOCKERS / STOP`.

## Phase 0 treatment

The independent reviewer must not fabricate Phase 0 mechanical PASS. If it classifies the outstanding recovery condition as accepted residual risk, retain that classification separately from semantic PASS.

## Drift treatment

Post-review mutable-main updates do not rewrite the reviewed fixed target. Run `review-wait/DRIFT_GATE.md` before activation. Material semantic drift requires reconciliation and renewed review; capability/evidence drift must be retained without silently changing the constitutional decision.
# MOMO System v0.5 — Phase 4 Capability Migration

Status: **PREPARED / INACTIVE / NONCURRENT**

Phase 4 uses responsibility-aware module adoption rather than mandatory physical repository merging.

## MOMO-owned capabilities

- MOMO-Observatory capability contract: `v05/capabilities/MOMO_OBSERVATORY_MODULE.md`
- references knowledge capability contract: `v05/capabilities/REFERENCES_KNOWLEDGE_MODULE.md`

Pinned source candidates:

- MOMO-Observatory owner-convergence candidate: `6683dd62f75ed8d49609d28143bcfce42dabc315`
- references owner-convergence candidate: `21ee2743fb4d5b8598350d8d9a18e61caf98764d`

## Migration rule

Responsibility ownership moves to MOMO under v0.5 while technical repositories/storage may remain separate modules where privacy, churn or maintainability justify it. Technical separation does not create an additional Actor.

The public/private boundary is preserved: private Observatory payloads are not copied into public MOMO by this phase.

`Reference = evidence, not authority` remains invariant.

No current authority source is switched, no repository is retired, and v0.5 remains inactive. Phase 5 must verify that the resulting owner-side contracts are semantically sufficient and that later routine recovery can stop treating the old repositories as independent responsibility authorities.

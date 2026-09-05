# Project 桃多郎 — System Snapshot 2026-09-05

Status: **Human working snapshot / historical semantic record**  
Date: **2026-09-05 JST**

This document records the whole-System picture held by Human at the end of the 2026-09-05 Genesis work.

It is intentionally broader than one implementation Task and narrower than a Constitution. It exists so that design obligations created today do not remain only in chat memory.

This snapshot does **not** override later Human-ratified Canonical documents. Where Astra Ultra subsequently ratifies or refines MOMO / KIBI architecture, those durable Canonical records govern current semantics while this file preserves the 2026-09-05 transition context.

---

## 1. What changed today

The System moved from a loosely separated set of repositories toward a clearer responsibility architecture.

### MOMO

MOMO is being clarified as the closest System representation of Human intent and System-wide meaning.

Human remains outside the System and remains the final source of Purpose and constitutional authority.

> **MOMO ≠ Human.**

MOMO must not become a central Supervisor or take ownership of Application internals.

### KIBI

KIBI is being separated from System-wide constitutional/philosophical ownership and re-centered on its own Purpose:

> **異なる自律Applicationが、それぞれの独立性を失わず、安全かつ意味的に接続・協働できる状態を成立させること。**

> **KIBI is the Protocol that makes connection possible.**

KIBI must not become an Application runtime, central task manager, fixed pipeline, or shared internal database.

### MOMO Principles

System-wide Principles that historically matured inside KIBI are moving toward MOMO while preserving KIBI provenance.

New Human direction added today includes:

- capability and learning reuse across Applications;
- continuous learning within each Application responsibility;
- explicit preservation of Application independence;
- real-world orientation.

Key distinctions:

> **Role owns responsibility. Capability may be shared.**

> **Share capability and learning, not internals.**

> **Act → Observe → Learn → Improve → Act**

> **鬼ヶ島とは現実世界である。**

### MOMO-Observatory and MOMO

The intended direction is one semantic truth with multiple views, not two competing sources of truth.

Candidate relationship:

```text
Human
  ↓ Purpose / Direction / Decision
MOMO semantic truth
  ├─ Actor / AI-readable representation → MOMO-Observatory
  └─ Human-facing projection          → MOMO / Pages / Cockpit
```

The exact authority and source-of-truth model remains part of the formal architecture Task.

---

## 2. Current Genesis sequence

The current Astra Ultra work is intentionally split into three Tasks.

### A1 — Responsibility ratification + MOMO Principles update

Purpose:

- apply the Human-approved MOMO / KIBI responsibility transition;
- review and ratify the smallest coherent MOMO Principle structure;
- integrate capability reuse, continuous learning and real-world orientation;
- define the MOMO-Observatory ↔ MOMO semantic truth/view relationship;
- preserve provenance and Human authority evidence.

Boundary:

- do not design the full KIBI Protocol;
- do not design the full MOMO Cockpit;
- do not migrate Applications.

### A2 — KIBI Protocol Architecture

Blocked until A1 is complete and pushed.

Purpose:

- define semantic objects and relationships for Identity, Role, Responsibility, Capability, Knowledge, Contract, Authority, Result, Evidence, Provenance, recovery and interoperability;
- support reusable Knowledge and callable Capability without responsibility transfer;
- support negative states, stale knowledge, provider unavailability, quota exhaustion, revocation and Fresh Actor recovery;
- use GitHub as the first replaceable reference substrate, not as the Protocol itself.

Boundary:

- design only;
- no Production Protocol implementation;
- no Application migration.

### A3 — MOMO / MOMO-Observatory / Human Cockpit Architecture

Blocked until A2 is complete and pushed.

Purpose:

- define MOMO semantic architecture;
- define Actor-readable and Human-facing views of one semantic truth;
- define Human Intent / Direction semantics;
- define integrated outward observation without ingesting Application internals;
- define public/private boundaries and Human Cockpit information architecture.

Boundary:

- do not build a central command tower;
- do not implement the final Cockpit;
- do not alter Applications.

Each step has an explicit **Push + STOP** boundary before the next Task begins.

---

## 3. Application follow-through created by the recomposition

The three Astra Tasks do not exhaust the System obligations created today.

### SARU

SARU has not yet materially advanced as an implementation project, but the MOMO/KIBI recomposition indirectly clarifies the question SARU must eventually answer.

A follow-up is required to define SARU's proper Role / Responsibility under the new architecture, including whether and how task sequencing, dependency management, progress coordination, time/cost-aware planning, and next-action selection belong inside SARU.

This must not be assumed before the role is explicitly designed.

Tracking: https://github.com/asklessquill/Saru/issues/1

### INNU

The priority is **source-of-truth first**.

Before broad philosophy-conformance fixes:

1. consolidate project-wide Canonical state;
2. separate current / historical / provisional material;
3. preserve existing audit evidence;
4. map findings against ratified MOMO/KIBI semantics;
5. design remediation;
6. then implement.

Tracking: https://github.com/asklessquill/Innu/issues/1

### KIJI

The same source-of-truth-first sequence applies.

Current functionality and World Experience work should not substitute for a coherent project-level Canonical identity and boundary model.

Tracking: https://github.com/asklessquill/Kiji/issues/2

---

## 4. Later System-integration obligations

These are intentionally preserved but **not authorized to start automatically**.

- Cross-Application KIBI conformance review
- Capability / reusable-Knowledge interoperability experiment
- Fresh Actor recovery validation
- MOMO integrated-observation validation
- Cross-runtime and cross-environment portability checks
  - Cloud ↔ Cloud
  - Cloud ↔ on-premise
  - on-premise ↔ on-premise
  - Desktop ↔ Server
  - GitHub-hosted ↔ self-hosted
  - Human-operated ↔ autonomous machine

---

## 5. Temporary task-management model

The System currently needs a durable place to remember unresolved cross-repository obligations.

Until SARU's responsibility is explicitly clarified, MOMO carries only a **temporary System-level unresolved-work ledger**.

This does not give MOMO task-execution authority.

Current tracking anchor:

- MOMO Genesis Epic: https://github.com/asklessquill/MOMO/issues/1

If SARU later becomes the explicit owner of task/dependency orchestration, operational backlog management may move there while MOMO continues to preserve System-wide Human-facing meaning and provenance.

Desired separation:

```text
MOMO semantic record   = what the System means / what remains unresolved at System level
GitHub Issue           = durable unresolved obligation
Project / future SARU  = operational planning and progress coordination, if explicitly assigned
Application repo       = Application-owned execution work
Human                  = Purpose / constitutional decision / genuine Human-only boundaries
```

---

## 6. Guardrails preserved at this snapshot

- Human remains the final constitutional authority.
- MOMO must not become Human or Supervisor.
- KIBI must not own Application internals.
- Applications retain independent execution responsibility.
- Capability reuse must not silently transfer responsibility.
- Knowledge availability must not be confused with live capability availability.
- Task completion must not manufacture authority for the next Task.
- Delivery, acceptance and execution remain distinct.
- Historical authorization must not be confused with current authority.
- Architecture design must not be claimed to have fixed implementation defects.
- GitHub is a reference substrate and durable transport/state mechanism, not a Principle.

---

## 7. Current location

At the time this snapshot was written:

- the Human-approved A1 prompt is prepared for Astra Ultra;
- A2 and A3 are deliberately waiting behind A1;
- SARU / INNU / KIJI follow-through has been durably recorded;
- no Application migration has been authorized by this snapshot;
- the overall design philosophy is converging, while implementation conformance remains future work.

This is the point from which the next durable Genesis records should proceed.
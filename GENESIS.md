# MOMO Genesis

This file records why the MOMO repository was created, and what is deliberately not decided yet.

It is a bootstrap record, not a Constitution.

## Why this repository exists

MOMO was created as a new public repository so that, later, Purpose / Constitution / Principles can be separated from KIBI without confusion.

The intended direction is:

```text
Human
  ↓
MOMO
  ↓
KIBI
  ↓
Applications
```

- Human is the source of intent.
- MOMO is the closest system representation of that intent.
- KIBI is meant to become the dynamic function protocol that lets applications connect under MOMO.
- KIJI, INNU, and SARU remain applications.

That structure is a direction, not a finished architecture. This repository exists as the receiving place for a later split. It does not complete the split.

## What current KIBI still holds

As observed on 2026-09-05, current KIBI still collocates two kinds of responsibility:

1. Constitution / Principle
2. Application connection / Role protocol

KIBI README v0.3 remains the current Human-ratified constitutional text. Its role table still names MOMO as Human / Purpose, and treats Human as the initial implementation of that role. KIBI's controller document still receives Purpose / Policy / Authority from MOMO.

That is the present KIBI state. It is not re-ratified here.

A 2026-09-05 KIBI audit exists and is marked non-canonical. It does not add, change, or repeal Principles. Codex strengthening work on KIBI is still in progress. The snapshot below is a reference at genesis time, not a claim that those revisions remain latest.

## What this genesis does not do

This bootstrap does not:

- copy current KIBI v0.3 Principles into MOMO
- write a new Constitution
- add Canonical Principles without Human ratification
- re-ratify, amend, or replace current KIBI canonical text
- implement runtime, agent orchestration, APIs, or Contract schemas
- design MOMO as a central supervisor
- give MOMO responsibility for KIJI / INNU / SARU internal state
- pre-build the future KIBI implementation

The current KIBI identification of MOMO with Human is left in KIBI. This repository records Human's present direction — **MOMO ≠ Human** — without claiming that KIBI has already been rewritten to match.

Formal separation will happen only after KIBI strengthening is finished, and only by Human judgment.

## Related repositories as a project premise

Each application stays loosely coupled. Project work, however, may read the current source repositories when a boundary, result, contract, or revision must be checked.

| Repository | Observed at genesis | What was used |
|---|---|---|
| https://github.com/asklessquill/MOMO | Public, empty, no default branch | This genesis is the first content |
| https://github.com/asklessquill/KIBI | Private `main` `dc740772eade3fa3816ef7d7cbf4bec6913c4adc` | README v0.3, controller spec, 2026-09-05 non-canonical audit |
| https://github.com/asklessquill/Kiji | Private `main` `6a986371e8b5f14044afb58732df2a37ab09b98d` | Restart prompt and KIBI-facing Create role |
| https://github.com/asklessquill/Innu | Private `main` `1e740e0b1e7479b6e292fd2539edcc576f15e4d3` | README / current state; Owata as Build implementation |
| https://github.com/asklessquill/Saru | Private `main` `6ca0839578f31d10e7569104ac8e6d58276310b5` | README v0.2 and execution rules; Act role under current KIBI |

KIJI, INNU, and SARU currently take their constitutional source from KIBI, not from this repository. That remains correct until Human completes the later split.

If a needed repository cannot be read, that is a blocker. Do not invent its current state from memory.

## What Human will decide later

After KIBI strengthening is finished, Human will decide:

- what Purpose / Constitution / Principles move into MOMO
- what remains in the next KIBI as a function protocol
- how current KIBI's MOMO = Human / Purpose wording is retired or rewritten
- the detailed responsibility of MOMO

Until that judgment, MOMO stays a small identity: the closest system representation of Human intent, and a safe empty place for the later public source of truth.

## Subsequent Human Direction

After Genesis, Human added one responsibility without moving Constitution or Principles into MOMO.

**MOMO watches the whole. It does not control the whole.**

MOMO remains the closest system representation of Human intent. It may look across KIBI and the applications, compress that picture for Human, and surface decisions only Human can make. It must not become a central supervisor, and it must not take over another application's authority.

The monitoring boundary is recorded in [`MONITORING.md`](MONITORING.md). Formal transfer of Purpose / Constitution / Principles still waits for KIBI strengthening and Human judgment.

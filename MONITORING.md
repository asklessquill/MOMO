# MOMO Monitoring Boundary

This file records how MOMO watches the whole without controlling it.

This remains lower-level monitoring guidance under the [Human-approved MOMO Principles](PRINCIPLES.md) and [source/view governance](SOURCE_AND_VIEWS.md). The [responsibility transition is recorded](HUMAN_RATIFICATION_2026-09-05.md); this guidance does not independently ratify or change Principles.

> MOMO sees the whole, but does not control the whole.

> 全部を見る。しかし全部を動かさない。

**MOMO observes. Applications act. Human decides.**

## What MOMO watches

MOMO is the closest system representation of Human intent. It also holds an integrated view of the KIBI System.

It looks at:

- where each application stands
- how the applications fit together
- how that picture relates to Human purpose
- anomalies, contradictions, stops, and Human decision boundaries
- then explains that picture at a level Human can use

The present reference set is MOMO, KIBI, KIJI, INNU, and SARU. If more applications join later, the view is not limited to those three applications.

## MOMO View

MOMO does not enter another application's internals. It reads the meaningful state each application shows outward.

> Share results, not internals.

What MOMO needs to know is the kind of thing another application can share without giving up its own work:

| Place | What the outward view is for |
|---|---|
| KIBI | Whether connection, contract, authority and boundary hold under KIBI's own semantic Protocol responsibility, with observed adoption and remaining limits distinguished |
| KIJI | What is being seen in the world, what was found, what result exists, and whether that result can be handed on |
| INNU | What is being built, what is finished, what is accepted, and what is incomplete or stopped |
| SARU | What is meant to act on people and the world, what can run, what actually happened, and whether authority, cost, or Human boundary is at risk |
| MOMO | What purpose Human has given, which Human decisions remain open, and whether MOMO's own definition is consistent |

## Observe, not control

MOMO may find a problem, name a contradiction, offer a recommendation, and show a boundary that only Human can decide.

MOMO must not take another application's authority in order to fix the problem.

Each application remains itself. MOMO does not:

- manage KIJI research tasks
- manage INNU builders or implementation steps
- choose SARU's individual actions one by one
- operate KIBI routing from the center
- manage another application's agents, retries, schedulers, or models
- approve routine application work

Seeing across applications and leaving each application autonomous must remain compatible.

```text
MOMO observes:
  INNU cannot continue because a required Result is missing.

GOOD:
  Explain the whole to Human.
  Show which application boundary is stuck.

BAD:
  Enter INNU and rearrange its builder work.
```

MOMO is not a command tower. It is an observatory.

It is also not a mere health monitor. Even if every application is running, MOMO still asks whether the whole is still moving in the direction Human intended.

## What Human hears

MOMO must not push many repositories and many internals back onto Human.

When it can, it converges to:

1. What was done
2. What was confirmed
3. What happens next
4. Where things stand
5. What Human must decide

If Human asks at a high level, MOMO answers at that same level. Evidence stays available for drill-down. Ordinary reports do not make Human read task graphs or large technical dumps.

MOMO's compression is:

> Repository-scale complexity → Human-scale meaning

## Current repository state comes first

Memory and old conversation are not the source of truth.

When a repository can be read, MOMO checks the current branch, active lineage, recent meaningful commits, README, current state, handoff, results, evidence, contracts, and the relevant history.

`main` is not assumed to be the latest place of work. If another branch is active, its meaning is checked. An old snapshot is not reported as the present.

If a needed repository cannot be read, MOMO does not invent the missing state. It tells Human that part is **UNKNOWN / UNOBSERVABLE**.

## Public / private boundary

This repository is public.

Being able to read a private repository is not the same as being allowed to publish what is there.

Public MOMO may hold MOMO's public role, this monitoring philosophy, and public-safe structure.

Public MOMO must not receive private evidence, operational state, credentials, tenant information, confidential results, private implementation detail, or current state that was not meant for publication.

The existing private GitHub Project is one Human-facing monitoring view. Its retained observations are not made current by this document transition. A full Cockpit design and synchronization implementation are separate Tasks.

The current ownership relation is one semantic truth with multiple views:

- Actor / AI-readable semantic source for MOMO System meaning: private repository `asklessquill/MOMO-Observatory`.
- Human-facing projection of the same meaning: this MOMO repository and its Pages; the private GitHub Project is an additional authorized view.

MOMO-Observatory holds MOMO Purpose, Principles, explicit Human Direction and integrated semantic interpretation. Application outward facts remain sourced observations with provenance; their originals and internals remain with their owners. Human remains the final source of Purpose and constitutional authority. Neither the semantic source nor any view controls Applications.

This public repository presents the authorized public-safe philosophy/governance projection with source revision and provenance; it does not keep a competing constitutional truth. Current private state stays out of this repository.

Historical public explanations remain labeled historical. No private operational snapshot store, observation refresh or automatic view synchronization is implemented by this Task.

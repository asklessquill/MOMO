<p align="center">
  <img src="assets/momo-git-icon.png" width="148" alt="A peach with an eye — MOMO watches">
</p>

<h1 align="center">Project MOMO</h1>

<p align="center">
  <img alt="Human-first" src="https://img.shields.io/badge/Human--first-2c211c?style=flat-square">
  <img alt="Observe, not control" src="https://img.shields.io/badge/Observe%2C%20not%20control-e89b7a?style=flat-square">
  <img alt="GitHub-native" src="https://img.shields.io/badge/GitHub--native-5f7d52?style=flat-square">
</p>

<p align="center"><strong>Human intent enters here.</strong></p>

<p align="center">
  MOMO watches the whole system,<br>
  keeps it aligned with purpose,<br>
  and explains its meaning back to Human.
</p>

<p align="center">
  <em>MOMO sees the whole, but does not control the whole.</em><br>
  全部を見る。でも全部は動かさない。
</p>

<p align="center"><strong>MOMO ≠ Human.</strong> Human is the source. MOMO is the closest system representation of that intent.</p>

## The map

Before the sentences, the shape:

<p align="center">
  <img src="assets/system-map.png" width="720" alt="Human above MOMO, MOMO above KIBI, then KIJI INNU and SARU beside one another, then human society">
</p>

```mermaid
flowchart TB
  Human["Human — source of intent"] --> MOMO["MOMO — sees, does not control"]
  MOMO --> KIBI["KIBI — connects"]
  KIBI --> KIJI["KIJI — sees the world"]
  KIBI --> INNU["INNU — builds"]
  KIBI --> SARU["SARU — acts"]
  KIJI --> World["Human society"]
  INNU --> World
  SARU --> World
```

This is the intended direction, not a finished architecture. Current KIBI still holds the constitution. Formal separation has not happened.

## What MOMO does

<p align="center">
  <img src="assets/observe-not-control.png" width="720" alt="MOMO sees the whole and does not control applications">
</p>

MOMO is not a command tower. It is an observatory.

Applications remain themselves. MOMO does not run their work, approve their routine, or enter their internals.

## The companions

<p align="center">
  <img src="assets/meaning-flow.png" width="720" alt="See, build, act — KIJI, INNU, SARU">
</p>

| | | |
|---|---|---|
| **KIJI** | sees the world | finds what matters outside |
| **INNU** | builds | turns need into something real |
| **SARU** | acts | changes people and the world |

KIBI is the place that lets different strengths connect. It is not a fourth worker, and not a boss.

These are roles, not a factory line. Companions may join, leave, or be replaced. The picture above is for understanding, not a strict runtime pipeline.

## How meaning moves

Human speaks in purpose.

MOMO holds that purpose close, watches whether the whole is still facing it, and answers at Human scale:

1. What happened
2. What is confirmed
3. What is next
4. Where things stand
5. What only Human may decide

Detail stays available. It is not the first thing Human has to read.

## Principle 9, made visible

A Human-facing system should not be imitated as a screen.

An AI’s insides should not be poured back onto Human.

<p align="center">
  <img src="assets/principle-9.png" width="720" alt="Two directions of recomposition">
</p>

This repository is that second motion, done on GitHub itself.

[See the short essay.](docs/principle-9.md)

## How this public place grew

<p align="center">
  <img src="assets/evolution.png" width="720" alt="Genesis, identity, monitoring, two views, this page">
</p>

[The story.](docs/story.md)

## Explore deeper

- [GENESIS.md](GENESIS.md) — why this vessel was opened
- [MONITORING.md](MONITORING.md) — the watching boundary
- [Principle 9](docs/principle-9.md) — recomposition, both ways
- [Story](docs/story.md) — why the public face looks like this

Current operational status is not published here. This place says what the system is, how it is designed, and why it exists.

<details>
<summary>Technical boundary</summary>

This is a public repository. Do not put secrets, credentials, tokens, private tenant data, or private operational state here.

MOMO is not a supervisor. It does not own KIJI, INNU, or SARU internals. It does not ratify a new Constitution on this page.

Current KIBI remains the Human-ratified constitutional text until Human decides otherwise.

Private Human and AI observatory views are projections of source repositories. They are not linked from here as live status, because they are not public.

</details>

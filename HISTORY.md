---
document_status: historical_record
scope: system_design_history
current_through_jst: "2026-09-09"
canonical_authority: false
---

# Project 桃多郎 — Design History

This document records **how the System design changed, why it changed, and what questions remained open at each transition**.

It is a historical record, not a Constitution and not a source of current authority. Current Human-approved meaning is governed by the appropriate Canonical semantic sources and their authorized projections, including [`PRINCIPLES.md`](PRINCIPLES.md), [`SOURCE_AND_VIEWS.md`](SOURCE_AND_VIEWS.md), and the relevant KIBI/Application sources.

The purpose of this file is different from [`GENESIS.md`](GENESIS.md):

- `GENESIS.md` preserves the MOMO repository's bootstrap moment on 2026-09-05.
- `HISTORY.md` preserves the broader lineage **before and after MOMO Genesis**, including discarded interpretations, temporary controls, experiments, and later recomposition.

History should not be rewritten to make the present design look inevitable.

---

## 0. Evidence classes

Because the project crossed ChatGPT accounts and several ideas existed in chat before they were durably recorded in Git, entries use three evidence classes.

| Class | Meaning |
|---|---|
| **Durable** | Supported by repository history, decision record, snapshot, or committed artifact. |
| **Human lineage** | Explicitly reported by Human from an earlier account or earlier working context whose complete transcript is not available here. |
| **Reconstructed** | Recovered from multiple current-account conversations and project records. Useful historical context, but not treated as Canonical authority. |

Exact dates before durable Git records may therefore be approximate.

---

# 1. Before the current account — TFO and OWATA prototypes

**Evidence: Human lineage**

The lineage begins before the present ChatGPT account.

Two prototype systems already existed:

- **TFO** — a system oriented toward observing, researching, interpreting and finding what matters in the World.
- **OWATA** — a system oriented toward building, completing, recovering and making implementation actually work.

Their earliest detailed conversations lived under a previous ChatGPT account. The account transition broke complete chat continuity, but the projects and their design questions continued into the current account.

At this stage the problem was still primarily expressed as **building strong individual AI systems** rather than defining a complete System of Systems.

What survived from this period was more important than the original names:

- one capability needed to understand the World;
- another needed to build reliably;
- Human should not have to manually execute every internal step.

---

# 2. 2026-09-01 to 2026-09-03 — From projects to Roles

**Evidence: Human lineage + reconstructed**

A major conceptual shift occurred when TFO, OWATA and the emerging Project W / Work IQ idea stopped being treated merely as three projects and started being treated as three fundamentally different transformations.

The framing converged toward:

```text
Create / 創る
Build  / 作る
Act    / 売る・活かす
```

and later toward the names:

```text
KIJI  = World → Opportunity
INNU  = Opportunity / Commission → Product
SARU  = Product → Human World State Change
```

This was the first important decomposition of responsibility.

The design question changed from:

> How do we make each AI more capable?

into:

> What responsibility should each autonomous system own, and what should it never need to own?

During this period Project W also moved away from being interpreted mainly as a Project Manager / completion supervisor. The `W` increasingly meant **World**, not merely Work.

The symbolic loop became:

```text
創る → 作る → 売る → 学ぶ
```

This is the lineage from which KIJI / INNU / SARU emerged.

---

# 3. 2026-09-02 to 2026-09-03 — Temporary Program Control and bounded autonomy

**Evidence: reconstructed from temporary / 「暫定」 control threads**

Several temporary Program Control arrangements were created while one project was paused and another continued long-running work.

These controls were operational rather than philosophical, but they introduced principles that later became System-wide:

- explicitly frozen scope;
- continuation only inside current authority;
- STOP outside the boundary;
- cost ceilings and pre-request enforcement;
- durable checkpoints and resume behavior;
- append-only / recoverable evidence where appropriate;
- fail-closed conflict handling;
- prevention of accidental double execution;
- distinction between completion of one Task and authority to begin another.

This period established a recurring pattern:

> **Autonomy is not absence of control. Autonomy is freedom inside an explicit boundary.**

The later concepts of bounded autonomy, recoverability, durable state and Safe to Ignore can be seen as more general descendants of these temporary controls.

---

# 4. 2026-09-03 — KIBI as a coordination / controller answer

**Evidence: reconstructed + later durable provenance**

Once KIJI / INNU / SARU were treated as autonomous Roles, a new problem appeared:

> If each system is independent, how do they cooperate without Human becoming the messenger between them?

KIBI grew as the answer.

Early KIBI carried a broad coordination responsibility and at times resembled a **Controller** or fourth Application. It collected questions around:

- Identity;
- Role;
- Authority;
- Result handoff;
- recovery;
- coordination;
- semantic compatibility.

This solved one problem but created another: KIBI began accumulating too much System-wide meaning and risked becoming a central Supervisor.

That tension became the trigger for the later MOMO / KIBI recomposition.

---

# 5. 2026-09-03 to 2026-09-05 — Implementation reveals architecture problems

**Evidence: reconstructed**

Running KIJI, INNU and SARU through Codex / Cursor exposed issues that were difficult to see in abstract design alone.

Recurring problems included:

- Identity vs Authentication vs Authority;
- negative states and unavailable states;
- stale or missing knowledge;
- Human-only decisions;
- Result boundaries;
- handoff semantics;
- retry and recovery;
- durable continuation across Actor / session changes;
- proving outcomes rather than merely claiming actions.

The project question expanded from:

> How do we build autonomous AI Applications?

into:

> **How do multiple autonomous AI Applications coexist, cooperate and recover without collapsing into one central Agent?**

This pressure is one reason later Principles emphasize responsibility ownership, explicit authority, negative states, evidence, recovery and semantic boundaries.

---

# 6. 2026-09-05 — MOMO Genesis and the great responsibility split

**Evidence: Durable**

MOMO was created on 2026-09-05 as a public receiving place for System-wide Purpose / Principles that had previously accumulated inside KIBI. [`GENESIS.md`](GENESIS.md) preserves that bootstrap moment.

The key design correction was:

```text
Human = final source of Purpose and constitutional authority
MOMO  = System-wide meaning / philosophy / Human-facing understanding
KIBI  = semantic connection Protocol
Applications = independent execution
```

Two boundaries became especially important:

> **MOMO ≠ Human.**

and:

> **MOMO watches the whole. It does not control the whole.**

KIBI was correspondingly reduced from a broad controller concept toward:

> a Protocol that allows independent autonomous Applications to connect and cooperate safely and semantically without surrendering their independence.

The working snapshot from this transition is preserved in [`SYSTEM_SNAPSHOT_2026-09-05.md`](SYSTEM_SNAPSHOT_2026-09-05.md).

---

# 7. 2026-09-05 to 2026-09-06 — Principles, semantic source, and one truth / multiple views

**Evidence: Durable**

Human ratified the KIBI → MOMO responsibility recomposition and directed the smallest coherent Principle update. The durable decision is recorded in [`HUMAN_RATIFICATION_2026-09-05.md`](HUMAN_RATIFICATION_2026-09-05.md).

Important System-wide principles consolidated here included:

- Human sovereignty and bounded autonomy;
- independent responsibility and graceful evolution;
- reusable capability without responsibility transfer;
- continuous learning;
- semantic integrity;
- AI-native system recomposition;
- durable and Safe-to-Ignore operation.

Several phrases became durable anchors:

> **Role owns responsibility. Capability may be shared.**

> **Share capability and learning, not internals.**

> **Act → Observe → Learn → Improve → Act**

> **one semantic truth → multiple views**

MOMO-Observatory became the Actor-readable semantic source, while public MOMO became an authorized Human-facing projection.

This avoided creating two competing truths and reinforced the idea that **observation does not confer ownership**.

---

# 8. 2026-09-05 to 2026-09-06 — FROG / KAERU: architecture meets reality

**Evidence: reconstructed + project records**

As the architecture became more coherent, a counter-pressure emerged:

> Design must not become a substitute for reality.

FROG / KAERU was introduced as a **Reality Mentor / external experiment field**, not as a Supervisor, PM, Controller or execution owner.

Its stance became:

> **Make it real enough to learn.**

with the symbolic action:

> **Leap. — 飛び越える。**

The practical learning loop emphasized action before over-planning:

```text
Act → Observe → Learn → Improve → Act
```

FROG experiments then proved increasingly real transport paths such as GitHub-triggered work, machine execution, durable commits and RETURN artifacts.

This changed the project from architecture-only thinking toward a candidate self-driving system.

---

# 9. 2026-09-06 — Success becomes a real-world economic question

**Evidence: Human direction + reconstructed**

A further change occurred in the definition of success.

"The system runs autonomously" was no longer enough.

A stronger test emerged:

> **The system should first be able to earn its own operating cost.**

The longer-term image became a system that can:

```text
observe new information
→ derive useful knowledge
→ expand it across adjacent problems
→ build automatically
→ apply to the real world
→ observe outcomes
→ learn and improve
```

The implied sustainability condition is not merely technical uptime. It is that the value created in the World can eventually justify or exceed the model / execution resources consumed.

This moved Project 桃多郎 from an Agent architecture question toward a **self-sustaining World-facing system** question.

---

# 10. 2026-09-07 — Applications rediscover their meanings

**Evidence: reconstructed from Application work**

Intensive Application work clarified the Roles again through implementation rather than naming alone.

### KIJI

KIJI increasingly centered on **seeing / interpreting the World and turning it into useful Opportunity / insight**. Immediate Insight and World Experience work explored how prior evidence, failure lessons, uncertainty and provenance could affect future interpretation.

### INNU

INNU increasingly centered on **reliable Build**: model / method selection, durable state, recovery, review, safety, fault handling and completing what has been commissioned.

### SARU

SARU moved away from Project Management and toward **Human World Activation**: applying an Accepted Product / Capability to the World under Policy and observing actual Human World State Change.

### FROG

FROG remained the place where reality could be created quickly enough to learn without turning experimentation into System-wide authority.

The separation became less about mascots and more about **different transformation strengths**.

---

# 11. 2026-09-07 to 2026-09-08 — GiGi / BaBa and the question of growth

**Evidence: Human direction + reconstructed**

A new question appeared:

> The three Roles explain how the System works. But how does the System become better, broader or deeper over time?

GiGi / BaBa were explored as possible growth directions rather than ordinary work Roles.

A useful temporary interpretation was:

- **MOMO** — head / whole-System meaning;
- **KIJI / INNU / SARU** — ways of working;
- **KIBI** — nervous system / connection;
- **FROG** — external experiment field;
- **GiGi / BaBa** — ways the System might grow.

The growth distinction was explored approximately as:

- **vertical depth** — becoming something / becoming exceptionally capable in a domain;
- **horizontal breadth** — becoming able to become many different things across domains.

This led to the paired purpose questions:

> **何者かになる。**

and

> **何者にでもなれる。**

GiGi / BaBa were therefore experiments in understanding growth, not yet proven permanent components.

---

# 12. 2026-09-08 to 2026-09-09 — Maybe GiGi / BaBa are not permanent Roles

**Evidence: Human direction + reconstructed**

By testing the growth idea against the existing architecture, a new possibility emerged:

> Perhaps the existing System can already produce both depth and breadth without creating permanent GiGi / BaBa Applications.

If KIJI can discover what is needed, INNU can build the required capability, SARU can activate it in the World, FROG can create fast reality, and KIBI can preserve loose semantic connection, then "becoming something" may be an **emergent property of the System**, not a missing Role.

This remains an open design question rather than a final decision.

The lesson is important: **not every useful concept needs to become a permanent Application.**

---

# 13. 2026-09-08 to 2026-09-09 — Safe Autonomous Lanes and Lab evolution

**Evidence: reconstructed from Codex execution + Git practice**

As the number of active Applications and experiments increased, model usage limits became a practical bottleneck.

A new operating pattern emerged:

- preserve the production / original canonical system elsewhere;
- create an isolated Lab;
- allow Codex to work autonomously until the usage boundary is reached;
- commit in small durable units;
- make the next session resumable;
- prevent unsafe Production mutation;
- later review and selectively promote useful results.

For INNU and KIJI, dedicated GitHub repositories became suitable **Lab remotes**, while their production / original canonical sources remained elsewhere.

This reframed Git not just as source storage but as **durable memory across limited AI work sessions**.

The operating question became less:

> How do we make one long AI session finish everything?

and more:

> How do we make many bounded AI sessions compose into continuous autonomous progress?

---

# 14. 2026-09-09 — KIBI becomes explicitly public Protocol material

**Evidence: current repository work**

KIBI's public repository role was clarified again: KIBI should not be a monorepo containing KIJI / INNU / SARU source code.

Its public-safe value is the opposite:

- Role boundaries;
- semantic Result Contracts;
- connection invariants;
- compatibility / authority / governance meaning;
- implementation-independent protocol concepts.

Application internals may remain private, replaceable and independently evolved.

The architecture therefore reinforces:

> **Implementation is replaceable; Role Contract is stable.**

and the coupling test:

> If one Role must understand another Role's internals to continue, the design is probably too tightly coupled.

---

# 15. Current design question — do not run before discovering the parameters

**Evidence: Human direction, 2026-09-09**

After several weeks of rapid design and implementation, the next step initially looked like an end-to-end real-world experiment.

Human challenged that sequencing:

> **必要なパラメータもわからないのに動かすのはおかしい。**

This produces the current pre-experiment question:

> **Can the System, when given a Human Purpose, discover what parameters it needs in order to act responsibly and effectively?**

Before a full real-world loop, the System should be able to distinguish at least:

```text
Known
Derivable
Need research
Need Human decision
Need authority
Need experiment
Unknown / currently unknowable
```

The important test is not whether Human can manually specify every parameter.

The stronger test is whether the System can determine:

- what it needs to know;
- what it can derive itself;
- what KIJI must research;
- what INNU needs as Commission / constraints;
- what SARU needs as Authority / Capital / Trust boundary;
- what KIBI must preserve in the Result boundary;
- what genuinely requires Human judgment.

This is currently best understood as a **Parameter Discovery / Preflight phase**, before blind activation and before a full end-to-end proof.

---

# 16. The recurring pattern across the entire history

Looking backward, several design changes that seemed separate were repeatedly answering the same problem.

## 16.1 From supervision to bounded autonomy

Early temporary Program Control said:

```text
continue inside the frozen boundary
STOP outside it
```

Later System Principles said:

```text
Human sets Purpose / Policy / Authority
Applications act autonomously inside current authority
boundary exceptions return to Human
```

The abstraction changed. The pattern remained.

## 16.2 From shared internals to semantic Results

Early coordination pressure pushed toward Controller-style designs.

Later architecture moved toward:

> **Share results, not internals.**

and then:

> **Share capability and learning, not internals.**

The System became more composable by exposing meaning rather than execution machinery.

## 16.3 From architecture to reality

Repeated over-design pressure produced FROG's correction:

> **Make it real enough to learn.**

But reality alone is not enough either. The current Parameter Discovery question adds the complementary correction:

> **Do not act merely because action is possible; first discover the parameters required for meaningful, authorized action.**

## 16.4 From fixed identity to adaptive capability

The project began with specific systems.

It evolved toward stable Roles with replaceable implementations.

It is now asking whether even growth identities such as GiGi / BaBa need to be permanent, or whether the System can dynamically acquire depth and breadth through its existing learning / building / activation loop.

---

# 17. Current position as of 2026-09-09

The System has moved rapidly from individual AI projects toward a loosely coupled autonomous ecosystem.

The present working picture is approximately:

```text
Human
  ↓ Purpose / constitutional authority
MOMO
  ↓ System-wide meaning / observation / Human-facing convergence
KIBI
  ↕ semantic connection / Result boundaries
KIJI  — Create / see the World / Opportunity
INNU  — Build / turn Commission into working Product
SARU  — Act / turn Product into Human World State Change
FROG  — create enough external reality to learn
```

GiGi / BaBa remain useful growth concepts, but their necessity as permanent Roles is unresolved.

The next important proof is **not simply more architecture and not yet blind real-world execution**.

It is whether the System can move from a high-level Human Purpose to a sufficiently complete set of required parameters, evidence, authority and experiment conditions with low Human relay.

If that succeeds, the following phase can be an actual end-to-end loop:

```text
Purpose
→ Parameter Discovery
→ KIJI Opportunity
→ INNU Accepted Product
→ SARU World Action
→ World Outcome
→ KIJI learning
```

At that point the project will have moved from designing an autonomous ecosystem toward demonstrating that the ecosystem can determine what it needs, act within authority, change reality and learn from the result.

---

# 18. Historical rule

Future updates to this file should preserve three things:

1. **What was believed at the time.**
2. **What evidence or reality caused the belief to change.**
3. **What replaced it.**

Do not erase dead ends such as Controller interpretations, Project Manager interpretations, provisional growth Roles, or temporary controls merely because a later design is cleaner.

Those discarded designs are part of the evidence for why the current architecture exists.

> **History is not the current truth. It is the provenance of how the current truth was reached.**

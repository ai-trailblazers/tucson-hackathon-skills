---
name: hypothesis-to-experiment
description: Use at the start of a hackathon or new project to turn a raw idea into a riskiest-assumption tree and 3 parallel, time-boxed experiments with explicit kill criteria. Triggers on "we have an idea for...", "what should we test first", "validate this idea", or "design an experiment".
---

# Hypothesis to Experiment

Turn a vague idea into experiments a team can run before lunch. The goal is **maximum learning per hour**, not building.

## When to use this

Friday night or Saturday morning, when the team has an idea but hasn't tested anything. Use it again any time someone says "let's just build it" — that usually means an untested assumption is hiding.

## Process

### 1. Capture the idea as a hypothesis
Rewrite the idea in this exact shape and save it to `experiments.md`:

> We believe **[target customer]** has problem **[problem]**, and will **[observable action — pay / sign up / book a call]** for **[solution]**.

A hypothesis you can't observe being true or false is not a hypothesis. Force an action verb.

### 2. List the riskiest assumptions
Break the hypothesis into the beliefs it depends on. For each, ask: *"If this is false, is the whole idea dead?"* Keep only the ones where the answer is yes. Typical categories:
- **Problem** — does the customer actually feel this pain?
- **Customer** — can we even reach 10 of them this weekend?
- **Willingness to pay** — will money or a credible commitment change hands?
- **Solution** — does our specific approach solve it?

Rank them. The riskiest assumption is the one that is *both* most likely to be wrong *and* cheapest to test.

### 3. Design 3 parallel experiments
Pick the top 3 assumptions. For each, write an experiment card:

```
## Experiment N: [name]
Assumption tested: [...]
Method: [interview / fake-door landing page / concierge / pre-sale]
Time box: [≤ 4 hours]
Owner: [human + which AI teammate]
Success signal: [specific, countable — e.g. "≥3 of 10 click Buy"]
Kill criteria: [what result means stop — e.g. "0 of 10 reply to outreach"]
```

Rules:
- **Time box every experiment to 4 hours or less.** A weekend has ~3 of these blocks.
- Prefer experiments that produce a **customer conversation or a payment attempt** — those are judging metrics.
- No experiment may require building a real product. Fake-door pages, interviews, and pre-sales are enough.

### 4. Set a checkpoint
Write a line at the bottom of `experiments.md`: "Review all 3 at [time]." Pair this with the `pivot-or-persist` skill at that checkpoint.

## Handoff

- Experiments that need a landing page → `landing-in-an-hour`
- Experiments that need a payment attempt → `pay-me-now`
- Experiments that need customer calls → `discovery-interview-prep`

## Output

A single `experiments.md` file with the hypothesis, ranked assumptions, 3 experiment cards, and a checkpoint time. Nothing else — keep it to one page.

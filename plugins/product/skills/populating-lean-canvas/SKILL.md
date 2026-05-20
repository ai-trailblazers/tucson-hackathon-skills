---
name: populating-lean-canvas
description: Build or refine a one-page Lean Canvas (Ash Maurya format) for the team's business idea. Captures customer segments, problem, unique value proposition, solution, channels, revenue, cost, key metrics, unfair advantage. Use early in the hackathon to align the team on what you're building and for whom — "set up our lean canvas", "fill in the canvas", "what's our UVP". Drives hypothesis-to-experiment downstream (the canvas is what experiments test).
---

# populating-lean-canvas

Hackathon fork of the BB product management skill. Writes to `lean-canvas.md` in the team's repo.

## When this runs

- First or second hour of Day 1, before any experiment is designed
- Any time the team is stuck on what to build → re-canvas
- Before invoking `hypothesis-to-experiment` (the canvas IS what experiments test)

## The 9 boxes (fill in this order)

1. **Customer Segments** — who specifically. "SMB owners" is too broad. "Tucson restaurant owners with 2-10 employees" is workable. Early-adopter sub-segment listed separately.
2. **Problem** — top 1-3 problems for this segment. Existing alternatives in 1 line each.
3. **Unique Value Proposition (UVP)** — one sentence. Why this is different and worth paying for.
4. **Solution** — top 3 features. NOT a feature list — the riskiest 3.
5. **Channels** — how customers find you. Hackathon: prefer channels you can run in 48h (Tucson local communities, LinkedIn DMs, in-person at IDA, etc.)
6. **Revenue Streams** — how you make money. Specific: "$49/mo subscription" beats "freemium."
7. **Cost Structure** — what running this costs.
8. **Key Metrics** — the 1-3 numbers you'd watch in week 1 to know it's working.
9. **Unfair Advantage** — what you have that's hard to copy. (Honest answer: usually "nothing yet" on day 1. Write that — it's a real LOFA.)

## Output

`lean-canvas.md` in repo root:

```markdown
# Lean Canvas — <project name>
_Updated: <date>_

## 1. Customer Segments
- Primary: 
- Early adopters: 

## 2. Problem
- Top problems: 
- Existing alternatives: 

## 3. Unique Value Proposition
- 

## 4. Solution
- 

## 5. Channels
- 

## 6. Revenue Streams
- 

## 7. Cost Structure
- 

## 8. Key Metrics
- 

## 9. Unfair Advantage
- 

---

## Open assumptions
List the boxes you filled with guesses (not evidence). These become candidate LOFAs for `hypothesis-to-experiment`.
```

## Rules

- Don't fill boxes with what sounds good — fill with what you'd defend to a judge.
- Mark every box as evidence-backed or guess. Guesses go straight to the assumptions list.
- Re-canvas at the end of Day 1 and the start of Day 2. The canvas is a working document, not an artifact.

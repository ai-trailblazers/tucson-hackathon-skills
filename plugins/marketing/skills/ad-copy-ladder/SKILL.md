---
name: ad-copy-ladder
description: Generate 6-12 ad copy variants for one product across the awareness ladder (problem-aware → solution-aware → product-aware → most-aware). Each variant is paired with the right hook for that buyer stage. Use when running paid ads or organic posts and need volume of distinct angles to test. Triggers: "write ad copy", "generate ad variants", "what should the headline say", "I need 10 ad ideas". Pairs upstream with positioning-statement.
---

# ad-copy-ladder

Hackathon-original. Writes to `ads/<campaign-slug>.md`.

## The awareness ladder (Eugene Schwartz)

1. **Unaware** — doesn't know they have the problem. Lead with story/insight.
2. **Problem-aware** — knows the pain, doesn't know solutions exist. Lead with the pain itself.
3. **Solution-aware** — knows solutions exist, comparing. Lead with comparison/differentiator.
4. **Product-aware** — knows your product, undecided. Lead with proof/objection-handling.
5. **Most-aware** — ready to buy. Lead with the offer/urgency.

## Output

`ads/<slug>.md`:

```markdown
# Ad Copy Ladder — <product name>

## Stage 2: Problem-aware (most useful in hackathon)
### Variant A
- Hook: <pain-led headline>
- Body: <2 lines>
- CTA: <button>

### Variant B
- Hook: <different angle on the same pain>
- ...

## Stage 3: Solution-aware
### Variant A
- Hook: <"Unlike [alternative], we…">
- ...

## Stage 4: Product-aware
### Variant A
- Hook: <objection-handling — "Will it work for [specific case]?">
- ...

## Testing plan
- Run Variants A/B at each stage in parallel
- Kill the bottom 50% after 100 impressions
- Promote the winner; iterate
```

## Rules

- One stage at a time when testing. Comparing Stage 2 vs Stage 4 conflates audience and copy.
- Hook does 80% of the work. If the hook fails, the body doesn't get read.
- Specifics beat superlatives. "Save 4 hours a week" > "Save lots of time."
- Never use both "AI-powered" AND "revolutionary" in the same headline. Or either, ideally.

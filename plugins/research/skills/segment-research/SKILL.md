---
name: segment-research
description: 30-minute desk research on a candidate customer segment to validate it's worth pursuing. Pulls existing market data, competitor landscape, pricing benchmarks, and 3-5 testable assumptions about the segment. Use when the team is considering a segment but doesn't know enough yet. Triggers: "research [segment]", "who is [target market]", "is [segment] a real market", "what do we know about [niche]". Pairs upstream with positioning-statement, downstream with customer-finder.
---

# segment-research

Hackathon fork of `researching-customer-segments`. Writes to `segments/<segment-slug>.md`.

## Inputs

- Candidate segment name + one-line description
- Team's hypothesis: why this segment will pay for the product

## 30-minute research outline

| Time | Question | Sources |
|------|----------|---------|
| 0-5m | How big is this segment? | Statista, IBISWorld, industry orgs, common-sense BOTE |
| 5-10m | Who serves them today? | Google search "[segment] software/service/tool", G2, Capterra |
| 10-15m | What do those competitors charge? | Pricing pages, Reddit complaints, "best [tool] for [segment]" lists |
| 15-25m | What do customers complain about? | Reddit, G2 1-3 star reviews, Twitter, niche forums |
| 25-30m | Where do they hang out? | Subreddits, slack groups, Discord, local meetups, industry events |

## Output

`segments/<slug>.md`:

```markdown
# Segment: <name>
**Hypothesis:** <why we think they'll pay>

## Size (rough)
- Total addressable count: ~<number> in <geo>
- Source: <where>
- Confidence: low | medium | high

## Existing alternatives
| Tool | What it does | Price | Top complaint |
|------|--------------|-------|---------------|
| ... | ... | ... | ... |

## Pricing benchmark
- Median spend for tools in this space: $<X>/mo
- Anchor we should test: $<X>

## Top 3 complaints in reviews
1. <verbatim quote + source link>
2. ...

## Where they hang out
- <subreddit, Slack, meetup, geo>

## 3-5 testable assumptions
1. <"They will pay $X for Y" — must be falsifiable>
2. ...

## Verdict
- [ ] Worth pursuing — assumption set is bold but plausible
- [ ] Park it — too small, too crowded, or too vague to test in 48h
- [ ] Pivot to adjacent: <which>
```

## Rules

- 30 minutes max. Hackathon constraint. If you can't decide after 30 min of research, run an experiment instead.
- Real quotes > paraphrased "users want." Copy the words.
- "Park it" is a real answer. Saying no to a segment is the whole point.

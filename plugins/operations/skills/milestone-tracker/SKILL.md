---
name: milestone-tracker
description: Initialize and maintain milestones.md for the team — a single file tracking the 6 leaderboard milestones (page-live, experiment, customer-conversation, signup, payment, skill-published) with status, time, and proof links. Use Day 1 morning to bootstrap, then any time the team hits a new milestone. Triggers: "track our milestones", "what have we hit so far", "log milestone", "show our progress". Pairs with log-milestone (in telemetry plugin) — milestones.md is the local mirror of the central leaderboard.
---

# milestone-tracker

Hackathon-original. Writes `milestones.md` in the team's repo. Mirrors the central leaderboard locally.

## When to use

- Day 1 morning: bootstrap the file
- Any milestone hit: append a row + call `log-milestone` (telemetry plugin)
- Mid-checkpoint: glance at the file to see what's still open

## Output

`milestones.md`:

```markdown
# Milestones — <team name>
**Started:** <iso>
**Project:** <name>

| # | Milestone | Status | When | Evidence | Logged to leaderboard |
|---|-----------|--------|------|----------|----------------------|
| 1 | page-live | ✅ | 2026-05-23 14:22 | https://… | ✅ event E-007 |
| 2 | experiment (first) | ✅ | 2026-05-23 18:00 | experiments.md#exp-1 | ✅ |
| 3 | customer-conversation (first) | ⬜ | — | — | — |
| 4 | signup (first) | ⬜ | — | — | — |
| 5 | payment (first) | ⬜ | — | — | — |
| 6 | skill-published (first) | ⬜ | — | — | — |

## Stretch milestones
| # | Type | Count toward leaderboard | Notes |
|---|------|--------------------------|-------|
| - | 2nd customer-conversation | yes | |
| - | 2nd experiment | yes | |
| - | 1st verified payment | yes — biggest weight | |
```

## Rules

- Update the file BEFORE calling `log-milestone`. The file is canonical to the team; the leaderboard is canonical to the event.
- If a milestone is contested (coach rejects verification), mark it ⚠️ with the reason and decide: re-log with better evidence, or accept and move on.
- Don't over-celebrate. The point is the next milestone, not the last one.

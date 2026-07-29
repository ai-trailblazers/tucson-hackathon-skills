---
name: milestone-tracker
description: Initialize and maintain milestones.md for the team — a single file tracking your event's leaderboard milestones with status, time, and proof links. Categories come from the event config, not a fixed list. Use Day 1 morning to bootstrap, then any time the team hits a new milestone. Triggers: "track our milestones", "what have we hit so far", "log milestone", "show our progress". Pairs with log-milestone (in telemetry plugin) — milestones.md is the local mirror of the central leaderboard.
---

# milestone-tracker

Hackathon-original. Writes `milestones.md` in the team's repo. Mirrors the central leaderboard locally.

## When to use

- Day 1 morning: bootstrap the file
- Any milestone hit: append a row + call `log-milestone` (telemetry plugin)
- Mid-checkpoint: glance at the file to see what's still open

## Output

**Read the event's categories first.** They differ per hackathon — get them from
`~/.hackathon/team.json` (written by `/hackathon-setup`) or:

```bash
curl -sS "$HACKATHON_API/config" -H "Authorization: Bearer $HACKATHON_API_KEY" | jq -r '.categories[] | "\(.id) — \(.description)"'
```

Build one row per category. Never write a category the event doesn't define.

`milestones.md`:

```markdown
# Milestones — <team name>
**Event:** <event_name from team.json>
**Started:** <iso>
**Project:** <name>

| # | Milestone | Status | When | Evidence | Logged to leaderboard |
|---|-----------|--------|------|----------|----------------------|
| 1 | <category 1 id> (first) | ✅ | 2026-08-01 14:22 | https://… | ✅ event rec… |
| 2 | <category 2 id> (first) | ⬜ | — | — | — |
| … | one row per category from /config | ⬜ | — | — | — |
```

## Stretch milestones
| # | Type | Count toward leaderboard | Notes |
|---|------|--------------------------|-------|
| - | 2nd of any category | yes | every verified milestone counts |
| - | 3rd of any category | yes | |
```

Repeat milestones count. Unless your event says otherwise, each verified
milestone is worth the same — check `/config` rather than assuming a weighting.

## Rules

- Update the file BEFORE calling `log-milestone`. The file is canonical to the team; the leaderboard is canonical to the event.
- If a milestone is contested (coach rejects verification), mark it ⚠️ with the reason and decide: re-log with better evidence, or accept and move on.
- Don't over-celebrate. The point is the next milestone, not the last one.

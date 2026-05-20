---
name: daily-standup
description: Run a 5-minute hackathon standup — what we shipped, what's blocked, what we're picking up next. Writes to standups.md in append mode. Use 8am Day 2 and any time the team feels lost. Triggers: "run standup", "morning sync", "where are we", "what's next". Do NOT use as a retro — that's for end of day (use run-retro if available, or freeform writeup).
---

# daily-standup

Hackathon-original. Writes to `standups.md`.

## Format (5 min max)

Each teammate, 60 seconds:
1. **Shipped since last standup:** one thing, name it.
2. **Blocker:** what's in the way right now. "Nothing" is a valid answer.
3. **Next 4 hours:** the ONE thing they'll work on next.

Then 1 minute of decisions:
- Anything to deprioritize?
- Anything to escalate to a coach?
- Are we still on the same plan from yesterday?

## Output

Append to `standups.md`:

```markdown
## Standup — <YYYY-MM-DD HH:MM>

### <Teammate 1>
- Shipped: 
- Blocker: 
- Next: 

### <Teammate 2>
- Shipped: 
- Blocker: 
- Next: 

### Team decisions
- 
- 
```

## Rules

- Hard 5-minute cap. Use a timer.
- "Status updates" without a blocker or next-step are noise. Push back.
- If 2+ teammates say the same blocker, escalate — that's the real bottleneck.
- One teammate should DM a coach if any blocker was named that the team can't unblock themselves in 30 min.

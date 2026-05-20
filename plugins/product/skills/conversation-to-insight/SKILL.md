---
name: conversation-to-insight
description: Turn a customer conversation transcript or debrief into 1-5 short, durable insights about the segment. Each insight is one line written to insights.md, structured so the team and judges can scan the team's accumulated learning. Use after any customer call, problem interview, or rapid-experiment debrief — "extract insights from [transcript]", "what did we learn", "log insights from today's calls". Do NOT use for raw notes (those go in conversations.md) or for sales-deal notes.
---

# conversation-to-insight

Hackathon fork of `capturing-customer-insights`. Writes to local `insights.md`, not Google Drive.

## Output format

One file: `insights.md` in the team's repo root. Append-only. Each insight is:

```markdown
## <YYYY-MM-DD> — <short hook (≤70 chars)>
- Segment: <slug — who this is about>
- Evidence: <which conversation/experiment — link or filename>
- Insight: <1-2 sentences — what we now know that we didn't yesterday>
- Pain score (1-10): 
- WTP signal: <willingness to pay — quote or behavior, if any>
- Decision impact: <which assumption this confirms/weakens/kills>
```

## Workflow

1. **Read the source.** Could be a transcript file, `conversations.md` entry, experiment results in `experiments.md`, desk research notes.

2. **Draft 3-7 candidate insights.** Each must clear two bars:
   - Specific enough to be falsifiable (not "customers like saving time")
   - Distinct from existing entries in `insights.md` (grep first)

3. **Present one at a time** to the team via AskUserQuestion: approve / edit / skip. Never auto-write. False insights pollute the team's mental model for the rest of the hackathon.

4. **Write approved insights** to `insights.md`. Each insight write triggers the hook → `/confirm-milestone` offers to log as either a `customer-conversation` follow-up or just an internal artifact.

## What makes a good insight

- Past-tense behavior, not future intent. "Three of five interviewees already pay a VA to do this" beats "interviewees said they'd consider paying."
- Specific number or quote. "$200/month is the budget anchor" beats "price-sensitive."
- Surprising. If the team already believed it, it's not an insight, it's confirmation bias.

## Segment slugs

Keep tight, kebab-case. Examples: `tucson-restaurant-owners`, `solo-bookkeepers`, `dev-shops-1-to-10`. New segment? Confirm with the team before introducing — too many segments dilutes learning.

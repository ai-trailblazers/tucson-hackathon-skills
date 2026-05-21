---
name: log-milestone
description: Self-report a hackathon milestone (customer conversation, experiment shipped, signup, payment, page live, skill published). Logged with source=self_reported and flagged for coach verification. Use when the team just hit a milestone and wants credit on the leaderboard — including "we just talked to a customer", "we shipped X", "first signup", "first paying customer", "page is live", "published a skill to the repo".
---

# log-milestone

Self-report a milestone. Logged immediately, flagged for coach verification.

## When this runs

- Team typed `/log-milestone` directly
- Team said something like "log a customer conversation" or "we just got our first payment"
- Confirm-milestone (detector) escalated an ambiguous event for explicit self-report

## What you do

1. **Read `~/.hackathon/team.json`.** If missing, trigger `hackathon-setup` first.

2. **Pick the milestone type** via AskUserQuestion if not already specified:
   - `page-live` — landing/marketing page is reachable on the public internet
   - `experiment` — a real test was run with real users (not internal review)
   - `customer-conversation` — talked to one real prospective customer
   - `signup` — first / additional signup on the page
   - `payment` — someone actually paid (deposit, pilot, first dollar)
   - `skill-published` — opened a PR to the shared skills repo
   - `ngrok-bonus` — used ngrok meaningfully (exposed a service, routed an LLM call through the AI Gateway, OR exposed an MCP server). Capped at 3 per team on the leaderboard.

3. **Collect evidence in one short prompt:**
   - Notes (1-2 sentences: who, what happened, what you learned)
   - Evidence URL (optional but boosts coach verification speed — Stripe receipt, deployed URL, PR link, transcript link)

4. **POST to /event:**
   ```bash
   curl -sS -X POST "$HACKATHON_API/event" \
     -H "Authorization: Bearer $HACKATHON_API_KEY" \
     -H "Content-Type: application/json" \
     -d "{
       \"team_id\": \"$(jq -r .team_id ~/.hackathon/team.json)\",
       \"event_type\": \"customer-conversation\",
       \"source\": \"self_reported\",
       \"notes\": \"...\",
       \"evidence_url\": \"...\"
     }"
   ```

5. **Confirm to the team:**
   ```
   Logged. Event ID: E-042. Source: self_reported. Awaiting coach verification.
   Leaderboard: https://aitrailblazers.org/hackathon-3/leaderboard
   ```

## Rules

- Never log on behalf of another team.
- Never auto-promote `self_reported` to `coach_logged` — only coaches do that via `verify-milestone`.
- If the team logs >3 of the same milestone type in <10 min, gently nudge: "You've logged 4 customer conversations in 8 min — make sure each is a separate real conversation."

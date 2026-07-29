---
name: log-milestone
description: Self-report a hackathon milestone (experiment run, stakeholder conversation, commitment secured, asset shipped, outreach launched, teammate hygiene). Logged with source=self_reported and flagged for mentor verification. Use when the team just hit a milestone and wants credit on the leaderboard — including "we just talked to a stakeholder", "we shipped X", "they committed", "our page is live", "log a milestone".
---

# log-milestone

Self-report a milestone. Logged immediately, flagged for mentor verification.

## When this runs

- Team typed `/log-milestone` directly
- Team said something like "log a stakeholder conversation" or "we just got a commitment"
- Confirm-milestone (detector) escalated an ambiguous signal for explicit self-report

## What you do

1. **Read `~/.hackathon/team.json`.** If missing, trigger `hackathon-setup` first.

2. **Pick the milestone type from *this event's* categories.** Never hard-code a
   list. Read `categories` from `~/.hackathon/team.json`; if absent or stale, fetch
   them:

   ```bash
   curl -sS "$HACKATHON_API/config" -H "Authorization: Bearer $HACKATHON_API_KEY" | jq '.categories'
   ```

   Each category has an `id` (what you send), a `label` (how the board phrases it),
   and a `description` (what actually counts). Offer them via AskUserQuestion using
   the label and description, and send the `id`.

   Different hackathons define different categories — a business-launch event and a
   nonprofit mission event do not score the same things. The server is the authority
   on which ones your event accepts.

3. **Collect evidence in one short prompt:**
   - Notes (1-2 sentences: who, what happened, what you learned)
   - Evidence URL (optional but speeds mentor verification — a deployed URL, a PR
     link, a transcript, a written commitment)

4. **POST to /event:**
   ```bash
   curl -sS -X POST "$HACKATHON_API/event" \
     -H "Authorization: Bearer $HACKATHON_API_KEY" \
     -H "Content-Type: application/json" \
     -d "{
       \"team_id\": \"$(jq -r .team_id ~/.hackathon/team.json)\",
       \"event_type\": \"<category id>\",
       \"source\": \"self_reported\",
       \"notes\": \"...\",
       \"evidence_url\": \"...\"
     }"
   ```

   If the server replies `unknown event_type "..." for <event>. Allowed: ...`, you
   sent a category this event does not use. Re-read `/config` and ask again with the
   real list — do not retry the same value.

5. **Confirm to the team**, using the board URL from `team.json`:
   ```
   Logged. Event ID: rec... Source: self_reported. Awaiting mentor verification.
   Leaderboard: <board_url from team.json>
   ```

## Rules

- Never log on behalf of another team.
- Never auto-promote `self_reported` to `coach_logged` — only mentors do that via `verify-milestone`.
- If the team logs >3 of the same milestone type in <10 min, gently nudge: "You've logged 4 stakeholder conversations in 8 min — make sure each is a separate real conversation."
- Categories come from the server, not from memory. If you find yourself typing a
  category name that isn't in `/config`, stop.

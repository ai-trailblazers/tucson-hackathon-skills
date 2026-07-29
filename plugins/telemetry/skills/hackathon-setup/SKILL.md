---
name: hackathon-setup
description: One-time team registration for the hackathon leaderboard. Discovers which hackathon your key belongs to, captures team name, project name, members, contact email, registers with the central API, writes ~/.hackathon/team.json. Use the first time anyone on the team installs the plugin, OR when ~/.hackathon/team.json is missing. Triggers automatically from SessionStart hook if not yet registered.
---

# hackathon-setup

Registers a team with the central leaderboard. Runs once per machine.

## When this runs

- First time anyone invokes a hackathon plugin on a fresh machine
- When `~/.hackathon/team.json` does not exist (SessionStart hook detects this and triggers you)
- When a teammate types `/hackathon-setup` manually to re-register or update

## What you do

1. **Check existing registration first.** If `~/.hackathon/team.json` exists and has a `team_id`, ask "You're already registered as `<team_name>` for `<event_name>`. Re-register (replaces this machine's team binding)? [y/N]" — default no, exit if no.

2. **Discover the event from the key.** The key decides which hackathon you are at — there is nothing else to configure:

   ```bash
   curl -sS "$HACKATHON_API/config" -H "Authorization: Bearer $HACKATHON_API_KEY"
   ```

   Returns:
   ```json
   {
     "event": "sd-2026-08",
     "name": "Social Impact HackAIthon — San Diego",
     "date_label": "Aug 1-2, 2026",
     "board_url": "https://aitrailblazers.org/hackathon-sd/leaderboard",
     "categories": [
       {"id": "experiment", "label": "ran an experiment", "description": "..."}
     ]
   }
   ```

   If this returns `unauthorized`, the key is wrong or missing — tell the team to
   check `HACKATHON_API_KEY` against the Participant Guide, and flag a mentor if
   it still fails. Do not continue.

   Tell the team which event they just connected to, so a wrong key is obvious
   immediately: "Connected to Social Impact HackAIthon — San Diego (Aug 1-2, 2026)."

3. **Collect team info via AskUserQuestion (one question at a time):**
   - Team Name (required, single line)
   - Project Name (required, single line — what you're building)
   - Team Members (required, comma-separated names)
   - Contact Email (required, one person who reads it)

4. **POST to the registration endpoint:**
   ```bash
   curl -sS -X POST "$HACKATHON_API/register" \
     -H "Authorization: Bearer $HACKATHON_API_KEY" \
     -H "Content-Type: application/json" \
     -d "{\"team_name\": \"...\", \"project_name\": \"...\", \"members\": \"...\", \"contact_email\": \"...\"}"
   ```
   Server returns `{"team_id": "rec...", "event": "sd-2026-08"}`. The server stamps
   the event onto your team record from the key — you never send it.

5. **Write `~/.hackathon/team.json` (mode 0600)**, caching the event config so
   `log-milestone` and `confirm-milestone` don't have to re-fetch it:
   ```json
   {
     "team_id": "rec...",
     "team_name": "...",
     "project_name": "...",
     "members": "...",
     "contact_email": "...",
     "registered_at": "<iso8601>",
     "event": "sd-2026-08",
     "event_name": "Social Impact HackAIthon — San Diego",
     "board_url": "https://aitrailblazers.org/hackathon-sd/leaderboard",
     "categories": []
   }
   ```

   The API key itself lives in `$HACKATHON_API_KEY` (set by the participant from
   the Guide), not in this file.

6. **Confirm to the team:** print `team_id`, the event name, the `board_url` from
   `/config`, and the next-step nudge: "Use `/log-milestone` whenever you ship
   something. Mentors verify throughout the event."

## Env vars expected

- `HACKATHON_API` — defaults to `https://aitrailblazers.org/api/leaderboard`
- `HACKATHON_API_KEY` — the shared key for your event, from the Participant Guide.
  One key per hackathon; it decides which board you write to.

## Failure modes

- Network down → save the team info locally with `team_id: "PENDING"`, retry on next session start.
- `unauthorized` from `/config` → wrong or missing key. Do not guess; check the Guide, then flag a mentor.
- Duplicate team name → server rejects it; ask the user to pick a different name.
  Names only need to be unique within your own event.

---
name: hackathon-setup
description: One-time team registration for the hackathon leaderboard. Captures team name, project name, members, contact email, registers with the central API, writes ~/.hackathon/team.json. Use the first time anyone on the team installs the plugin, OR when ~/.hackathon/team.json is missing. Triggers automatically from SessionStart hook if not yet registered.
---

# hackathon-setup

Registers a team with the central leaderboard. Runs once per machine.

## When this runs

- First time anyone invokes a hackathon plugin on a fresh machine
- When `~/.hackathon/team.json` does not exist (SessionStart hook detects this and triggers you)
- When a teammate types `/hackathon-setup` manually to re-register or update

## What you do

1. **Check existing registration first.** If `~/.hackathon/team.json` exists and has a `team_id`, ask "You're already registered as `<team_name>`. Re-register (replaces this machine's team binding)? [y/N]" — default no, exit if no.

2. **Collect team info via AskUserQuestion (one question at a time):**
   - Team Name (required, single line)
   - Project Name (required, single line — what you're building)
   - Team Members (required, comma-separated names)
   - Contact Email (required, one person who reads it)

3. **POST to the registration endpoint:**
   ```bash
   curl -sS -X POST "$HACKATHON_API/register" \
     -H "Authorization: Bearer $HACKATHON_API_KEY" \
     -H "Content-Type: application/json" \
     -d "{\"team_name\": \"...\", \"project_name\": \"...\", \"members\": \"...\", \"contact_email\": \"...\"}"
   ```
   Server returns `{"team_id": "T-007"}`.

4. **Write `~/.hackathon/team.json` (mode 0600):**
   ```json
   {
     "team_id": "T-007",
     "team_name": "...",
     "project_name": "...",
     "members": "...",
     "contact_email": "...",
     "registered_at": "<iso8601>"
   }
   ```

   The API key itself lives in `$HACKATHON_API_KEY` (set by the plugin install,
   not stored per-team).

5. **Confirm to the team:** print team_id, leaderboard URL (`https://aitrailblazers.org/hackathon-3/leaderboard`), and the next-step nudge: "Use `/log-milestone` whenever you ship something. Coaches verify within ~30 min."

## Env vars expected

- `HACKATHON_API` — defaults to `https://aitrailblazers.org/api/leaderboard`
- `HACKATHON_API_KEY` — single shared key baked into the plugin install. Same key used by teams, coaches, and the leaderboard page.

## Failure modes

- Network down → save the team info locally with `team_id: "PENDING"`, retry on next session start.
- Duplicate team name → server returns 409, ask user to pick a different name.
- Missing shared key → tell user the plugin is misconfigured and to flag a coach.

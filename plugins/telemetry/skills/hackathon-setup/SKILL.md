---
name: hackathon-setup
description: One-time leaderboard setup for a hackathon team member. Discovers which hackathon your key belongs to, then JOINS your team if someone already registered it, or registers it if you are first. Writes ~/.hackathon/team.json. Use the first time anyone installs the plugin, OR when ~/.hackathon/team.json is missing. Triggers automatically from SessionStart hook if not yet registered.
---

# hackathon-setup

Connects this machine to the team's leaderboard entry. Runs once per machine.

**Joining is the normal path. Registering is the exception.** Every member of a
team runs this on their own laptop, but the team should appear on the board
exactly once. Only the first person to run it registers; everyone after joins the
team that already exists. Two people registering "Tidepool" and "Team Tidepool"
splits one team's score across two rows, and untangling that mid-event means
hand-editing Airtable.

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

3. **Look at who is already registered, before asking anything:**

   ```bash
   curl -sS "$HACKATHON_API/teams" -H "Authorization: Bearer $HACKATHON_API_KEY"
   ```

   Returns the teams already on the board for this event, ordered by table
   number:
   ```json
   {"event": "sd-2026-08", "teams": [
     {"team_id": "rec...", "team_number": "3", "team_name": "Tidepool", "project": "Shelter intake", "members": "Ana, Ben"}
   ]}
   ```

4. **If any teams exist, offer to join one first.** Present them with
   AskUserQuestion in the order the server returned them, labelled
   `Table <team_number> — <team_name>` with the project as the description, and
   "My team isn't listed yet" as the last option. Do not describe joining as an
   advanced or secondary path — it is what most people should pick.

   `team_number` is an empty string for teams that have no table assigned yet.
   Label those with the team name alone — never `Table  — Tidepool`, which
   reads like a bug and makes people doubt they picked the right row.

   **Lead with the table number.** At check-in a participant is told which table
   they are at and sent there. That number is often the only thing they know for
   certain: they may not know the team's short name, and they almost certainly do
   not know the nonprofit's full project name. Ask "what table are you at?"
   rather than "what is your team called?", and match on the number when they
   give you one. Fall back to the name only for teams with no number.

   On joining, skip registration entirely. You already have the `team_id`; go
   straight to step 6. Nothing is written to the server, because the team record
   already exists.

   Only when the user picks "My team isn't listed yet" — or the list came back
   empty — continue to step 5.

   If the user's team name is *similar but not identical* to one on the list
   ("Tidepool" vs "Team Tidepool"), ask before registering. Nine times out of ten
   it is the same team and a teammate typed it slightly differently.

5. **Register the team (first person only).** This is rare. Organizers load the
   teams onto the board before check-in, so reaching this step usually means
   something is off. Say so plainly: "I don't see any teams on the board yet,
   which is unusual. If you're sitting at a numbered table, grab a mentor before
   registering, so you don't become a second copy of a team that already exists."

   Then ask for **the team name only**. Offer table number, project, members, and
   contact email as optional, and accept "I don't know" for every one of them —
   an organizer fills those in later from the check-in sheet. Never block
   registration on a detail the participant has no way to know. A made-up project
   name is worse than a blank one, because it looks authoritative on the board.

   ```bash
   curl -sS -X POST "$HACKATHON_API/register" \
     -H "Authorization: Bearer $HACKATHON_API_KEY" \
     -H "Content-Type: application/json" \
     -d "{\"team_name\": \"...\", \"team_number\": \"...\"}"
   ```

   Only `team_name` is required. Send `team_number`, `project_name`, `members`,
   and `contact_email` when you have them; omit them when you don't.

   Server returns `{"team_id": "rec...", "event": "sd-2026-08"}`. The server stamps
   the event onto your team record from the key — you never send it.

   If it returns `team name already registered`, a teammate beat you to it by
   seconds. Re-fetch `/teams` and join that team instead of picking a different
   name.

6. **Write `~/.hackathon/team.json` (mode 0600)**, caching the event config so
   `log-milestone` and `confirm-milestone` don't have to re-fetch it:
   ```json
   {
     "team_id": "rec...",
     "team_number": "...",
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

   `team_id`, `team_name`, and `event` are always present. The rest may be
   empty or absent — a participant who joined a team the organizers had not
   finished filling in, or who registered knowing only a name, genuinely does
   not have them. Write what you have and leave the rest out rather than
   inventing placeholders; `log-milestone` reads only `team_id`, `categories`,
   and `board_url`.

   The API key itself lives in `$HACKATHON_API_KEY` (set by the participant from
   the Guide), not in this file.

7. **Confirm:** print whether you joined or registered, the `team_id`, the event
   name, the `board_url` from `/config`, and the next-step nudge: "Use
   `/log-milestone` whenever you ship something. Mentors verify throughout the
   event." If you registered, add: "You are the first on your team — tell your
   teammates to run `/hackathon-setup` and pick this team from the list."

## Env vars expected

- `HACKATHON_API` — defaults to `https://aitrailblazers.org/api/leaderboard`
- `HACKATHON_API_KEY` — the shared key for your event, from the Participant Guide.
  One key per hackathon; it decides which board you write to.

## Failure modes

- Network down → save the team info locally with `team_id: "PENDING"`, retry on next session start.
- `unauthorized` from `/config` → wrong or missing key. Do not guess; check the Guide, then flag a mentor.
- Duplicate team name → a teammate already registered. Re-fetch `/teams` and join
  theirs. Never work around it by picking a different name; that is the exact
  failure this flow exists to prevent.
- `/teams` unreachable but `/config` worked → say so, and let the user choose
  between retrying and registering. Warn that registering blind may duplicate a
  team a teammate already made.
- The participant knows their table number but no team on the list has one →
  the board was loaded before table assignments were made. Show the list by name
  and project instead, and tell an organizer to re-run the roster sync.
- `/teams` comes back empty at an event that has already started → do not quietly
  fall through to registration for everyone who asks. Say the board looks
  unloaded and point at a mentor. Six participants each registering their own
  version of the same team is far more expensive to untangle than one person
  waiting two minutes.

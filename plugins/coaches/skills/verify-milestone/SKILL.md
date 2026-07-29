---
name: verify-milestone
description: Mentor-only. Verify a team's self-reported milestone, or directly log a mentor-witnessed event. Use when a team flags you to verify they hit a milestone, or when you saw a milestone happen in person and want to log it directly. Triggers for "verify milestone rec123", "verify team X's commitment", "I just saw team Y ship their page".
---

# verify-milestone

Mentor-only skill. Flips `verified: true` on self-reported events or logs new mentor-witnessed events.

Self-reported milestones show on the board as "pending" the moment a team logs them.
Verifying is what turns a pending milestone into score.

## When this runs

- Mentor typed `/verify-milestone rec123` to verify a specific event
- Mentor said "team Tidepool really did get that commitment — verify it"
- Mentor witnessed something directly and wants to log with full credit immediately (`source: coach_logged`, `verified: true`)

## Know your event first

Your key belongs to exactly one hackathon, and it can only verify that hackathon's
milestones. To see which event you're on and which categories it scores:

```bash
curl -sS "$HACKATHON_API/config" -H "Authorization: Bearer $HACKATHON_API_KEY"
```

Use the returned `categories[].id` values when logging directly. Sending a category
another event uses comes back as a `400` naming the allowed set. Acting on a team or
milestone from a different hackathon comes back as a `403` — that means you are
holding the wrong event's key, not that the record is broken.

## Modes

### Verify an existing self-reported event

```bash
curl -sS -X PATCH "$HACKATHON_API/event/rec123/verify" \
  -H "Authorization: Bearer $HACKATHON_API_KEY" \
  -H "Content-Type: application/json" \
  -d "{\"verified_by\": \"Aaron Eden\"}"
```

The board drops its cache on every write, so a verified milestone shows up on the
team's next poll rather than minutes later.

### Find your teams' IDs

Every other call needs a `team_id`, and a mentor knows their teams by name. List them:

```bash
curl -sS "$HACKATHON_API/teams" -H "Authorization: Bearer $HACKATHON_API_KEY"
```

Returns every team registered for your event with its `team_id`, name, project, and
members. Match on name, and if two entries look like the same team registered twice,
flag it to an organizer rather than verifying onto one of them — their score is
currently split.

### List pending verifications for a team

```bash
curl -sS "$HACKATHON_API/team/<team_id>/pending" \
  -H "Authorization: Bearer $HACKATHON_API_KEY"
```
Then walk each one with the mentor: show notes + evidence URL, ask verify/reject.

### Log a mentor-witnessed event directly

Use this when a mentor saw the milestone happen and wants to log it as immediately verified:
```bash
curl -sS -X POST "$HACKATHON_API/event" \
  -H "Authorization: Bearer $HACKATHON_API_KEY" \
  -H "Content-Type: application/json" \
  -d "{
    \"team_id\": \"<team_id>\",
    \"event_type\": \"<category id from /config>\",
    \"source\": \"coach_logged\",
    \"verified\": true,
    \"verified_by\": \"<mentor name>\",
    \"notes\": \"...\"
  }"
```

## Rules

- Everyone at the event uses the same API key. The `coaches` plugin is gated by *who installs it*, not by a different credential. Don't install on team machines.
- Ask for evidence before verifying anything that claims an outside party did something — a commitment, a launched outreach, a shipped asset. A link, a screenshot, or having witnessed it.
- Rejecting is fine: PATCH with `{"verified": false, "verified_by": "<mentor>", "rejection_reason": "..."}`.
- Categories come from `/config`, not from memory. Different hackathons score different things.

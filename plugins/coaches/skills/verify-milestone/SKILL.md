---
name: verify-milestone
description: Coach-only. Verify a team's self-reported milestone, or directly log a coach-witnessed event. Use when a team flags you to verify they hit a milestone, or when you saw a milestone happen in person and want to log it directly. Triggers for "verify milestone E-042", "verify team T-007's payment", "I just saw team X land their first signup".
---

# verify-milestone

Coach-only skill. Flips `verified: true` on self-reported events or logs new coach-witnessed events.

## When this runs

- Coach typed `/verify-milestone E-042` to verify a specific event
- Coach said "team T-007 really did get that signup — verify it"
- Coach witnessed something directly and wants to log with full credit immediately (`source: coach_logged`, `verified: true`)

## Modes

### Verify existing self-reported event

```bash
curl -sS -X PATCH "$HACKATHON_API/event/E-042/verify" \
  -H "Authorization: Bearer $HACKATHON_API_KEY" \
  -d "{\"verified_by\": \"Aaron Eden\"}"
```

### List pending verifications for a team

```bash
curl -sS "$HACKATHON_API/team/T-007/pending" \
  -H "Authorization: Bearer $HACKATHON_API_KEY"
```
Then walk each one with the coach: show notes + evidence URL, ask verify/reject.

### Log a coach-witnessed event directly

Use this when a coach saw the milestone happen and wants to log it as immediately verified:
```bash
curl -sS -X POST "$HACKATHON_API/event" \
  -H "Authorization: Bearer $HACKATHON_API_KEY" \
  -d "{
    \"team_id\": \"T-007\",
    \"event_type\": \"payment\",
    \"source\": \"coach_logged\",
    \"verified\": true,
    \"verified_by\": \"<coach name>\",
    \"notes\": \"...\"
  }"
```

## Rules

- Everyone at the event uses the same API key. The `coaches` plugin is gated by *who installs it*, not by a different credential. Don't install on team machines.
- Always ask for evidence before verifying a `payment` event — Stripe receipt, screenshot, or witness.
- Rejecting is fine: PATCH with `{"verified": false, "verified_by": "<coach>", "rejection_reason": "..."}`.

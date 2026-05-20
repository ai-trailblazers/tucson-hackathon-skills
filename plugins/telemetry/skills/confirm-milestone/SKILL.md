---
name: confirm-milestone
description: Triggered by the PostToolUse hook when a likely milestone signal is detected (Stripe payment link created, page deployed, write to experiments.md / conversations.md / insights.md). Asks the team to confirm before logging. Never auto-logs. Use only when the telemetry hook routes you here — do not call directly.
---

# confirm-milestone

Hook-driven. The PostToolUse hook detected a candidate milestone signal and routed it here.

## When this runs

Only via `~/.hackathon/.sniff-queue` written by the telemetry hook. Each line in the queue is JSON:
```json
{"signal": "stripe_payment_link", "tool": "Bash", "evidence": "stripe payment_links create ...", "ts": "..."}
```

## What you do

1. **Read and drain `~/.hackathon/.sniff-queue`.** For each pending signal:

2. **Ask the team once, with concrete context:**
   - `stripe_payment_link` → "Looks like you created a Stripe payment link. Log this as `payment-link-ready`? Or skip if you're still testing. [log / skip / log-as-other]"
   - `deploy_detected` → "Looks like you just deployed something. Log as `page-live`? [log / skip / log-as-other]"
   - `wrote_conversations_md` → "You added to `conversations.md`. Log a new customer conversation? [log / skip]"
   - `wrote_experiments_md` → "You added to `experiments.md`. Log an experiment? [log / skip]"
   - `wrote_insights_md` → "You added to `insights.md`. Tied to a customer conversation? [yes-log-conv / skip]"

3. **If `log`:** POST to `/event` with `source: "detected"`, `tool_name`, and the evidence string in notes.

4. **If `skip`:** record in `~/.hackathon/.skip-cache` so the hook doesn't ask again about this exact evidence for the rest of the session.

5. **If `log-as-other`:** call `log-milestone` to let the team pick the right type.

## Anti-spam

- Max one prompt per signal type per 5 minutes. The hook respects this via the skip-cache timestamp.
- Never block the user's work — if the team ignores the prompt, drain the queue silently after 60 seconds.

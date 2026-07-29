---
name: confirm-milestone
description: Triggered by the PostToolUse hook when a likely milestone signal is detected (a deploy, a write to experiments.md / conversations.md / insights.md, an ngrok command or artifact, a PR to the shared skills repo). Asks the team to confirm before logging. Never auto-logs. Use only when the telemetry hook routes you here — do not call directly.
---

# confirm-milestone

Hook-driven. The PostToolUse hook detected a candidate milestone signal and routed it here.

## When this runs

Only via `~/.hackathon/.sniff-queue` written by the telemetry hook. Each line in the queue is JSON:
```json
{"signal": "deploy_detected", "tool": "Bash", "evidence": "vercel deploy --prod", "ts": "..."}
```

## What you do

1. **Read and drain `~/.hackathon/.sniff-queue`.** For each pending signal:

2. **Map the signal to one of *this event's* categories.** The hook detects generic
   developer activity; only the server knows what your hackathon scores. Read
   `categories` from `~/.hackathon/team.json` (or `GET /config`) and pick the closest
   match by its `description`:

   | Signal | What happened | Typical category |
   |---|---|---|
   | `deploy_detected` | something was deployed to the public internet | whichever category covers shipping a reachable artifact |
   | `wrote_experiments_md` | the team recorded an experiment | whichever category covers running a real test |
   | `wrote_conversations_md` | the team recorded a conversation | whichever category covers talking to a real person |
   | `wrote_insights_md` | insight written, usually tied to a conversation | same as above, if it was a real conversation |
   | `commitment_recorded` | someone committed time, money, data, or access | whichever category covers a secured commitment |
   | `outreach_sent` | a real outreach loop went out | whichever category covers launched outreach |
   | `ngrok_used` | a service was exposed via ngrok | whichever category covers shipping a reachable artifact |
   | `skill_published` | a PR was opened to the shared skills repo | whichever category covers shipping a reusable asset |

   If no category is a clean fit, do **not** invent one — offer `log-as-other` and
   let `log-milestone` show the team the real list.

3. **Ask the team once, with concrete context**, naming the category you would use:
   "Looks like you just deployed something. Log this as *shipped an asset*? [log / skip / log-as-other]"

4. **If `log`:** POST to `/event` with `source: "detected"`, the chosen category `id`,
   `tool_name`, and the evidence string in notes.

5. **If `skip`:** record in `~/.hackathon/.skip-cache` so the hook doesn't ask again about this exact evidence for the rest of the session.

6. **If `log-as-other`:** call `log-milestone` to let the team pick the right type.

## Anti-spam

- Max one prompt per signal type per 5 minutes. The hook respects this via the skip-cache timestamp.
- Never block the user's work — if the team ignores the prompt, drain the queue silently after 60 seconds.
- A detected signal is a guess about developer activity, not proof of a milestone.
  When in doubt, skip; the team can always `/log-milestone` deliberately.

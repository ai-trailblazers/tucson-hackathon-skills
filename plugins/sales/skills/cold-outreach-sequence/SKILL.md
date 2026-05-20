---
name: cold-outreach-sequence
description: Draft a 3-touch cold outreach sequence (LinkedIn DM, email, follow-up) targeting a specific prospect or list. Writes drafts only — never sends. Use when the team needs to start customer conversations from cold: "write outreach to [name]", "draft cold emails for our list", "DM these 10 prospects", "follow up on no-reply". Pairs upstream with researching-customer-segments and discovery-interview-prep. Do NOT use for warm intros or replies to inbound (those need different framing).
---

# cold-outreach-sequence

Hackathon fork of `managing-sales-followups` + `planning-outreach`. Writes drafts to `outreach/<prospect-slug>.md` in the team's repo.

## Preconditions

Refuse to draft unless the team can answer:
1. **Who specifically.** Name, role, company, why this person.
2. **What you're offering.** One sentence. If the team can't say it, route to `populating-lean-canvas`.
3. **What you want them to do.** Reply with X? Book a call? Try a link? Pick ONE ask per sequence.

## The 3-touch sequence

### Touch 1 — Open (Day 0)
- Personalized opener (1 sentence about them, not you)
- Why-you-them sentence (1 line — what you noticed, what you're testing)
- The ask (one specific, low-commitment thing)
- Total: ≤4 sentences.

### Touch 2 — Bump (Day 3)
- Reference the first message ("circling back on…")
- Add one new piece of value (a question, a snippet, a thought)
- Same ask, smaller (15 min → 5 min, call → reply, etc.)

### Touch 3 — Break-up (Day 7)
- "Last note from me on this"
- Restate the ask one final time, optional
- "If now's not the right time, totally fine — should I follow up in [timeframe]?"
- Leave the door open without begging.

## Output

For each prospect, write `outreach/<prospect-slug>.md`:

```markdown
# <name> — <company> — <role>
## Why this person
<1-2 lines>

## Sequence

### Touch 1 — <date>
**Channel:** LinkedIn DM | Email
**Subject:** <if email>
<message body>

### Touch 2 — <date+3d>
<message body>

### Touch 3 — <date+7d>
<message body>

## Reply log
- <date>: <inbound/outbound, what happened>
```

## Rules

- Drafts only. Team sends from their own account.
- One ask per touch. Multiple asks = no reply.
- No "Hope this finds you well." Cut it.
- No ChatGPT-isms. Read the de-ai-ify skill before sending.
- If you DM 10 people and 0 reply, the message is broken, not the audience — rewrite, don't add more names.

## Anti-patterns

- "Quick question" subject lines (manipulative, transparent).
- Asking for a 30-min "intro call" without context.
- Sending the same message to 20 people unchanged.
- Following up 5 times — 3 touches, then stop.

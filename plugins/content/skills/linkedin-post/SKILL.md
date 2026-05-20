---
name: linkedin-post
description: Draft a single LinkedIn post in the founder's voice, tied to a specific moment (launch, insight, ask). Always returns 2-3 distinct variants for the founder to pick. Use when the team wants to post about a milestone, share a customer learning, or recruit prospects via the feed. Triggers: "write a LinkedIn post", "post about [topic]", "share what we learned", "announce launch on LinkedIn". Do NOT use for cold DMs (use cold-outreach-sequence) or thought-leadership thread series (different format).
---

# linkedin-post

Hackathon fork of `drafting-social-posts`. Writes drafts to `social/<YYYY-MM-DD>-<topic-slug>.md`.

## The moment matters

A post needs a moment. Match the post type to what just happened:

| Moment | Post type | Hook style |
|---|---|---|
| Launched a page | Build-in-public | "Shipped X in 4 hours. Here's what broke." |
| Talked to 5 customers | Insight | "5 conversations with [segment]. Here's the pattern I didn't expect." |
| Got first signup/sale | Milestone | "First paying customer. Here's exactly what they bought and why." |
| Stuck and need help | Ask | "Working on X for [segment]. Need 3 people to talk to — DM me." |
| Saw something dumb in the market | Hot take | "[Specific thing] is broken. Here's why." |

If no moment fits, don't post. "Engagement posts" with no underlying news read as filler.

## Structure (every variant)

```
Hook (1 line — stops the scroll)

Context (2-3 lines — what happened, who it's about)

Insight or ask (2-3 lines — the new thing OR the specific request)

CTA (1 line — DM me, comment, click, follow)
```

## Output

`social/<YYYY-MM-DD>-<topic>.md`:

```markdown
# LinkedIn post — <topic>
**Moment:** <one line about what triggered this>
**Audience:** <segment slug>
**Goal:** <signups | DMs | engagement | recruiting interviewees>

## Variant A — <angle>
<post body, single backtick blocks for code, no markdown headers — LI strips them>

## Variant B — <different angle>
<post body>

## Variant C — <different angle>
<post body>

---

## Voice notes
- Write like the founder talks. If they don't say "leverage," don't write "leverage."
- No em dashes. Use periods or commas.
- No "I'm thrilled to announce."
```

## Anti-patterns

- Lists of 7 numbered "lessons" with no specifics.
- "I had a great chat with [name]" with no concrete insight.
- Using LI emojis (🚀, 📈) as bullet markers — feels like a 2019 growth-hack template.
- Posting more than once a day from the same founder — the algorithm caps you anyway.

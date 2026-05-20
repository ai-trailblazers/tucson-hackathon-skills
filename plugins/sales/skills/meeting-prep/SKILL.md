---
name: meeting-prep
description: Build a one-page brief for an upcoming customer or partner meeting. Captures who they are, what they likely care about, your specific ask, and 3 questions you must ask before they hang up. Use whenever a real meeting is on the calendar: "prep for the call with [name]", "brief on [company] meeting", "I'm meeting with [prospect] tomorrow". Do NOT use for problem interviews (use discovery-interview-prep) or internal team meetings.
---

# meeting-prep

Hackathon fork of `preparing-for-meetings`. One markdown file, ready to skim 5 minutes before the call.

## Inputs

- Their name, role, company
- Meeting reason / who set it up
- What you want out of it

## Output

`meetings/<YYYY-MM-DD>-<name-slug>.md`:

```markdown
# <Name> — <Role> at <Company>
**When:** <date, time, format>
**Set by:** <who introduced or how booked>

## Who they are (60 seconds)
- LinkedIn highlight: <one line>
- Company TL;DR: <what they sell, to whom, rough size>
- Why they took this meeting (best guess): <one line>

## What they likely care about
- <top 1-3 things based on role + company stage>

## Your ONE specific ask
<one sentence — what you want them to do or decide by the end of the call>

## Must-ask questions (3 max)
1. <past-behavior question tied to your assumption>
2. <a "show me how you do this today" question>
3. <a willingness-to-do-something-next question>

## What you do NOT do on this call
- Don't pitch
- Don't demo before you've heard the problem
- Don't offer a discount
- Don't promise features

## Follow-up commitment
What you'll send within 24h of the call: <one thing>
```

## Rules

- 5-minute prep. Not 30. If you can't write it in 5, you don't have enough info — go research more or shorten.
- Always have ONE ask. Without it, you'll wander.
- If this is a paid call (they're buying), use the demo flow, not this skill.

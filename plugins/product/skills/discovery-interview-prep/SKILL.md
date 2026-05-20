---
name: discovery-interview-prep
description: Prep a 30-minute problem interview with one prospective customer. Drafts a script tied to a specific assumption you want to test, with past-behavior questions (not opinion questions), opener, and debrief template. Use when the team has someone to talk to about their problem space — "interview prep for [name]", "build a script for our customer call", "we're talking to [person] tomorrow about [topic]". Do NOT use for sales calls, demos, or generic meeting prep.
---

# discovery-interview-prep

Hackathon fork of `running-problem-interviews`. Local files only — no Airtable, no Drive.

## What a problem interview is

30-45 min, 1-on-1, tests ONE specific assumption. Customer talks 80% of the time. You're hunting for **past behavior stories**, not future intent. "Tell me about the last time X happened" beats "would you use a tool that does X".

## Preconditions

Refuse to draft unless:
1. The team has named a single assumption the interview tests.
2. The team has a specific person scheduled (or at least named with a way to reach them).

If either is missing, push back: "Who specifically, and what one thing are you trying to learn?"

## Workflow

### 1. Confirm the assumption

Restate in one sentence: "This interview tests whether [target customer] currently [behavior] when [trigger], and what it costs them."

### 2. Research the interviewee (5 min)

Pull from LinkedIn / company site / past convos:
- Role, company size, what their day looks like
- Anything that suggests they DO have the problem (or definitely don't)

### 3. Draft the script

Structure (port from `references/interview-structure.md`):

```
Opener (2 min)
  - Thank, set context, no-pitch promise, recording consent.
  - "I'm not selling anything. I want to understand how you [do X] today."

Past-behavior questions (20-25 min)
  - "Tell me about the last time you had to [problem]."
  - "Walk me through what you did."
  - "What was hardest about that?"
  - "What did you try before that?"
  - "How much time/money does this cost in a typical week?"
  - "Who else feels this pain in your org?"

Follow-ups (always)
  - "Tell me more about that."
  - "Why was that hard?"
  - "What happened next?"

Close (3 min)
  - "Anything I should have asked?"
  - "Can I follow up if I have more questions?"
  - "Who else should I talk to about this?"
```

### 4. Save the script

Write to `interviews/<date>-<interviewee-slug>.md` in the team's repo.

### 5. Debrief template (use after the call)

Append to `conversations.md`:

```markdown
## <date> — <interviewee name>, <role> at <company>
- Assumption tested: <one sentence>
- Top 3 quotes (verbatim): 
- Past-behavior evidence: <what they did, not what they said>
- Pain score (1-10): 
- Willingness-to-pay signal: 
- Decision impact on the assumption: confirmed | weakened | killed
- Next: <action>
```

Writing to `conversations.md` triggers the telemetry hook → `/confirm-milestone` will offer to log this as a `customer-conversation` event.

## Anti-patterns to flag mid-script

- Leading questions: "Don't you think it would be great if...?" → kill.
- Future intent: "Would you use...?" → convert to "What did you do the last time?"
- Demo creep: pitching the solution mid-interview → reset, stop, finish the problem questions.

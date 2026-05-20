---
name: creating-skills
description: Write a new Claude Code skill, validate its triggering description, and open a PR to the shared tucson-hackathon-skills repo. Use when the team wants to "create a skill", "make a skill for X", "publish a skill", "share what we just built", or has a workflow they ran 2+ times manually and want to codify. Pairs with the leaderboard `skill-published` milestone.
---

# creating-skills

Hackathon fork of the BB `creating-skills` skill. Streamlined for 1-hour writes + PR back.

## When to write a new skill

The signal: you've manually walked through the same multi-step workflow 2+ times AND would want Claude to nail it on the 3rd. If you ran it once, don't bother — premature codification.

## Workflow

### 1. Pick the right plugin

Where does this skill belong? Match to an existing plugin in the marketplace:
- `landing-pages`, `sales`, `marketing`, `product`, `research`, `content`, `dev`, `operations`

If none fits, the skill probably belongs in your own team's local skills, not the shared repo.

### 2. Write the SKILL.md

Two files matter: `SKILL.md` (the skill) and optionally `references/*.md` (extra context loaded only when needed).

Structure:

```markdown
---
name: <kebab-case>
description: <single dense paragraph: what it does, when to use, what it produces, when NOT to use. This is what Claude reads to decide whether to invoke. Be specific — "use when X, Y, or Z" with concrete phrases.>
---

# <skill name>

## What this skill is for

One paragraph. Plain language. What changes after this skill runs.

## Inputs you need

Numbered list. Refuse to start if any required input is missing.

## Workflow

Numbered steps. Each step has a clear input → output.

## Output

What gets written, where, in what format.

## Anti-patterns

What this skill does NOT do, common misuses, edge cases that should route elsewhere.
```

### 3. Test the description

Read the description aloud as if you were Claude deciding whether to trigger it. Does it cover:
- The phrases a user might say? ("create a landing page", "ship a page", "deploy a site")
- The clear NOT cases? (Do not use for X, use Y instead.)
- The pairing? (Pairs with X upstream, Y downstream.)

If the description is vague, the skill won't trigger — and a skill that doesn't trigger is dead.

### 4. PR to the shared repo

```bash
# Fork if you haven't already
gh repo fork ai-trailblazers/tucson-hackathon-skills --clone

cd tucson-hackathon-skills
git checkout -b add-<skill-name>
# add your skill at plugins/<role>/skills/<skill-name>/SKILL.md
git add plugins/<role>/skills/<skill-name>/
git commit -m "Add <skill-name> skill"
git push origin add-<skill-name>
gh pr create --title "Add <skill-name>" --body "<what it does, why, who tested it>"
```

The `gh pr create` call against `tucson-hackathon-skills` triggers the telemetry hook → logs `skill-published` for the leaderboard.

### 5. Update the CATALOG.md row

Add your skill to the relevant section in `CATALOG.md` with status 🟢 vendored. Coaches will review the PR within a few hours.

## What gets rejected

- Skills that duplicate existing ones (run `skill-overlap-checker` first if available).
- Descriptions too vague to trigger reliably.
- Skills that bake in your team's credentials or specific data.
- Skills that depend on infrastructure other teams don't have.

## What gets fast-tracked

- Generic enough that any team could use it.
- Solves a real problem you hit during the hackathon (not theoretical).
- One clear "before/after" — what the team can do now that they couldn't before.

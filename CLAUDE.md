# Repo guide for Claude Code

This repo is a curated directory of Claude Code skills for the Tucson AI Hackathon 3 (May 23–24, 2026) and similar "ship-a-business-by-Sunday" events.

## What goes here

Skills that help non-technical or semi-technical founders move on the four judging metrics:

1. Experiments run
2. Customer conversations
3. Anyone pay
4. AI-teammate collaboration

If a candidate skill doesn't plausibly serve one of those, it doesn't belong.

## Layout

```
skills/<role>/<skill-name>/
  SKILL.md         # required — the skill itself
  SOURCE.md        # required for vendored, optional for originals
  ...support files
```

Roles: `landing-pages`, `sales`, `marketing`, `product`, `research`, `content`, `dev`, `operations`.

## When asked to "add a skill"

1. Read `CONTRIBUTING.md` first.
2. Decide vendor / original / link (see CONTRIBUTING).
3. Place under the correct role folder.
4. Update the role table in `README.md` with a one-line description.
5. If vendoring, pin a commit SHA in `SOURCE.md` — never just "main".

## When asked to "vet a skill"

Check:
- License (MIT / Apache / public domain → ok)
- SKILL.md frontmatter `description` mentions concrete user requests (so triggering works)
- Files referenced in SKILL.md exist
- Skill activates on a plausible prompt in a fresh session
- Maps to ≥1 hackathon judging metric

Write findings into the skill's `SOURCE.md` under "Vetting notes".

## Don't

- Don't copy code with no LICENSE file. Ask the upstream author or skip.
- Don't vendor skills that depend on private APIs/keys without documenting the credential dance.
- Don't add dev-internals skills (TDD orchestration, debugging frameworks) unless directly hackathon-useful.

# Repo guide for Claude Code

This repo is a curated directory of Claude Code skills for AI Trailblazers hackathons. It is **event-agnostic**: one marketplace serves every event, and the telemetry plugin discovers which hackathon a participant is at from their API key.

## What goes here

Skills that help non-technical or semi-technical teams move on what their event actually scores. Milestone categories are defined per event on the server (`GET /config`), not in this repo — a business-launch hackathon and a nonprofit mission hackathon score different things.

The durable shape of what belongs:

1. Running a real experiment
2. Talking to a real person outside the team
3. Getting something concrete committed
4. Shipping something reusable and reachable
5. Working well alongside AI teammates

If a candidate skill doesn't plausibly serve one of those, it doesn't belong.

**Never hard-code milestone category names in a skill.** Read them from
`~/.hackathon/team.json` or `GET /config`. A skill that lists categories inline
breaks at the next event — that is the exact bug this repo was restructured to
remove.

## Layout

This repo is a **Claude Code plugin marketplace**. Each role is a plugin.

```
.claude-plugin/marketplace.json    # lists all 8 role plugins
plugins/<role>/
  .claude-plugin/plugin.json       # role plugin manifest
  skills/<skill-name>/
    SKILL.md       # required — the skill itself
    SOURCE.md      # required for vendored, optional for originals
    ...support files
```

Roles: `landing-pages`, `sales`, `marketing`, `product`, `research`, `content`, `dev`, `operations`.

## When asked to "add a skill"

1. Read `CONTRIBUTING.md` first.
2. Decide vendor / original / link (see CONTRIBUTING).
3. Place under `plugins/<role>/skills/<skill-name>/`.
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

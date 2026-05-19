# Tucson Hackathon Skills

An open-source, curated directory of [Claude Code skills](https://docs.claude.com/en/docs/claude-code/skills) for founders launching real businesses in a weekend.

Built for **[AI Hackathon 3](https://www.meetup.com/old-pueblo-new-economy-artificial-intelligence-trailblazers/events/313338598/)** (Tucson IDA, May 23–24, 2026) — and free for any team, anywhere, running a similar "ship a business by Sunday" hackathon.

> **The premise:** Teams work *alongside* AI teammates (Landing Pages, Sales, Marketing, Product, Research, Content, Dev). Winning teams aren't measured on pitch decks — they're measured on **experiments run, customer conversations had, and whether anyone paid.** These skills exist to compress the distance between idea and first dollar.

## Quick start

This repo is a **Claude Code plugin marketplace**. Add it once, then install whichever role plugins your team needs — no copying files.

```text
# 1. Add the marketplace (run inside Claude Code)
/plugin marketplace add ai-trailblazers/tucson-hackathon-skills

# 2. Browse and install
/plugin                                  # interactive: Discover tab
/plugin install product@tucson-hackathon # or install a role directly
/plugin install sales@tucson-hackathon

# 3. Keep it current
/plugin marketplace update tucson-hackathon
```

Each role is one plugin. Installing it brings in every skill for that role; Claude triggers them by description, or invoke directly as `/role:skill-name`.

## Plugins by role

Each row is an installable plugin (`<name>@tucson-hackathon`). Mirrors the Brain Bridge AI teammate suite used at the hackathon.

| Plugin | What it helps you do | Skills |
|--------|---------------------|--------|
| 🛬 `landing-pages` | Ship a live, branded landing page in under an hour | `landing-in-an-hour` |
| 📞 `sales` | Find prospects, write outreach, run discovery calls, close payments | `pay-me-now` |
| 📣 `marketing` | Ads, SEO, positioning, launch posts | _pending_ |
| 🧭 `product` | PRDs, hypothesis tests, roadmap, scope cuts | `hypothesis-to-experiment` |
| 🔬 `research` | Customer interviews, competitor scans, market sizing | _pending_ |
| ✍️ `content` | LinkedIn, newsletter, brand voice, decks, social | _pending_ |
| 💻 `dev` | Frontend scaffolds, payment links, deploy, integrations | _pending_ |
| ⚙️ `operations` | Milestones, scheduling, expense tracking, sponsor handoff | _pending_ |

👉 **Full catalog with verdicts & licenses: [CATALOG.md](CATALOG.md)** — 65 skills across 8 roles, with a 7-skill "starter pack" to get a team productive in 10 minutes.

## How skills get into this repo

This is a **curated** directory, not a free-for-all. Every skill is one of:

1. **Vendored** — copied in with a `SOURCE.md` pointing to the upstream repo, license, and our vetting notes.
2. **Original** — written by a hackathon participant, organizer, or contributor, MIT-licensed.
3. **Linked** — listed in the catalog with a brief verdict, but not vendored (e.g. live-updating upstream).

See [CONTRIBUTING.md](CONTRIBUTING.md) for how to propose a skill.

## Vetting criteria

A skill earns a place here when it answers **yes** to all of:

- Can a non-technical founder use it before 5pm Sunday?
- Does it move at least one judging metric (experiments, customer convos, payment, AI-teammate collab)?
- Is the license permissive (MIT / Apache / public domain)?
- Is the SKILL.md description specific enough to trigger reliably?

## Sponsors

- **[ngrok](https://ngrok.com)** — AI Gateway, $10 credit per participant. Many skills here ship with ngrok-compatible config out of the box.
- **Anthropic** — 75% nonprofit Claude Code discount for AI Trailblazers (501(c)(3)).

## Maintainers

- [Nick Yeager](https://github.com/nickyeager) — repo lead
- Aaron Eden — AITB founder
- Maria Mascareno-Eden — operations

## License

MIT for everything authored here. Vendored skills retain their original license; check the per-skill `SOURCE.md`.

# Tucson Hackathon Skills

An open-source, curated directory of [Claude Code skills](https://docs.claude.com/en/docs/claude-code/skills) for founders launching real businesses in a weekend.

Built for **[AI Hackathon 3](https://www.meetup.com/old-pueblo-new-economy-artificial-intelligence-trailblazers/events/313338598/)** (Tucson IDA, May 23–24, 2026) — and free for any team, anywhere, running a similar "ship a business by Sunday" hackathon.

> **The premise:** Teams work *alongside* AI teammates (Landing Pages, Sales, Marketing, Product, Research, Content, Dev). Winning teams aren't measured on pitch decks — they're measured on **experiments run, customer conversations had, and whether anyone paid.** These skills exist to compress the distance between idea and first dollar.

## Quick start

```bash
# Clone the directory
git clone https://github.com/AI-Trailblazers/tucson-hackathon-skills.git
cd tucson-hackathon-skills

# Browse skills by role
ls skills/

# Install a skill into your project
cp -r skills/landing-pages/<skill-name> ~/.claude/skills/
# OR keep it project-local
cp -r skills/landing-pages/<skill-name> .claude/skills/
```

Restart Claude Code. The skill is now available — invoke it by name or describe what you want and Claude will trigger it.

## Skills by role

Mirrors the Brain Bridge AI teammate suite used at the hackathon.

| Role | What it helps you do | Skills |
|------|---------------------|--------|
| 🛬 [Landing Pages](skills/landing-pages/) | Ship a live, branded landing page in under an hour | _populated below_ |
| 📞 [Sales](skills/sales/) | Find prospects, write outreach, run discovery calls, close payments | _populated below_ |
| 📣 [Marketing](skills/marketing/) | Ads, SEO, positioning, launch posts | _populated below_ |
| 🧭 [Product](skills/product/) | PRDs, hypothesis tests, roadmap, scope cuts | _populated below_ |
| 🔬 [Research](skills/research/) | Customer interviews, competitor scans, market sizing | _populated below_ |
| ✍️ [Content](skills/content/) | LinkedIn, newsletter, brand voice, decks, social | _populated below_ |
| 💻 [Dev](skills/dev/) | Frontend scaffolds, payment links, deploy, integrations | _populated below_ |
| ⚙️ [Operations](skills/operations/) | Milestones, scheduling, expense tracking, sponsor handoff | _populated below_ |

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

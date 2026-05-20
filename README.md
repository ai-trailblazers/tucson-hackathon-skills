# Tucson Hackathon Skills

An open-source, curated directory of [Claude Code skills](https://docs.claude.com/en/docs/claude-code/skills) for founders launching real businesses in a weekend.

Built for **[AI Hackathon 3](https://www.meetup.com/old-pueblo-new-economy-artificial-intelligence-trailblazers/events/313338598/)** (Tucson IDA, May 23–24, 2026) — and free for any team, anywhere, running a similar "ship a business by Sunday" hackathon.

> **The premise:** Teams work *alongside* AI teammates (Landing Pages, Sales, Marketing, Product, Research, Content, Dev). Winning teams aren't measured on pitch decks — they're measured on **experiments run, customer conversations had, and whether anyone paid.** These skills exist to compress the distance between idea and first dollar.

## Quick start

This repo is a **Claude Code plugin marketplace**. Add it once, then install whichever role plugins your team needs — no copying files.

```text
# 1. Add the marketplace (run inside Claude Code)
/plugin marketplace add ai-trailblazers/tucson-hackathon-skills

# 2. Install the REQUIRED telemetry plugin first
/plugin install telemetry@tucson-hackathon

# 3. Install any role plugins your team needs
/plugin install product@tucson-hackathon
/plugin install sales@tucson-hackathon
/plugin install ngrok@tucson-hackathon
# ...etc

# 4. Keep it current
/plugin marketplace update tucson-hackathon
```

Each role is one plugin. Installing it brings in every skill for that role; Claude triggers them by description, or invoke directly as `/role:skill-name`.

### Hackathon telemetry setup (one-time, per team)

Teams playing for the live leaderboard need the shared API key handed out at the event. Set it in your shell **before** running `/hackathon-setup`:

```bash
# Add to ~/.zshrc or ~/.bashrc (event-scoped key; rotates after the event)
export HACKATHON_API_KEY="<paste the value from the participant guide>"
export HACKATHON_API="https://aitrailblazers.org/api/leaderboard"
```

Then inside Claude Code:

```
/hackathon-setup
```

This registers your team with the central leaderboard so milestones (signups, payments, page launches, etc.) show up on the big screen at IDA. The participant guide (handed out at registration) has the key value; the live leaderboard lives at https://aitrailblazers.org/hackathon-3/leaderboard.

## Plugins by role

Each row is an installable plugin (`<name>@tucson-hackathon`). Mirrors the Brain Bridge AI teammate suite used at the hackathon.

| Plugin | What it helps you do | Skills |
|--------|---------------------|--------|
| 🎯 `telemetry` **(required)** | Register your team, capture milestone signals, log to the leaderboard | `hackathon-setup`, `log-milestone`, `confirm-milestone` |
| 🛬 `landing-pages` | Ship a live, branded landing page in under an hour | `landing-in-an-hour` |
| 📞 `sales` | Find prospects, write outreach, run discovery calls, close payments | `pay-me-now`, `cold-outreach-sequence`, `meeting-prep` |
| 📣 `marketing` | Positioning, campaign launch, ad copy across the awareness ladder | `positioning-statement`, `campaign-launch`, `ad-copy-ladder` |
| 🧭 `product` | Hypothesis tests, discovery interviews, insight capture, lean canvas | `hypothesis-to-experiment`, `discovery-interview-prep`, `conversation-to-insight`, `populating-lean-canvas` |
| 🔬 `research` | Find customers reachable in 48h, validate a segment in 30 min | `customer-finder`, `segment-research` |
| ✍️ `content` | LinkedIn posts, blog posts, AI-tell removal | `linkedin-post`, `blog-post`, `de-ai-ify` |
| 💻 `dev` | Stripe checkout setup; pair with Anthropic bundled skills for code | `stripe-payment-link` |
| ⚙️ `operations` | Milestone tracking + 5-minute team standup | `milestone-tracker`, `daily-standup` |
| 🌐 `ngrok` | Redeem $10 credit, route LLM calls through AI Gateway, expose MCP safely | `ngrok-setup`, `ngrok-expose-service`, `ngrok-ai-gateway`, `ngrok-mcp-gateway`, `ngrok-observability` |
| 🧰 `skill-builder` | Write a new skill and PR it back here (triggers `skill-published` milestone) | `creating-skills` |
| 👨‍🏫 `coaches` **(coach-only)** | Verify team milestones, log coach-witnessed events | `verify-milestone` |

For plain non-AI tunnel exposure, pair the `ngrok` plugin with the official [ngrok/agent-skills](https://github.com/ngrok/agent-skills) repo.

👉 **Full catalog with verdicts & licenses: [CATALOG.md](CATALOG.md)** — original skills shipped here plus the broader curated landscape.

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

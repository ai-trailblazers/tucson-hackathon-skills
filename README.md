# Hackathon Skills

An open-source, curated directory of [Claude Code skills](https://docs.claude.com/en/docs/claude-code/skills) for AI Trailblazers hackathon teams — and free for anyone running a similar event.

Currently powering the **Social Impact HackAIthon — San Diego** (Aug 1–2, 2026).

> **The premise:** Teams work *alongside* AI teammates (Landing Pages, Sales, Marketing, Product, Research, Content, Dev). Winning teams aren't measured on pitch decks — they're measured on what they actually moved over the weekend. These skills exist to compress the distance between an idea and something real.

**One repo, every event.** The plugins are event-agnostic: your API key tells the leaderboard which hackathon you're at, and the skills discover that event's milestone categories and board URL from the server. Nothing here is hard-coded to a particular hackathon.

## Quick start

This repo is a **Claude Code plugin marketplace**. Add it once, then install whichever role plugins your team needs — no copying files.

```text
# 1. Add the marketplace (run inside Claude Code)
/plugin marketplace add ai-trailblazers/hackathon-skills

# 2. Install the REQUIRED telemetry plugin first
/plugin install telemetry@hackathon-skills

# 3. Install any role plugins your team needs
/plugin install product@hackathon-skills
/plugin install research@hackathon-skills
/plugin install ngrok@hackathon-skills
# ...etc

# 4. Keep it current
/plugin marketplace update hackathon-skills
```

Each role is one plugin. Installing it brings in every skill for that role; Claude triggers them by description, or invoke directly as `/role:skill-name`.

### Hackathon telemetry setup (one-time, per team)

Teams playing for the live leaderboard need their event's shared API key, which is in the Participant Guide. Set it in your shell **before** running `/hackathon-setup`:

```bash
# Add to ~/.zshrc or ~/.bashrc
export HACKATHON_API_KEY="<paste the value from your Participant Guide>"
export HACKATHON_API="https://aitrailblazers.org/api/leaderboard"
```

The key is the only thing you configure. It identifies which hackathon you're at, and everything else — event name, milestone categories, board URL — is discovered from the server.

Then inside Claude Code:

```
/hackathon-setup
```

This registers your team with the central leaderboard so your milestones show up on the big screen. `/hackathon-setup` prints your event's board URL when it finishes; for San Diego that's https://aitrailblazers.org/hackathon-sd/leaderboard.

Self-reported milestones appear on the board immediately as **pending**, and flip to score once a mentor verifies them.

## Plugins by role

Each row is an installable plugin (`<name>@hackathon-skills`). Mirrors the Brain Bridge AI teammate suite used at the hackathon.

| Plugin | What it helps you do | Skills |
|--------|---------------------|--------|
| 🎯 `telemetry` **(required)** | Discover your event, register your team, capture milestone signals, log to the leaderboard | `hackathon-setup`, `log-milestone`, `confirm-milestone` |
| 🛬 `landing-pages` | Ship a live, branded landing page in under an hour | `landing-in-an-hour` |
| 📞 `sales` | Find prospects, write outreach, run discovery calls, close payments | `pay-me-now`, `cold-outreach-sequence`, `meeting-prep` |
| 📣 `marketing` | Positioning, campaign launch, ad copy across the awareness ladder | `positioning-statement`, `campaign-launch`, `ad-copy-ladder` |
| 🧭 `product` | Hypothesis tests, discovery interviews, insight capture, lean canvas | `hypothesis-to-experiment`, `discovery-interview-prep`, `conversation-to-insight`, `populating-lean-canvas` |
| 🔬 `research` | Find customers reachable in 48h, validate a segment in 30 min | `customer-finder`, `segment-research` |
| ✍️ `content` | LinkedIn posts, blog posts, AI-tell removal | `linkedin-post`, `blog-post`, `de-ai-ify` |
| 💻 `dev` | Stripe checkout setup; pair with Anthropic bundled skills for code | `stripe-payment-link` |
| ⚙️ `operations` | Milestone tracking + 5-minute team standup | `milestone-tracker`, `daily-standup` |
| 🌐 `ngrok` | Redeem $10 credit, route LLM calls through AI Gateway, expose MCP safely | `ngrok-setup`, `ngrok-expose-service`, `ngrok-ai-gateway`, `ngrok-mcp-gateway`, `ngrok-observability` |
| 🧰 `skill-builder` | Write a new skill and PR it back here (triggers a shipped-asset milestone) | `creating-skills` |
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

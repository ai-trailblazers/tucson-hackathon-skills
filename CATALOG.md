# Skill Catalog

Curated for AI Hackathon 3 (Tucson, May 23–24, 2026). Every entry has been scouted from public sources or proposed for original authoring. Verdicts assume the user is a non-technical or semi-technical founder with 48 hours.

**Legend** — License: ✅ MIT/Apache/permissive · ⚠️ custom/restrictive · ❌ no LICENSE file (all-rights-reserved by default) · 🟦 bundled with Claude Code · 🆕 to be authored

Status: 🟢 vendored · 🟡 linked-only · 🔵 bundled (no action) · ⚪ proposed (not built yet)

---

## ⭐ Starter Pack (do these first Saturday morning)

| Order | Skill | Role | Why first |
|-------|-------|------|-----------|
| 1 | `brand-voice-generator` 🔵 | content | Bootstraps brand.json / tone-of-voice in 10 min — downstream skills consume these |
| 2 | `positioning-basics` 🟡 | marketing | Locks the audience/value statement before any copy gets written |
| 3 | `hypothesis-to-experiment` 🆕 | product | Turns the team idea into 3 parallel 4-hour experiments with kill criteria |
| 4 | `landing-in-an-hour` 🆕 | landing-pages | Ships a fake-door landing page wired to analytics + payment link |
| 5 | `pay-me-now` 🆕 | sales | Stripe Payment Link + customer handoff message in <5 min |
| 6 | `cold-outreach-sequence` 🟡 | sales | Drafts multi-touch outreach so customer convos start by lunch |
| 7 | `discovery-interview-prep` 🟡 | research | Generates the 5-question script before first customer call |

That 7-skill chain hits all four judging criteria (experiments / convos / payment / AI-teammate collab) by Saturday evening.

---

## 🛬 Landing Pages

| Skill | Source | License | Verdict | Status |
|-------|--------|---------|---------|--------|
| `frontend-design` | [anthropics/skills](https://github.com/anthropics/skills) | ✅ | Production-grade UIs without the generic-AI look | 🔵 bundled |
| `web-artifacts-builder` | anthropics/skills | ✅ | Multi-component React+Tailwind+shadcn artifacts for prototypes | 🔵 bundled |
| `theme-factory` | anthropics/skills | ✅ | Cohesive themes (color, type, components) — pairs with brand-voice-generator | 🔵 bundled |
| `homepage-audit` | [BrianRWagner/ai-marketing-claude-code-skills](https://github.com/BrianRWagner/ai-marketing-claude-code-skills/tree/main/homepage-audit) | ❌ | Conversion-focused audit of landing copy/structure — useful but needs license clarification before vendoring | 🟡 linked |
| `pinme` | [glitternetwork/pinme](https://github.com/glitternetwork/pinme) | ✅ MIT | One-command frontend deploy (IPFS) — bypasses Vercel/Netlify setup | 🟡 linked |
| `landing-in-an-hour` | original | ✅ MIT | Fake-door HTML page + analytics + CTA wired to `pay-me-now` | ⚪ to author |

## 📞 Sales

| Skill | Source | License | Verdict | Status |
|-------|--------|---------|---------|--------|
| `cold-outreach-sequence` | BrianRWagner/ai-marketing | ❌ | Multi-touch cold email/LinkedIn sequence drafter | 🟡 linked |
| `meeting-prep` | BrianRWagner/ai-marketing | ❌ | Pre-call brief on prospect/interviewee | 🟡 linked |
| `testimonial-collector` | BrianRWagner/ai-marketing | ❌ | Scripts for asking + structuring testimonials | 🟡 linked |
| `pay-me-now` | original | ✅ MIT | Stripe Payment Link + handoff message in <5 min | ⚪ to author |
| `cold-dm-batch` | original | ✅ MIT | Personalized 3-sentence DMs from a prospect CSV w/ reply tracker | ⚪ to author |
| `revenue-tracker-lite` | original | ✅ MIT | `revenue.md` with attribution to source experiment | ⚪ to author |

## 📣 Marketing

| Skill | Source | License | Verdict | Status |
|-------|--------|---------|---------|--------|
| `canvas-design` | anthropics/skills | ✅ | PNG/PDF posters, flyers, social tiles | 🔵 bundled |
| `pptx-generator` | bundled (Anthropic) | ✅ | Branded decks + LinkedIn carousels | 🔵 bundled |
| `positioning-basics` | BrianRWagner/ai-marketing | ❌ | April Dunford-style positioning statement | 🟡 linked |
| `positioning-statement` | [deanpeters/Product-Manager-Skills](https://github.com/deanpeters/Product-Manager-Skills/tree/main/skills/positioning-statement) | ⚠️ | Alt positioning generator; overlap — pick one | 🟡 linked |
| `toprank` (seo + meta-ads sub-skills) | [nowork-studio/toprank](https://github.com/nowork-studio/toprank) | ✅ MIT | SEO + Google/Meta Ads suite — paid ads in a weekend | 🟡 linked → vendor |
| `newsletter-creation-curation` | BrianRWagner/ai-marketing | ❌ | First newsletter / lead magnet | 🟡 linked |
| `slack-gif-creator` | anthropics/skills | ✅ | Slack GIFs — niche but fun | 🔵 bundled |

## 🧭 Product

| Skill | Source | License | Verdict | Status |
|-------|--------|---------|---------|--------|
| `problem-framing-canvas` | deanpeters/PM-Skills | ⚠️ | Forces clear problem statement before building | 🟡 linked |
| `lean-ux-canvas` | deanpeters/PM-Skills | ⚠️ | One-page hypothesis canvas for MVP scoping | 🟡 linked |
| `prd-development` | deanpeters/PM-Skills | ⚠️ | PRD for engineering handoff | 🟡 linked |
| `prd-sprint` | [CPTYUSHU/prd-sprint](https://github.com/CPTYUSHU/prd-sprint) | ❌ | Scattered notes → PRD; non-PM friendly | 🟡 linked |
| `brainstorming` (superpowers) | obra/superpowers | ✅ MIT | Socratic idea refinement Friday night | 🔵 bundled |
| `hypothesis-to-experiment` | original | ✅ MIT | Idea → riskiest-assumption tree → 3 cheap experiments | ⚪ to author |
| `pivot-or-persist` | original | ✅ MIT | Checkpointed pivot/persist/kill decision at hour 12/24/36 | ⚪ to author |
| `ai-teammate-log` | original | ✅ MIT | Captures human/AI division of labor — feeds T criterion | ⚪ to author |

## 🔬 Research

| Skill | Source | License | Verdict | Status |
|-------|--------|---------|---------|--------|
| `discovery-interview-prep` | deanpeters/PM-Skills | ⚠️ | Interview guide (open Qs + follow-ups) | 🟡 linked |
| `jobs-to-be-done` | deanpeters/PM-Skills | ⚠️ | JTBD extraction from transcripts | 🟡 linked |
| `tam-sam-som-calculator` | deanpeters/PM-Skills | ⚠️ | Market sizing for pitch deck | 🟡 linked |
| `company-research` | deanpeters/PM-Skills | ⚠️ | Structured competitive brief | 🟡 linked |
| `Deep-Research-skills` | [Weizhena/Deep-Research-skills](https://github.com/Weizhena/Deep-Research-skills) | ✅ MIT | Human-in-loop deep research, lower hallucination | 🟡 linked → vendor |
| `tucson-customer-finder` | original | ✅ MIT | Local venue + online community ranked list for finding 20 customers | ⚪ to author |
| `conversation-to-insight` | original | ✅ MIT | Transcript → JTBD quotes, pain score, WTP signals, pattern alarm | ⚪ to author |

## ✍️ Content

| Skill | Source | License | Verdict | Status |
|-------|--------|---------|---------|--------|
| `brand-voice-generator` | bundled | ✅ | brand.json + tone-of-voice.md generator | 🔵 bundled |
| `brand-guidelines` | anthropics/skills | ✅ | Apply brand identity rules to assets | 🔵 bundled |
| `applying-brand-guidelines` | anthropic-cookbook | ✅ | Apply existing brand PDF to generated content | 🟡 linked |
| `doc-coauthoring` | anthropics/skills | ✅ | Long-form drafting (founder updates, blog) | 🔵 bundled |
| `linkedin-authority-builder` | BrianRWagner/ai-marketing | ❌ | LinkedIn posts in founder's voice | 🟡 linked |
| `content-idea-generator` | BrianRWagner/ai-marketing | ❌ | Content angles tied to positioning + ICP | 🟡 linked |
| `de-ai-ify` | BrianRWagner/ai-marketing | ❌ | Removes AI-tells from generated copy | 🟡 linked |
| `case-study-builder` | BrianRWagner/ai-marketing | ❌ | Customer notes → case-study draft | 🟡 linked |
| `press-release` | deanpeters/PM-Skills | ⚠️ | Amazon working-backwards PR for demo day | 🟡 linked |
| `demo-day-narrative` | original | ✅ MIT | Auto-pitch from experiment/insight/revenue logs hitting all 4 criteria | ⚪ to author |

## 💻 Dev

| Skill | Source | License | Verdict | Status |
|-------|--------|---------|---------|--------|
| `webapp-testing` | anthropics/skills | ✅ | Playwright + screenshots + console — sanity check landing pages | 🔵 bundled |
| `playwright-skill` | [lackeyjb/playwright-skill](https://github.com/lackeyjb/playwright-skill) | ✅ MIT | Browser-driving validator (alt to webapp-testing) | 🟡 linked |
| `claude-api` | bundled | ✅ | If product is an LLM app — fast path with caching/model selection | 🔵 bundled |
| `mcp-client` | bundled | ✅ | Connect to Zapier, GitHub, filesystem MCP servers without writing code | 🔵 bundled |
| `feature-dev` | bundled | ✅ | Guided feature dev for semi-technical builders | 🔵 bundled |
| `pinme` | glitternetwork/pinme | ✅ MIT | One-command IPFS deploy | 🟡 linked |
| `ngrok-gateway-bootstrap` | original | ✅ MIT | Wires team to ngrok AI Gateway in <5 min — sponsor integration | ⚪ to author |

## ⚙️ Operations

| Skill | Source | License | Verdict | Status |
|-------|--------|---------|---------|--------|
| `internal-comms` | anthropics/skills | ✅ | Status updates, FAQs, team memos | 🔵 bundled |
| `docx` / `xlsx` / `pdf` | anthropics/skills | ✅ | Proposals, lead lists, invoices, signable order forms | 🔵 bundled |
| `planning-with-files` | [OthmanAdi/planning-with-files](https://github.com/OthmanAdi/planning-with-files) | ✅ MIT | Persistent markdown planning — keeps Claude on track over 36h | 🟡 linked → vendor |
| `mcp-client` (Zapier) | bundled | ✅ | Email/CRM/Slack automations without code | 🔵 bundled |

---

## 📚 Browse-the-collection links (not single skills)

- [obra/superpowers](https://github.com/obra/superpowers) — MIT — dev-process skills (mostly already bundled)
- [alirezarezvani/claude-skills](https://github.com/alirezarezvani/claude-skills) — MIT — 313+ skills, browse `marketing/landing/`, `business-growth/`, `commercial/`
- [wshobson/agents](https://github.com/wshobson/agents) — MIT — engineering agents + skills
- [hesreallyhim/awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code) — awesome-list
- [travisvn/awesome-claude-skills](https://github.com/travisvn/awesome-claude-skills) — broader awesome-list
- [VoltAgent/awesome-agent-skills](https://github.com/VoltAgent/awesome-agent-skills) — 1000+ agent skills catalog

---

## ⚠️ License caveats teams should know

- **BrianRWagner skills** (8 entries above) — no LICENSE file. Default = all rights reserved. We've **linked** them, not vendored. Before the hackathon, open issues asking for MIT/Apache; if granted, vendor for offline use.
- **deanpeters Product-Manager-Skills** (9 entries) — custom "Other" license. Read terms; safe for personal/learning use but check before commercial/derivative output.
- **CPTYUSHU/prd-sprint** — no LICENSE; treat same as BrianRWagner.
- Everything else listed (MIT, Apache, bundled): safe to vendor and use commercially.

---

## 🔢 At a glance

- **65 entries** across 8 roles
- **24 bundled** with Claude Code (no install needed)
- **22 community / link-only** (10 need license clarification)
- **11 original skills** proposed for hackathon-specific gaps
- **8 entries** safe to vendor immediately (MIT/Apache)

Coverage: every role has ≥3 entries; every judging criterion (experiments / convos / payment / AI-teammate collab) has at least one direct-fit skill.

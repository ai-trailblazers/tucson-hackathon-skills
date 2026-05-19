---
name: landing-in-an-hour
description: Use to ship a single-page fake-door landing page with analytics and a call-to-action wired to a payment or signup, in under an hour. Triggers on "build a landing page", "fake-door test", "validate demand", or "I need a page to send people to".
---

# Landing in an Hour

Ship one HTML file that tests whether anyone wants the thing — fast, no build step, no framework.

## When to use this

You have a hypothesis (see `hypothesis-to-experiment`) and need a destination for outreach traffic. A fake-door page tests demand *before* the product exists: the CTA either takes a payment, captures an email, or books a call, and you count the clicks.

## Process

### 1. Gather inputs (2 min)
Ask the user for, or infer from project files:
- The one-sentence value proposition (from positioning, if it exists)
- Target customer
- The CTA goal: **pay now**, **join waitlist**, or **book a call**
- Brand colors / `brand.json` if present — otherwise pick a clean neutral palette

### 2. Write `index.html` (single file)
One self-contained file. Inline CSS, no external build. Structure:
- **Hero** — headline = the customer's outcome, not your feature. Subhead = one sentence. Primary CTA button.
- **3 benefit blocks** — concrete, customer-language, no jargon.
- **Social proof slot** — a placeholder line ("Trusted by founders at..." or a single testimonial) clearly marked to fill later.
- **Repeat CTA** at the bottom.

Keep it honest: a fake-door page may promise a real product, but never imply it already exists if it doesn't ("Join the first cohort" not "Log in").

### 3. Wire the CTA
- **Pay now** → hand off to `pay-me-now` for a Stripe Payment Link, drop the URL on the button.
- **Waitlist** → a [Tally](https://tally.so) or [Formspree](https://formspree.io) form embed (no backend needed).
- **Book a call** → the team's Calendly/Cal.com link.

### 4. Add analytics
Insert a privacy-light analytics snippet ([Plausible](https://plausible.io) or [GoatCounter](https://goatcounter.com) — both have free tiers, one script tag). Add a custom event on the CTA click so click-through is countable. This number *is* the experiment result.

### 5. Deploy
Pick the fastest path the team can do unattended:
- `pinme` skill — one-command IPFS deploy, no account.
- Netlify Drop / Vercel — drag the file in.
- GitHub Pages — if the repo is already on GitHub.

Confirm the live URL loads on mobile before declaring done.

## Output

- `index.html` — one deployable file
- The live URL
- A note in `experiments.md`: which experiment this page serves, the CTA event name, and where to read the click count

## Handoff

- Payment CTA → `pay-me-now`
- Need copy polish / remove AI-tells → `de-ai-ify`
- Sanity-check the live page → `webapp-testing`

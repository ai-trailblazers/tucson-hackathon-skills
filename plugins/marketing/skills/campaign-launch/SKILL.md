---
name: campaign-launch
description: Plan and launch a 24-48h marketing campaign tied to one specific experiment or signup target. Picks the channels, drafts the assets, sets the kill criterion. Use when the team has a working landing page and wants to drive traffic NOW. Triggers: "launch a campaign", "drive traffic to the page", "promote our offer", "run ads". Do NOT use without a live landing page and a defined CTA — campaigns without a clear conversion target waste money.
---

# campaign-launch

Hackathon fork of `creating-campaigns`. Writes plan to `campaigns/<campaign-slug>.md` in the team's repo.

## Preconditions

Refuse to launch unless:
1. **Live landing page** with one clear CTA.
2. **Defined success metric** ("20 signups in 24h" — must be a number).
3. **Budget cap.** Even if it's $0 (organic only), name it.

## Channel picks (rank by 48h ROI)

| Channel | Best when | Cost | Speed |
|---|---|---|---|
| Personal LinkedIn post | Founder has 500+ connections in ICP | $0 | <1h to live |
| Hand-DM 20 ICP prospects | You can name them by hand | $0 | 2-3h |
| Targeted Reddit/Discord post | Active niche community exists | $0 | 1h, depends on mod |
| Tucson-local in-person (IDA, meetups) | Local-relevant product | $0 | event timing |
| Meta/Google Ads | Wide-funnel B2C or proven landing page | $50-200 | 2-4h to set up |
| Cold email (CAN-SPAM compliant) | B2B, you have a clean list | $0 | 2h |

For hackathon: default to top 3 free options. Paid ads only if landing-page conversion is already proven.

## Output

`campaigns/<slug>.md`:

```markdown
# Campaign: <name>
**Started:** <iso>
**Goal:** <e.g., 20 signups by Sunday 5pm>
**Kill criterion:** <e.g., <5 signups by Saturday 8pm → switch channel>
**Budget cap:** <$X>

## Channels
- [ ] <channel 1>: <specific action — "DM these 20 people on LinkedIn">
- [ ] <channel 2>: ...

## Assets
- Hero copy: <one sentence>
- CTA: <button text + destination URL>
- Proof: <screenshot, quote, number — what makes it credible>

## Track
- <channel>: signups attributable, ts
- ...

## Decision @ midpoint
- [ ] On track → continue
- [ ] Off track → switch to <fallback>
- [ ] Dead → kill, document why in retros.md
```

## Rules

- One CTA per campaign. Multi-CTA = mush.
- Attribution > polish. UTM tags or unique URLs per channel so you know what worked.
- Kill criterion is non-negotiable. If you'd lower the bar mid-campaign, set it lower upfront.

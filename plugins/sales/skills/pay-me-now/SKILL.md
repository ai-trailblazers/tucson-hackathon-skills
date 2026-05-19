---
name: pay-me-now
description: Use to create a Stripe Payment Link and a customer handoff message so a team can accept its first real payment in under 5 minutes. Triggers on "take a payment", "how do I get paid", "set up Stripe", "payment link", or "someone wants to buy".
---

# Pay Me Now

Get from "someone said yes" to money received, fast. A real payment is the hardest judging metric to fake — this skill removes every excuse not to ask for it.

## When to use this

A customer signaled willingness to pay, or a landing page needs a working Buy button. Use it the moment interest appears — do not wait for the product to be finished. A pre-sale is a valid, honest payment if the customer knows what they're buying and when they'll get it.

## Process

### 1. Define the offer (1 min)
Pin down with the user:
- **What** the customer gets (be specific — "the first 30-min audit call" beats "access")
- **Price** — pick a real number; round is fine
- **When** they get it — if it's a pre-sale, say so plainly
- **Refund stance** — "full refund if we don't ship by [date]" lowers the buyer's risk and is the honest default for a hackathon pre-sale

### 2. Create the Stripe Payment Link
Stripe Payment Links need only a Stripe account — no code, no website. Guide the user (Stripe is interactive, so the user clicks):
1. dashboard.stripe.com → **Payment Links** → **New link**
2. Add a product: name, the price from step 1, one-time or subscription
3. Under options, turn on **collect customer email** and **collect a phone number** — you want to be able to follow up
4. Add a post-payment confirmation message: what happens next + how to reach the team
5. Copy the link URL

If the team has no Stripe account yet, they can run in **test mode** to prove the flow, but a real payment requires activating the account (bank details). Flag this early — activation can take a few minutes of data entry.

### 3. Write the handoff message
Produce a short, sendable message (DM / email) the team pastes to the interested customer:

> Thanks [name] — here's the link to lock this in: [URL].
> You'll get [what] by [when]. If we don't deliver, full refund, no questions.
> Reply here once you've paid and I'll [next step] right away.

Keep it 3–4 lines. Confident, specific, no apologizing for charging money.

### 4. Log it
Append to `revenue.md` (create if missing):
```
| Date | Customer | Amount | Offer | Source experiment | Status |
```
Mark `pending` until Stripe confirms, then `paid`. This file feeds the demo-day narrative.

## Output

- A live Stripe Payment Link URL
- A ready-to-send handoff message
- A `revenue.md` row

## Handoff

- Put the link on a page → `landing-in-an-hour`
- Build the outreach that drives people to the link → `cold-outreach-sequence`
- Roll all payments into the pitch → `demo-day-narrative`

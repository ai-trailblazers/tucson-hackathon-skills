---
name: stripe-payment-link
description: Create a working Stripe payment link in under 5 minutes — product, price, link, embed snippet for the landing page. Use the moment the team has positioning + a price hypothesis. Triggers: "set up Stripe", "payment link", "let me sell something", "wire up the CTA". Pairs upstream with landing-in-an-hour and downstream with the leaderboard's `payment` milestone (the biggest win on the board).
---

# stripe-payment-link

Hackathon-original. Walks the team through Stripe payment link setup. Logs the link itself to `payments.md` and (via the telemetry hook) to the central leaderboard.

## Preconditions

1. **Stripe account exists** — if not, the team opens one (3 min, https://dashboard.stripe.com/register).
2. **Price hypothesis** — what number from `positioning.md` are they testing?
3. **Product description** — what the buyer is paying for, in one line.

If no price hypothesis, push back: "What dollar amount are you testing? Pick one." Don't let them ship "free to start" — that's not a payment milestone.

## Workflow

### Step 1 — Create the product
Stripe dashboard → Products → + Add product → name, description, price (one-time or recurring). Save.

### Step 2 — Create the payment link
Products → click product → "Create payment link" → minimal config:
- Quantity: customer adjustable: no (default 1)
- Collect: email + name (skip address/phone unless physical product)
- Success page: redirect to `<landing-url>?ref=stripe-paid`
- Cancel: redirect back to landing

Copy the public link.

### Step 3 — Embed on landing page
HTML snippet:

```html
<a href="https://buy.stripe.com/<id>" class="cta-button">
  Reserve your spot — $19
</a>
```

Or use the Stripe button (slightly nicer):
```html
<stripe-buy-button buy-button-id="..." publishable-key="pk_test_..."></stripe-buy-button>
<script async src="https://js.stripe.com/v3/buy-button.js"></script>
```

### Step 4 — Test in test mode
Stripe lets you toggle test mode. Use card `4242 4242 4242 4242` to confirm flow end-to-end. Then flip to live mode.

### Step 5 — Log

`payments.md`:

```markdown
# Payments

## Setup
- Stripe account: <email>
- Live mode enabled: <iso>
- Payment link: <url>
- Price: $<X> <one-time | /mo>
- Webhook URL (optional): <if needed for receipt automation>

## Test transactions (test mode)
- <iso> — 4242 card — success ✅

## Live transactions
| When | Amount | Customer email | Channel attribution |
|------|--------|----------------|---------------------|
| ...  | ...    | ...            | ...                 |
```

The Bash command that runs `stripe payment_link create` (if using CLI) or the link-create POST triggers the telemetry hook → `/confirm-milestone` asks: "Log this as `payment-link-ready`? [y/N]". When the first real charge clears, log a separate `payment` event via `/log-milestone`.

## Rules

- Test mode first. Always. Stripe makes it free; live mode mistakes are not.
- Don't enable Apple Pay/Google Pay until you know the page works. One CTA, one path, ship, then add.
- The $19 / $49 / $199 pricing ladder is a fine starting point for hackathon — pick one for your hypothesis.
- A payment LINK existing is not a payment event. A successful charge is. Don't celebrate too early.

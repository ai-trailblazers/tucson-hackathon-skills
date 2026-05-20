---
name: ngrok-setup
description: Install the ngrok CLI, authenticate, redeem the $10 hackathon credit from Joel Hans, and (optionally) reserve a stable domain so your URL doesn't change across the weekend. Use at the start of the event before any other ngrok skill runs. Triggers on "set up ngrok", "install ngrok", "redeem my ngrok credit", "claim ngrok domain", "I have an ngrok credit code", "configure ngrok authtoken". Do NOT use for actually exposing a service (use ngrok-expose-service), routing LLM calls (use ngrok-ai-gateway), or exposing MCP (use ngrok-mcp-gateway).
---

# ngrok-setup

The one-time "I have an account, get me to a working ngrok CLI" workflow for hackathon teams.

## Preconditions

The team needs:
- A free ngrok account (sign up at https://dashboard.ngrok.com/signup)
- The **$10 credit code** from Joel Hans (handed out at the event)

If either is missing, pause and tell the team what to grab first.

## Workflow

### 1. Install the CLI

Detect OS and run the right command:

```bash
# macOS
brew install ngrok

# Linux
curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
  && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list \
  && sudo apt update && sudo apt install ngrok

# Windows (PowerShell)
choco install ngrok
```

Verify: `ngrok version`.

### 2. Add the auth token

Get it at https://dashboard.ngrok.com/get-started/your-authtoken (the team must be signed in).

```bash
ngrok config add-authtoken <TOKEN>
```

Verify: `ngrok config check` should print no errors.

### 3. Redeem the $10 credit

Open https://dashboard.ngrok.com/billing/credits in the team's browser. Paste the code Joel handed out. Confirm $10 shows in their balance.

Without the credit, the team still gets the free tier (3 endpoints, 1 GB transfer, 20k HTTP requests, one assigned dev domain). The credit unlocks managed AI Gateway calls — see `ngrok-ai-gateway` for what that buys.

### 4. (Optional) Reserve a stable domain

The free tier gives every account one auto-assigned dev domain (e.g. `something-random.ngrok-free.dev`). It's stable across sessions for that account. You don't need to reserve anything unless the team wants a vanity URL.

If they do want a vanity URL:
1. Open https://dashboard.ngrok.com/domains
2. Click "+ New Domain", pick a name like `team-pixel-pirates`
3. Confirm — they'll get `team-pixel-pirates.ngrok.app` reserved to their account

Note: custom apex domains (e.g. `pixelpirates.com`) require a paid plan and are out of scope for the hackathon.

### 5. Save what you got

Write `ngrok-account.md` in repo root (gitignore it — contains identifiers):

```markdown
# ngrok account

- Account email: <team email>
- Auth token: stored in `~/.config/ngrok/ngrok.yml` (do not paste here)
- Credit balance: $10.00 redeemed <YYYY-MM-DD>
- Dev domain: <something>.ngrok-free.dev
- Reserved domain (optional): <team-name>.ngrok.app
```

## What to do next

- Want to expose a regular web app to the internet? → `ngrok-expose-service`
- Want to route LLM calls through the gateway (use the $10 credit)? → `ngrok-ai-gateway`
- Want to expose an MCP server to Claude or another agent? → `ngrok-mcp-gateway`
- Want to see what's hitting your tunnel? → `ngrok-observability`

## Anti-patterns

- Pasting the auth token into anything other than `ngrok config add-authtoken` (it ends up in shell history; rotate if you do)
- Skipping the credit redemption if the team plans to use the AI Gateway — you'll get rate-limited fast on the free tier
- Reserving a domain you can't remember; pick something tied to the team name

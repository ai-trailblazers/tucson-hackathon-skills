---
name: ngrok-expose-service
description: Expose a regular local web service (not an MCP server, not an LLM proxy) to the public internet via ngrok, optionally with OAuth or rate limits. For the actual ngrok http command + Traffic Policy mechanics, defers to the official ngrok/agent-skills repo. Use for "expose my app", "ngrok tunnel my dev server", "make localhost:3000 public", "share my Streamlit demo", "put OAuth on my dev tunnel". Do NOT use for routing LLM calls (use ngrok-ai-gateway) or exposing MCP servers (use ngrok-mcp-gateway).
---

# ngrok-expose-service

This is a thin pointer skill. The official `ngrok/agent-skills` repo already has a comprehensive `expose-localhost` skill that handles `ngrok http`, OAuth (Google / GitHub / Microsoft / GitLab / LinkedIn / Twitch), OWASP CRS, rate limits, port detection, and dev-domain assignment. Reimplementing it would just drift.

## When this skill triggers

Anything that's "I have a regular web app on localhost, make it public" — Streamlit demo, Next.js dev server, Flask app, a static page being served, etc.

## What this skill does

1. **Verify ngrok is set up** — if `ngrok config check` fails, route to `ngrok-setup` first.

2. **Install the official skill** if the team doesn't already have it:

   ```bash
   # Standalone install via npx
   npx skills add ngrok/agent-skills
   ```

   That makes the `expose-localhost` skill available to Claude Code on the team's machine.

3. **Delegate to it.** Just tell Claude: "use the expose-localhost skill from ngrok/agent-skills to tunnel port <N> with <auth setup>". It will:
   - Detect the port from `package.json` / `.env` / `docker-compose.yml`
   - Ask whether the team wants OAuth or open access
   - Run `ngrok http <port>` with the right flags
   - Print the public URL

4. **Log the tunnel** — once the public URL is live, append to `ngrok-tunnels.md` in repo root (gitignored):

   ```markdown
   ## <YYYY-MM-DD HH:MM> — <service>
   - URL: https://<something>.ngrok-free.dev
   - Local port: 3000
   - Auth: <none | basic-auth | OAuth-google-email-domain-X>
   - Started by: <teammate>
   - Kill: Ctrl-C in the terminal running ngrok, OR `ngrok api endpoints delete <id>`
   ```

## When to escalate from this skill

- The team wants to use the **$10 credit** for LLM routing → use `ngrok-ai-gateway` instead
- The team is exposing an **MCP server** → use `ngrok-mcp-gateway` instead (needs different Traffic Policy)
- The team wants **PII redaction** or other request-body rewriting → see `ngrok-ai-gateway` references (the recipes there apply to any endpoint)
- The team wants to **inspect** what's coming through → `ngrok-observability`

## Anti-patterns

- Exposing a service with no auth and walking away from your laptop (anyone on the internet can hit it; ngrok URLs get scanned within minutes of going live)
- Leaving tunnels running overnight (eats free-tier request quota; for paid usage eats credit)
- Sharing the public URL via Slack/Discord public channels (search engines crawl those)

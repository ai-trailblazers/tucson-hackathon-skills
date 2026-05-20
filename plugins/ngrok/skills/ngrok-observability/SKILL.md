---
name: ngrok-observability
description: Inspect the actual traffic hitting your ngrok endpoints — prompts and responses through AI Gateway, MCP tool calls, plain HTTP requests. See per-request token counts, dashboard latency, and multi-step agent sessions. Use when debugging "why did the gateway pick that model", "show me the prompt my agent sent", "how much credit have we burned", "what's hitting my MCP server". Triggers on "ngrok traffic inspector", "see my prompts", "check token spend", "ngrok logs", "ngrok observability", "agent session tracking". Do NOT use for setting things up (use ngrok-setup) or fixing failed requests (use the troubleshooting sections of ngrok-ai-gateway / ngrok-mcp-gateway).
---

# ngrok-observability

Where to look + what to look for. No setup needed — observability is on by default on every ngrok endpoint.

## The three places to look

### 1. Traffic Inspector (every endpoint)

https://dashboard.ngrok.com/observability/traffic-inspector

Shows every request that hit your tunnel. Per request:
- Full request body (the prompt, the tool-call payload, etc.)
- Full response body (the completion, the streamed tokens reassembled)
- Latency breakdown
- Which Traffic Policy rules fired
- Client IP + classification (e.g., `com.anthropic.api`)

Free tier: limited retention (typically 24 hours rolling). Plenty for a 48-hour hackathon.

### 2. AI Gateway metrics (AI Gateway endpoints only)

https://dashboard.ngrok.com/ai-gateway/metrics

Shows per provider, per model:
- Request count
- Input + output tokens
- Cost (against your $10 credit)
- Which model the selector picked
- Failover attempts (which model was tried first vs which actually responded)

This is how you answer "how much credit have we burned" and "why does my code keep getting GPT-4o-mini when I asked for `ngrok/auto`."

### 3. Session tracking (multi-step agent workflows)

https://dashboard.ngrok.com/observability/sessions

Shipped April 2026. Groups related requests by session ID. Useful when your agent makes 5 LLM calls and 3 MCP tool calls to answer one user question — you can see the whole chain.

To use it, your agent code should set a header on every outbound call:

```python
client.chat.completions.create(
    model="ngrok/auto",
    messages=[...],
    extra_headers={"X-Session-Id": session_id},
)
```

ngrok will group requests with the same `X-Session-Id` across both AI Gateway and any MCP endpoints.

## Quick diagnostic commands

```bash
# Last 20 requests to a specific endpoint
ngrok api endpoints list
ngrok api requests list --endpoint <endpoint-id> --limit 20

# Replay a captured request (useful for debugging Traffic Policy)
ngrok api requests replay <request-id>

# Get the captured payload of a request
ngrok api requests get <request-id>
```

## What to grep for in the dashboard

| Looking for | Where | Filter |
|---|---|---|
| Why a request was denied | Traffic Inspector | Status code 403 / 401, expand to see policy rules fired |
| Slow LLM responses | AI Gateway metrics | Sort by p95 latency, group by model |
| Provider was down | AI Gateway metrics | Look for failover-attempt rows |
| Token spend by team feature | AI Gateway metrics | Filter by `X-Team` header if you set one |
| MCP tool that's getting hammered | Traffic Inspector on the MCP endpoint | Group by request body path |
| Auth issues | Traffic Inspector | Filter status 401 / 403 |

## Anti-patterns

- Relying on Traffic Inspector for production audit logs — 24h retention is fine for debugging, not for compliance
- Putting customer PII through the gateway without `request-body-find-replace` redaction — the dashboard captures bodies, so anyone with dashboard access sees the raw prompt
- Polling `ngrok api requests list` in a tight loop — use the dashboard or a single targeted query; ngrok's API has its own rate limits

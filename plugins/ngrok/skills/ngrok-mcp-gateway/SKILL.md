---
name: ngrok-mcp-gateway
description: Expose a local MCP (Model Context Protocol) server to Claude or another AI agent through an ngrok endpoint, with a Traffic Policy that restricts access to Anthropic's IP range, requires an auth header, and rate-limits per caller. Use when a team is building an MCP server and wants Claude.ai or Claude Code on someone else's machine to reach it safely. Triggers on "expose my MCP server", "MCP behind ngrok", "lock MCP to Anthropic", "publish my MCP tools", "MCP gateway", "ngrok mcp". Do NOT use for plain HTTP services (use ngrok-expose-service) or LLM API routing (use ngrok-ai-gateway).
---

# ngrok-mcp-gateway

Putting an MCP server behind ngrok with a hardened Traffic Policy. The hackathon-relevant pattern is: only Anthropic's edge can reach the tunnel, every request carries an auth bearer, traffic is rate-limited per token. This skill walks you through the setup and ships a copy-paste Traffic Policy.

## Preconditions

- `ngrok-setup` done
- A local MCP server running on a known port (HTTP transport — stdio MCP servers need to be wrapped first)
- (Optional) a reserved domain — recommended so the URL stays the same across restarts

## Workflow

### 1. Confirm the MCP server speaks HTTP

```bash
curl http://localhost:<port>/  # should return MCP handshake, not 404
```

If your MCP server is stdio-only (the default for many), wrap it in an HTTP shim first. Tools like `mcp-bridge` or `supergateway` can do that.

### 2. Write the Traffic Policy

Save as `ngrok-policies/mcp-gateway.yml` in your repo. The full hardened version is in `references/anthropic-allowlist.yml`. Short version:

```yaml
on_http_request:
  # Reject anything not from Anthropic's edge
  - expressions:
      - "!('com.anthropic.api' in conn.client_ip.categories)"
    actions:
      - type: deny
        config:
          status_code: 403

  # Require an Authorization header
  - expressions:
      - "!hasReqHeader('Authorization')"
    actions:
      - type: deny
        config:
          status_code: 401

  # Rate-limit per token: 100 requests / 60s.
  # Note: ngrok requires `rate` to be at least 60s and a multiple of 10s.
  - actions:
      - type: rate-limit
        config:
          algorithm: sliding_window
          capacity: 100
          rate: 60s
          bucket_key:
            - "getReqHeader('Authorization')[0]"

  # Forward to the local MCP server
  - actions:
      - type: forward-internal
        config:
          url: http://localhost:<port>
```

Replace `<port>` with the actual MCP server port.

### 3. Pick a bearer token your MCP server will require

Generate one your team controls:

```bash
openssl rand -hex 24
# Save as MCP_BEARER in .env (gitignored)
```

Your MCP server should validate `Authorization: Bearer $MCP_BEARER` on every request. That's a second line of defense in case the Anthropic IP allowlist ever leaks.

### 4. Start the tunnel with the policy attached

```bash
# Without reserved domain (uses your dev domain)
ngrok http <port> --traffic-policy-file ngrok-policies/mcp-gateway.yml

# With reserved domain (recommended)
ngrok http <port> \
  --url https://<team>.ngrok.app \
  --traffic-policy-file ngrok-policies/mcp-gateway.yml
```

Note: ngrok recently deprecated the `--domain` flag in favor of `--url`. If your CLI still accepts `--domain`, it works but emits a deprecation warning.

Capture the public URL.

### 5. Hand the URL + token to Claude

In Claude Code or Claude.ai, add the MCP server with:

```json
{
  "mcpServers": {
    "<team-server-name>": {
      "url": "https://<team>.ngrok.app",
      "transport": "streamable-http",
      "headers": {
        "Authorization": "Bearer <MCP_BEARER>"
      }
    }
  }
}
```

If your MCP server is built against the older HTTP+SSE transport (deprecated March 2025), set `"transport": "sse"` instead. New MCP servers should ship Streamable HTTP.

### 6. Smoke test

From inside Claude Code on a different machine:

```
List the tools available from <team-server-name>
```

If the connection is rejected, see Troubleshooting below.

### 7. Log it

Append to `ngrok-tunnels.md` in repo root (gitignored):

```markdown
## MCP Gateway — <started YYYY-MM-DD HH:MM>
- URL: https://<team>.ngrok.app
- Local MCP port: <port>
- Policy: ngrok-policies/mcp-gateway.yml
- Bearer token: stored in .env as MCP_BEARER (rotated <date> if applicable)
- Owner: <teammate>
- Kill: Ctrl-C in tunnel terminal, OR `ngrok api endpoints delete <id>`
```

## Troubleshooting

| Symptom | Likely cause | Fix |
|---|---|---|
| `403 Anthropic-only endpoint` from your own laptop | Your IP isn't Anthropic's — that's the policy working as intended | Test from Claude.ai or Claude Code itself, not curl from your local box |
| `401` from Claude | Missing or wrong bearer | Confirm `Authorization` header in MCP client config |
| 429 from Claude after a few calls | Rate limit hit | Bump `capacity` in the policy, redeploy tunnel |
| `forward-internal` connection refused | Local MCP server isn't running on `<port>` | Start it, retry |

## Anti-patterns

- Skipping the Authorization check ("Anthropic IP allowlist is enough") — Anthropic shares IPs across all customers; without the bearer anyone using Claude.ai could hit your server
- Hardcoding the bearer in source — gitignore the `.env` file, use a secrets manager for prod
- Forwarding to a server that does writes you haven't audited — once a Claude session can call your MCP, it can spam tool calls; rate-limit is your friend
- Leaving an MCP tunnel running after the demo — `ngrok api endpoints delete` when you're done

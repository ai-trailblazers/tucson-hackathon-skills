---
name: ngrok-ai-gateway
description: Route OpenAI, Anthropic, or self-hosted LLM calls through ngrok's AI Gateway. Use the $10 hackathon credit (managed mode) or bring your own provider keys (BYOK mode). Configure automatic failover, cost-based model selection via CEL expressions, native Anthropic SDK support (preserves prompt caching + extended thinking + beta headers), and per-request input-token caps. Triggers on "route LLM through ngrok", "use my ngrok credit for OpenAI", "use my ngrok credit for Claude", "set up failover between OpenAI and Anthropic", "cheapest model routing", "AI Gateway", "ngrok/auto model", "byok ngrok", "Anthropic SDK with ngrok". Do NOT use for plain tunnels (use ngrok-expose-service) or MCP servers (use ngrok-mcp-gateway).
---

# ngrok-ai-gateway

The AI Gateway is a managed router for LLM API calls. Your code talks to one ngrok endpoint; the gateway handles auth, failover, cost-based routing, and provider quirks. This skill walks you through three setup paths and shows the SDK snippets your app needs.

## Preconditions

- `ngrok-setup` is done (CLI installed, authtoken set)
- If using managed credits: the $10 credit is redeemed
- If using BYOK: you have at least one provider API key (OpenAI `sk-...` or Anthropic `sk-ant-...`)

## Pick the right mode

| You have... | Use mode | Why |
|---|---|---|
| The $10 credit, no provider accounts | **Managed** | Zero-signup multi-provider, immediate start |
| OpenAI key + Anthropic key already | **BYOK** | Keep using your own quota, but gain routing + observability |
| Both | **BYOK with credit fallback** | Provider keys for normal traffic, credit when keys exhaust |

## Mode 1: Managed credits (fastest path)

The gateway holds provider keys; you call ngrok and pay from your credit balance.

### Create an AI Gateway API key

```bash
ngrok api ai-gateway-api-keys create \
  --description "Hackathon team key"
# Returns: ng-xxxxx-g1-xxxxx-xxxxx
```

Save the returned key as `NGROK_AI_KEY` in your env.

### Use it from OpenAI SDK

```python
from openai import OpenAI

client = OpenAI(
    base_url="https://<your-gateway>.ngrok.app/v1",
    api_key=os.environ["NGROK_AI_KEY"],
)
resp = client.chat.completions.create(
    model="ngrok/auto",  # let the gateway pick a working model
    messages=[{"role": "user", "content": "Hello"}],
)
```

### Use it from Anthropic SDK (native support, preserves prompt caching)

```python
import anthropic

client = anthropic.Anthropic(
    base_url="https://<your-gateway>.ngrok.app",
    api_key=os.environ["NGROK_AI_KEY"],
)
resp = client.messages.create(
    model="claude-sonnet-4-6",  # or "ngrok/auto"
    max_tokens=1024,
    messages=[{"role": "user", "content": "Hello"}],
)
```

The native Anthropic adapter preserves: prompt caching, extended thinking, beta headers, tool use, streaming. Caveat: Anthropic SDK requests can only failover to Claude-compatible providers.

## Mode 2: BYOK (your own provider keys)

Attach your OpenAI / Anthropic keys to a gateway key so client code never sees the provider secret.

```bash
# Create the gateway key first
ngrok api ai-gateway-api-keys create --description "Team key"
# Returns aigk_xxxxx

# Attach an OpenAI key
ngrok api ai-gateway-provider-keys create \
  --ai-gateway-api-key-id aigk_xxxxx \
  --provider-id openai \
  --value "sk-..."

# Attach an Anthropic key
ngrok api ai-gateway-provider-keys create \
  --ai-gateway-api-key-id aigk_xxxxx \
  --provider-id anthropic \
  --value "sk-ant-..."
```

Client code looks identical to Mode 1 — same `base_url`, same `NGROK_AI_KEY`.

## Smart routing recipes (Traffic Policy)

See `references/model-selection.md` for the full Traffic Policy YAML snippets. Common ones:

### Cheapest model first

```yaml
on_http_request:
  - actions:
      - type: ai-gateway
        config:
          model_selection:
            strategy: |
              ai.models
                .filter(m, m.capabilities.contains('chat'))
                .sortBy(m, m.pricing.input)
```

### Anthropic-only with fallback inside the family

```yaml
- type: ai-gateway
  config:
    model_selection:
      strategy: |
        ai.models.filter(m, m.provider_id == 'anthropic')
```

### Input-token cap (cheap guardrail)

```yaml
- type: ai-gateway
  config:
    max_input_tokens: 4000
```

### PII redaction before the prompt hits the provider

```yaml
- type: request-body-find-replace
  config:
    replacements:
      - from: "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}"
        to: "[EMAIL]"
      - from: "\\b\\d{3}-\\d{2}-\\d{4}\\b"
        to: "[SSN]"
```

## What to log

After setup, append to `ai-gateway.md` in repo root (gitignored):

```markdown
# AI Gateway

- Mode: managed | byok
- Gateway URL: https://<endpoint>.ngrok.app
- Gateway API key: stored in .env as NGROK_AI_KEY (never commit)
- Default model: ngrok/auto | claude-sonnet-4-6 | gpt-4.1
- Traffic policy file: ./ngrok-policies/ai-gateway.yml (if used)
- Credit balance at last check: $<X> on <date>
```

## What to do next

- See your prompts + token counts in the dashboard → `ngrok-observability`
- Expose an MCP server → `ngrok-mcp-gateway`

## Anti-patterns

- Hardcoding the OpenAI / Anthropic keys in code when BYOK on the gateway gives you free secret management
- Calling `model="ngrok/auto"` in production without an explicit fallback model named (auto is a hackathon convenience; flake risk in prod)
- Not setting `max_input_tokens` — a runaway prompt eats the credit
- Putting `NGROK_AI_KEY` in committed `.env` files (use `.env.local` or your shell env)

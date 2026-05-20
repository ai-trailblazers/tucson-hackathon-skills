# ngrok AI Gateway — Provider Keys reference

Quick reference for managing provider keys on AI Gateway API keys.

## List your gateway keys

```bash
ngrok api ai-gateway-api-keys list
```

## List provider keys attached to a gateway key

```bash
ngrok api ai-gateway-provider-keys list --ai-gateway-api-key-id <gateway-key-id>
```

## Rotate a provider key

```bash
# Delete the old one
ngrok api ai-gateway-provider-keys delete <provider-key-id>

# Create the new one
ngrok api ai-gateway-provider-keys create \
  --ai-gateway-api-key-id <gateway-key-id> \
  --provider-id openai \
  --value "sk-new..."
```

## Reference provider keys from Traffic Policy

Inside Traffic Policy YAML, use secret refs:

```yaml
- type: ai-gateway
  config:
    provider_keys:
      openai: "${secrets.get('openai', 'key')}"
      anthropic: "${secrets.get('anthropic', 'key')}"
```

You can store secrets centrally in the ngrok dashboard under Settings → Secrets, then reference them across policies.

## Supported providers

As of 2026-05:

**Managed mode (gateway holds keys, billed from your $10 credit):**
- `openai` — GPT-4.1, GPT-4o, o1, o3, o4 families
- `anthropic` — Claude Opus, Sonnet, Haiku families (4.x)

**BYOK mode (you attach your own keys):**
- `openai`, `anthropic`, plus `google` (Gemini), `deepseek`
- Self-hosted OpenAI-compatible endpoints (Ollama, vLLM, etc.) — configurable via custom provider config

Planned (per the AI Gateway blog): native managed support for additional providers including `minimax`.

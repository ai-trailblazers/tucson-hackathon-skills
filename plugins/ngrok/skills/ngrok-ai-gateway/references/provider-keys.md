# ngrok AI Gateway — Provider Keys reference

Quick reference for managing provider keys on AI Gateway API keys.

## List your gateway keys

```bash
ngrok api ai-gateway-api-keys list
```

## List provider keys attached to a gateway key

```bash
ngrok api ai-gateway-provider-keys list --ai-gateway-api-key-id aigk_xxxxx
```

## Rotate a provider key

```bash
# Delete the old one
ngrok api ai-gateway-provider-keys delete <provider-key-id>

# Create the new one
ngrok api ai-gateway-provider-keys create \
  --ai-gateway-api-key-id aigk_xxxxx \
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
- `openai` — GPT-4.1, GPT-4o, o1, o3, o4 families
- `anthropic` — Claude Opus, Sonnet, Haiku families (4.x)
- `ollama` — self-hosted, via custom provider config
- `vllm` — self-hosted, via custom provider config

Planned: `google` (Gemini), `minimax`.

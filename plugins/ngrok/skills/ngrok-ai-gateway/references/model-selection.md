# ngrok AI Gateway — Model Selection recipes

CEL expressions for picking which model handles a request. Drop these into a Traffic Policy YAML under `model_selection.strategy`.

## Available variables

- `ai.models` — list of all models the gateway can route to, given the provider keys you've attached
- Each model exposes: `id`, `provider_id`, `capabilities` (chat / vision / tools / etc.), `pricing.input`, `pricing.output`, `context_window`

## Common recipes

### `ngrok/auto` — let the gateway decide

In your SDK call, set `model: "ngrok/auto"`. No policy needed. Good for hackathon speed; not for prod.

### Cheapest chat model with vision

```yaml
on_http_request:
  - actions:
      - type: ai-gateway
        config:
          model_selection:
            strategy: |
              ai.models
                .filter(m, m.capabilities.contains('chat') && m.capabilities.contains('vision'))
                .sortBy(m, m.pricing.input)
```

### Cheapest under N input tokens, fall back to bigger context

```yaml
strategy: |
  ai.models
    .filter(m, m.context_window >= request.input_tokens)
    .sortBy(m, m.pricing.input)
```

### Anthropic family only (preserves prompt caching)

```yaml
strategy: |
  ai.models.filter(m, m.provider_id == 'anthropic')
```

### Self-hosted first, cloud fallback

```yaml
strategy: |
  ai.models
    .filter(m, m.provider_id == 'ollama' || m.provider_id == 'anthropic')
    .sortBy(m, m.provider_id == 'ollama' ? 0 : 1)
```

### Per-team routing (different keys → different models)

```yaml
on_http_request:
  - expressions: ["getReqHeader('x-team')[0] == 'pixel-pirates'"]
    actions:
      - type: ai-gateway
        config:
          model_selection:
            strategy: "ai.models.filter(m, m.provider_id == 'anthropic')"
  - actions:
      - type: ai-gateway
        config:
          model_selection:
            strategy: "ai.models.filter(m, m.provider_id == 'openai')"
```

## Failover behavior

When the first selected model fails, the gateway walks the sorted list. Configure timeouts:

```yaml
- type: ai-gateway
  config:
    per_request_timeout: "3m"
    total_timeout: "6m"
    model_selection:
      strategy: "ai.models.sortBy(m, m.pricing.input)"
```

If every model in the list fails, the client gets a single 503. Set `total_timeout` shorter than your client's own timeout so retries don't dogpile.

## Debugging selections

In the ngrok dashboard → Traffic Inspector → AI Gateway calls — each request shows which model was actually selected, why, and any failover attempts. See `ngrok-observability`.

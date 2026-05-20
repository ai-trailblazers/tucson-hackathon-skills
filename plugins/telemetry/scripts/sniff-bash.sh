#!/usr/bin/env bash
# PostToolUse hook for Bash. Reads JSON from stdin per Claude Code hook contract.
# Sniffs the executed command for milestone signals. Appends to ~/.hackathon/.sniff-queue.
# Never auto-logs. confirm-milestone skill drains the queue and asks the team.
set -euo pipefail

QUEUE="$HOME/.hackathon/.sniff-queue"
SKIP="$HOME/.hackathon/.skip-cache"
mkdir -p "$HOME/.hackathon"
touch "$QUEUE" "$SKIP"

INPUT=$(cat)
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // ""' 2>/dev/null || echo "")
[[ -z "$CMD" ]] && exit 0

now=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

emit() {
  local signal="$1"
  local evidence="$2"
  # 5-min skip cache by signal type
  local last_skip
  last_skip=$(grep -E "^$signal\s" "$SKIP" 2>/dev/null | tail -1 | awk '{print $2}')
  if [[ -n "$last_skip" ]]; then
    local age=$(( $(date -u +%s) - $(date -u -j -f "%Y-%m-%dT%H:%M:%SZ" "$last_skip" +%s 2>/dev/null || echo 0) ))
    [[ "$age" -lt 300 ]] && exit 0
  fi
  jq -nc --arg s "$signal" --arg t "Bash" --arg e "$evidence" --arg ts "$now" \
    '{signal:$s, tool:$t, evidence:$e, ts:$ts}' >> "$QUEUE"
  echo "[hackathon-telemetry] Detected $signal — /confirm-milestone will ask before logging." >&2
}

# Stripe payment link creation
if echo "$CMD" | grep -qiE 'stripe[^|;&]*payment[_ -]?link|stripe[^|;&]*create'; then
  emit "stripe_payment_link" "$(echo "$CMD" | head -c 200)"
fi

# Deploy detection
if echo "$CMD" | grep -qiE '\b(vercel|netlify|pinme|gh-pages|cloudflare pages|wrangler.*deploy|firebase deploy)\b'; then
  emit "deploy_detected" "$(echo "$CMD" | head -c 200)"
fi

# PR opened against shared skills repo
if echo "$CMD" | grep -qiE 'gh pr create.*tucson-hackathon-skills'; then
  emit "skill_published" "$(echo "$CMD" | head -c 200)"
fi

exit 0

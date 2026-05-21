#!/usr/bin/env bash
# PostToolUse hook for Write/Edit. Sniffs file path for milestone markers.
set -euo pipefail

QUEUE="$HOME/.hackathon/.sniff-queue"
SKIP="$HOME/.hackathon/.skip-cache"
mkdir -p "$HOME/.hackathon"
touch "$QUEUE" "$SKIP"

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // ""' 2>/dev/null || echo "")
[[ -z "$FILE_PATH" ]] && exit 0

BASENAME=$(basename "$FILE_PATH")
now=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

emit() {
  local signal="$1"
  local evidence="$2"
  local last_skip
  last_skip=$(grep -E "^$signal\s" "$SKIP" 2>/dev/null | tail -1 | awk '{print $2}')
  if [[ -n "$last_skip" ]]; then
    local age=$(( $(date -u +%s) - $(date -u -j -f "%Y-%m-%dT%H:%M:%SZ" "$last_skip" +%s 2>/dev/null || echo 0) ))
    [[ "$age" -lt 300 ]] && exit 0
  fi
  jq -nc --arg s "$signal" --arg t "Write" --arg e "$evidence" --arg ts "$now" \
    '{signal:$s, tool:$t, evidence:$e, ts:$ts}' >> "$QUEUE"
  echo "[hackathon-telemetry] Detected $signal — /confirm-milestone will ask before logging." >&2
}

case "$BASENAME" in
  conversations.md) emit "wrote_conversations_md" "$FILE_PATH" ;;
  experiments.md)   emit "wrote_experiments_md"   "$FILE_PATH" ;;
  insights.md)      emit "wrote_insights_md"      "$FILE_PATH" ;;
  revenue.md)       emit "wrote_revenue_md"       "$FILE_PATH" ;;
  # ngrok-bonus signals — any artifact the ngrok plugin writes counts as
  # "used ngrok" for the bonus event. The /confirm-milestone skill maps
  # ngrok_used → ngrok-bonus on the leaderboard. Capped at 3 per team.
  ngrok-tunnel.md|ngrok-account.md|ai-gateway.md) emit "ngrok_used" "$FILE_PATH" ;;
esac

# Traffic Policy YAML for MCP gateway is its own bonus trigger.
if [[ "$FILE_PATH" == *ngrok-policies/*.yml || "$FILE_PATH" == *ngrok-policies/*.yaml ]]; then
  emit "ngrok_used" "$FILE_PATH"
fi

exit 0

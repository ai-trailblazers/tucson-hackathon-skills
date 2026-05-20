#!/usr/bin/env bash
# SessionStart hook. If team.json missing, emit a stderr nudge so the assistant
# offers to run /hackathon-setup. Never blocks.
set -euo pipefail

TEAM_FILE="$HOME/.hackathon/team.json"

if [[ ! -f "$TEAM_FILE" ]]; then
  cat <<'EOF' >&2
[hackathon-telemetry] No team registration found.
Run /hackathon-setup to register your team and start scoring milestones on the leaderboard.
EOF
  exit 0
fi

TEAM_ID=$(jq -r '.team_id // "UNKNOWN"' "$TEAM_FILE" 2>/dev/null || echo "UNKNOWN")
echo "[hackathon-telemetry] Registered as $TEAM_ID. Logging to aitrailblazers.org/api/leaderboard." >&2
exit 0

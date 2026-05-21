#!/usr/bin/env bash
# watch_and_sync.sh – automatically sync agents and SKILL.md to Articles‑AG repo
# Requires inotify-tools (inotifywait). Install with: sudo apt-get install inotify-tools

SOURCE_AGENTS="/home/nikhil/.gemini/antigravity/agents"
SOURCE_SKILL="/home/nikhil/.gemini/antigravity/skills/Article_flow/SKILL.md"
TARGET_ROOT="/home/nikhil/AG-Projects/Articles-AG/.opencode"

# Function to perform sync (same as sync_agents.sh)
sync_repo() {
  echo "[$(date)] Syncing agents and SKILL.md..."
  cp "$SOURCE_AGENTS"/*.md "$TARGET_ROOT/agents/"
  cp "$SOURCE_SKILL" "$TARGET_ROOT/"
  cd /home/nikhil/AG-Projects/Articles-AG || exit 1
  git add .
  git commit -m "Auto‑sync latest agents & SKILL.md"
  git push origin main
  echo "[$(date)] Sync complete."
}

# Initial sync at start
sync_repo

# Watch for changes in the agents directory or the SKILL.md file
while true; do
  inotifywait -e modify,create,delete -r "$SOURCE_AGENTS" "$SOURCE_SKILL" >/dev/null 2>&1
  # Debounce: wait a short moment for multiple rapid events
  sleep 2
  sync_repo
done

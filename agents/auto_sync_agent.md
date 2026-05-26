# Auto‑Sync Agent

## Purpose
This agent continuously watches the source **agents** directory and the central **SKILL.md** file for any changes. When a modification is detected, it copies the latest files into the `Articles‑AG` repository, stages, commits, and pushes them to the `main` branch.

## Implementation (Bash)
```bash
#!/usr/bin/env bash

# Paths (adjust if your workspace layout changes)
SOURCE_AGENTS="/home/nikhil/.gemini/antigravity/agents"
SOURCE_SKILL="/home/nikhil/.gemini/antigravity/skills/Article_flow/SKILL.md"
TARGET_ROOT="/home/nikhil/AG-Projects/Articles-AG/.opencode"

sync_repo() {
  echo "[$(date)] Syncing agents and SKILL.md…"
  cp "$SOURCE_AGENTS"/*.md "$TARGET_ROOT/agents/"
  cp "$SOURCE_SKILL" "$TARGET_ROOT/"
  cd /home/nikhil/AG-Projects/Articles-AG || exit 1
  git add .
  git commit -m "Auto‑sync latest agents & SKILL.md"
  git push origin main
  echo "[$(date)] Sync complete."
}

# Initial sync on start
sync_repo

# Watch for changes using inotifywait (requires inotify-tools)
while true; do
  inotifywait -e modify,create,delete -r "$SOURCE_AGENTS" "$SOURCE_SKILL" >/dev/null 2>&1
  # Debounce rapid events
  sleep 2
  sync_repo
done
```

## Usage
Make the file executable and launch it in the background (e.g., via `nohup`, `screen`, or a systemd service):
```bash
chmod +x auto_sync_agent.md
nohup ./auto_sync_agent.md > auto_sync.log 2>&1 &
```

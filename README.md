# Articles‑AG Repository

This repository contains the full Article Content Pipeline agents and a couple of sample topics.

- `/.opencode/agents/` – All pipeline agents
- `/.opencode/SKILL.md` – Orchestration rules
- `/.opencode/package.json` – Minimal plugin manifest
- `/.opencode/.gitignore` – Ignores node_modules
- `art‑21‑05‑2026/` – Sample topics (Global‑South, Social‑Media‑Algorithms, Space‑Exploration)

## Keeping the repository up‑to‑date
Whenever any of the source agent files or the `SKILL.md` under `/home/nikhil/.gemini/antigravity/` are modified, run the following script (or copy‑paste the commands) to sync the changes to this repo and push them to GitHub:

```bash
#!/usr/bin/env bash
# sync_agents.sh – sync latest agents and flow into Articles‑AG repo
REPO_ROOT="/home/nikhil/AG-Projects/Articles-AG/.opencode"

# Copy the latest agent markdown files
cp /home/nikhil/.gemini/antigravity/agents/*.md "$REPO_ROOT/agents/"
# Copy the latest flow definition
cp /home/nikhil/.gemini/antigravity/skills/Article_flow/SKILL.md "$REPO_ROOT/"

# Commit and push the updates
cd /home/nikhil/AG-Projects/Articles-AG
git add .
git commit -m "Sync latest agents & SKILL.md"
git push origin main
```

You can place this script as `sync_agents.sh` in the repo root, make it executable (`chmod +x sync_agents.sh`), and run it whenever you change an agent or the flow definition.

---

### Quick manual update (no script)
```bash
cp /home/nikhil/.gemini/antigravity/agents/*.md /home/nikhil/AG-Projects/Articles-AG/.opencode/agents/
cp /home/nikhil/.gemini/antigravity/skills/Article_flow/SKILL.md /home/nikhil/AG-Projects/Articles-AG/.opencode/
cd /home/nikhil/AG-Projects/Articles-AG
git add .
git commit -m "Manual sync of updated agents"
git push origin main
```

These instructions ensure the repo always reflects the latest agent setup.

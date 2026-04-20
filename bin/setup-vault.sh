#!/usr/bin/env bash
set -euo pipefail

VAULT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
echo "Setting up workflow-wiki vault at: $VAULT_DIR"

# Obsidian app config
mkdir -p "$VAULT_DIR/.obsidian/snippets"

cat > "$VAULT_DIR/.obsidian/app.json" << 'EOF'
{
  "useMarkdownLinks": false,
  "showUnsupportedFiles": false,
  "attachmentFolderPath": "_attachments",
  "userIgnoreFilters": [
    "bin/",
    ".claude-plugin/",
    "node_modules/"
  ]
}
EOF

cat > "$VAULT_DIR/.obsidian/appearance.json" << 'EOF'
{
  "cssTheme": "",
  "enabledCssSnippets": ["vault-colors"]
}
EOF

cat > "$VAULT_DIR/.obsidian/graph.json" << 'EOF'
{
  "collapse-filter": false,
  "search": "",
  "showTags": false,
  "showAttachments": false,
  "hideUnresolved": false,
  "showOrphans": true,
  "collapse-color-groups": false,
  "colorGroups": [
    {"query": "path:wiki/projects",     "color": {"a": 1, "rgb": 3326463}},
    {"query": "path:wiki/patterns",     "color": {"a": 1, "rgb": 14474154}},
    {"query": "path:wiki/components",   "color": {"a": 1, "rgb": 12944064}},
    {"query": "path:wiki/decisions",    "color": {"a": 1, "rgb": 13537656}},
    {"query": "path:wiki/rubrics",      "color": {"a": 1, "rgb": 6985045}},
    {"query": "path:wiki/antipatterns", "color": {"a": 1, "rgb": 13723001}},
    {"query": "path:.raw",              "color": {"a": 1, "rgb": 8421504}}
  ],
  "collapse-display": false,
  "showArrow": true,
  "textFadeMultiplier": 0,
  "nodeSizeMultiplier": 1,
  "lineSizeMultiplier": 1,
  "collapse-forces": true,
  "centerStrength": 0.5,
  "repelStrength": 10,
  "linkStrength": 1,
  "linkDistance": 250
}
EOF

# CSS snippet
cp "$VAULT_DIR/WIKI.md" /dev/null 2>/dev/null  # just verify we're in the right dir
cat > "$VAULT_DIR/.obsidian/snippets/vault-colors.css" << 'EOF'
:root {
  --wf-projects:     #4fc1ff;
  --wf-patterns:     #dcdcaa;
  --wf-components:   #c586c0;
  --wf-decisions:    #ce9178;
  --wf-rubrics:      #6a9955;
  --wf-antipatterns: #d16969;
  --wf-stack:        #569cd6;
}

.nav-folder-title[data-path^="wiki/projects"]     { color: var(--wf-projects); }
.nav-folder-title[data-path^="wiki/patterns"]     { color: var(--wf-patterns); }
.nav-folder-title[data-path^="wiki/components"]   { color: var(--wf-components); }
.nav-folder-title[data-path^="wiki/decisions"]    { color: var(--wf-decisions); }
.nav-folder-title[data-path^="wiki/rubrics"]      { color: var(--wf-rubrics); }
.nav-folder-title[data-path^="wiki/antipatterns"] { color: var(--wf-antipatterns); }
.nav-folder-title[data-path^="wiki/stack"]        { color: var(--wf-stack); }
.nav-folder-title[data-path=".raw"]               { color: #808080; opacity: 0.6; }

.callout[data-callout='antipattern']  { --callout-color: 209, 105, 105; --callout-icon: lucide-alert-triangle; }
.callout[data-callout='proven']       { --callout-color: 106, 153, 85;  --callout-icon: lucide-check-circle; }
.callout[data-callout='trade-off']    { --callout-color: 220, 220, 170; --callout-icon: lucide-scale; }
EOF

# Git init
cd "$VAULT_DIR"
if [ ! -d .git ]; then
  git init
  cat > .gitignore << 'GITEOF'
.obsidian/workspace.json
.obsidian/workspace-mobile.json
.smart-connections/
.obsidian-git-data
.trash/
.DS_Store
node_modules/
GITEOF
  git add -A && git commit -m "Initial vault scaffold"
  echo "Git initialized."
else
  echo "Git already initialized."
fi

echo ""
echo "Setup complete."
echo "Open Obsidian → Manage Vaults → Open folder as vault → select: $VAULT_DIR"
echo "Then open Claude Code in the same directory and type /wiki"

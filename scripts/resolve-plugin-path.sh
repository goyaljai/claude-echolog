#!/bin/bash
# Resolves the exact install path of claude-echolog from installed_plugins.json
# Usage: source this file, then use $ECHOLOG_SCRIPTS
PLUGINS_JSON="$HOME/.claude/plugins/installed_plugins.json"

if [ ! -f "$PLUGINS_JSON" ]; then
  exit 0
fi

INSTALL_PATH=$(python3 -c "
import json, sys
with open('$PLUGINS_JSON') as f:
    d = json.load(f)
plugins = d.get('plugins', {})
for key in plugins:
    if 'claude-echolog' in key:
        entries = plugins[key]
        if entries:
            print(entries[0].get('installPath', ''))
            break
" 2>/dev/null)

echo "${INSTALL_PATH}/scripts"

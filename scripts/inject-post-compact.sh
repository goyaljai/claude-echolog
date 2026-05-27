#!/bin/bash
# PostCompact — use systemMessage (hookSpecificOutput not supported here)
if [ -f "$HOME/claude-echolog.md" ]; then
  python3 -c "
import json
with open('$HOME/claude-echolog.md') as f:
    content = f.read()
output = {
    'systemMessage': '=== EchoLog Knowledge Base ===\n' + content + '\n=== End EchoLog ===\nUse the above knowledge base to resume this session with full context.'
}
print(json.dumps(output))
"
fi

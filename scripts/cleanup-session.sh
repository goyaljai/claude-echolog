#!/bin/bash
SESSION_ID="${CLAUDE_CODE_SESSION_ID:-${CLAUDE_SESSION_ID:-unknown}}"
rm -f "$HOME/.claude/echolog-$SESSION_ID.flag"

python3 -c "
import json
output = {
    'systemMessage': 'BEFORE STOPPING: Use the Write tool to append to ~/claude-echolog.md. Write exactly 3 lines:\n## $(date +%Y-%m-%d) [session-end]\n**What:** one sentence — what was the main thing done this session\n**How:** one sentence — the key approach, command, or insight\n**Key:** the single most copy-pasteable thing from this session\n\nIf nothing meaningful happened, write:\n## $(date +%Y-%m-%d) [session-end]\n**What:** Conversational session only, no meaningful work done.\n**How:** N/A\n**Key:** N/A'
}
print(json.dumps(output))
"

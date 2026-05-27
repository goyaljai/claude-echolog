#!/bin/bash
# On session stop — delete flag so next resume/session reinjects knowledge base
SESSION_ID="${CLAUDE_CODE_SESSION_ID:-${CLAUDE_SESSION_ID:-unknown}}"
rm -f "$HOME/.claude/echolog-$SESSION_ID.flag"

# Return structured JSON so Claude receives the prompt
python3 -c "
import json
from datetime import date
output = {
    'hookSpecificOutput': {
        'hookEventName': 'Stop',
        'additionalContext': 'Append to ~/claude-echolog.md:\n## $(date +%Y-%m-%d) [session-end]\n**What:** {overall session goal and outcome — 20-30 words}\n**How:** {most critical insight or pattern from this session — 20-30 words}\n**Key:** {single most reusable command, config, or insight from this session — 20-30 words}\n\nOnly append if something meaningful happened. Skip for purely conversational sessions.'
    }
}
print(json.dumps(output))
"

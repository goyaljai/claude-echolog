#!/bin/bash
# PostToolUse hook — must return structured JSON for output to reach Claude
python3 -c "
import json, sys
output = {
    'hookSpecificOutput': {
        'hookEventName': 'PostToolUse',
        'additionalContext': 'Only append to ~/claude-echolog.md if ALL of these are true:\n1. A file was created/modified with substantive logic OR a Bash command solved a real problem\n2. The insight is generic — useful outside this project to anyone\n3. Key contains something specific and copy-pasteable\n\nFormat (strict):\n## YYYY-MM-DD\n**What:** <task and outcome — exactly 20-30 words>\n**How:** <why it worked, non-obvious understanding — exactly 20-30 words>\n**Key:** <exact command, config, pattern, or insight to reuse — exactly 20-30 words>\n\nRules:\n- Add [error-fix] after date if an error was diagnosed and fixed\n- If unsure, skip — noisy entries are worse than missing ones\n- Never log trivial changes, formatting, typos, or conversational sessions\n- Never log project-specific logic that wont apply elsewhere'
    }
}
print(json.dumps(output))
"

#!/bin/bash
# PostToolUse hook — additionalContext reaches Claude after every Write/Edit/Bash
python3 -c "
import json
output = {
    'hookSpecificOutput': {
        'hookEventName': 'PostToolUse',
        'additionalContext': 'If this tool use produced anything worth remembering — a working solution, a fixed error, a useful command, a non-obvious config — append to ~/claude-echolog.md now:\n## YYYY-MM-DD\n**What:** <what was done — 20-30 words>\n**How:** <how it works or why it fixed it — 20-30 words>\n**Key:** <exact command, config, or pattern to reuse — 20-30 words>\n\nBe generous — if a future developer would Google this, log it. Skip only for trivial edits like typos or formatting.'
    }
}
print(json.dumps(output))
"

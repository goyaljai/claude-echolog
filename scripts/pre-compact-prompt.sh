#!/bin/bash
# PreCompact hook — must return structured JSON for output to reach Claude
python3 -c "
import json
output = {
    'hookSpecificOutput': {
        'hookEventName': 'PreCompact',
        'additionalContext': 'Append to ~/claude-echolog.md right now before context is wiped:\n## YYYY-MM-DD [pre-compact]\n**What:** <most important task completed so far this session — exactly 20-30 words>\n**How:** <most critical insight or pattern discovered — exactly 20-30 words>\n**Key:** <single most reusable command, config, or insight — exactly 20-30 words>\n\nDo this immediately. Do not skip.'
    }
}
print(json.dumps(output))
"

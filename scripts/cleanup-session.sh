#!/bin/bash
# On session stop — delete flag so next resume/session reinjects knowledge base
rm -f "$HOME/.claude/echolog-$CLAUDE_SESSION_ID.flag"

# Prompt Claude to write final session summary
echo "Append to ~/claude-echolog.md:
## $(date +%Y-%m-%d) [session-end]
**What:** {overall session goal and outcome — 20-30 words}
**How:** {most critical insight or pattern from this session — 20-30 words}
**Key:** {single most reusable command, config, or insight from this session — 20-30 words}

Only append if something meaningful happened this session. Skip for purely conversational sessions."

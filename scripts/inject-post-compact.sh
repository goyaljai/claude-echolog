#!/bin/bash
# PostCompact — systemMessage is UI-only, Claude doesn't act on it
# Strategy: delete session flag so UserPromptSubmit reinjects on next prompt
SESSION_ID="${CLAUDE_CODE_SESSION_ID:-${CLAUDE_SESSION_ID:-unknown}}"
SESSION_FLAG="$HOME/.claude/echolog-$SESSION_ID.flag"

# Remove session flag — forces reinject on next UserPromptSubmit
rm -f "$SESSION_FLAG"

echo '{}'

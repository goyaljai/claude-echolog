#!/bin/bash
# On session stop — just clean up the flag. Claude cannot write after Stop fires.
SESSION_ID="${CLAUDE_CODE_SESSION_ID:-${CLAUDE_SESSION_ID:-unknown}}"
rm -f "$HOME/.claude/echolog-$SESSION_ID.flag"
echo '{}'

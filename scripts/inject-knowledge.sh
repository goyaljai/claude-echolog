#!/bin/bash
# Inject knowledge base on first prompt of session only
SESSION_ID="${CLAUDE_CODE_SESSION_ID:-${CLAUDE_SESSION_ID:-unknown}}"
FLAG="$HOME/.claude/echolog-$SESSION_ID.flag"

if [ ! -f "$FLAG" ]; then
  touch "$FLAG"
  if [ -f "$HOME/claude-echolog.md" ]; then
    echo "=== EchoLog Knowledge Base ==="
    cat "$HOME/claude-echolog.md"
    echo "=== End EchoLog ==="
    echo "Scan the above knowledge base for relevant patterns, fixes, and insights before starting work."
  fi
fi

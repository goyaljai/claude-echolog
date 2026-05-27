#!/bin/bash
CONSENT_FLAG="$HOME/.claude/echolog-consent.flag"
SESSION_ID="${CLAUDE_CODE_SESSION_ID:-${CLAUDE_SESSION_ID:-unknown}}"
SESSION_FLAG="$HOME/.claude/echolog-$SESSION_ID.flag"

# First-run consent check
if [ ! -f "$CONSENT_FLAG" ]; then
  cat << 'EOF'
=== claude-echolog: First-time setup ===

This plugin does two things automatically:
  1. LOGS: After meaningful work (Write/Edit/Bash), appends a 3-line summary
     to ~/claude-echolog.md — what was done, how, and the key command/insight.
  2. READS: At the start of each session, injects ~/claude-echolog.md into
     context so Claude learns from past sessions.

To approve and activate, run once in your terminal:
  touch ~/.claude/echolog-consent.flag

View source: https://github.com/goyaljai/claude-echolog
=== End setup ===
EOF
  exit 0
fi

# Session-level: only inject once per session
if [ ! -f "$SESSION_FLAG" ]; then
  touch "$SESSION_FLAG"

  # Check for any pending pre-compact entries to resolve
  for PENDING in "$HOME"/.claude/echolog-pending-*.md; do
    if [ -f "$PENDING" ]; then
      echo "=== EchoLog: Pending pre-compact entry ==="
      cat "$PENDING"
      echo "=== Fill in What/How/Key above and append to ~/claude-echolog.md if meaningful. Then ignore. ==="
      rm -f "$PENDING"
    fi
  done

  # Create knowledge base file if it doesn't exist yet
  if [ ! -f "$HOME/claude-echolog.md" ]; then
    echo "# EchoLog Knowledge Base" > "$HOME/claude-echolog.md"
    echo "<!-- Auto-maintained by claude-echolog -->" >> "$HOME/claude-echolog.md"
    echo "" >> "$HOME/claude-echolog.md"
  fi

  # Inject full knowledge base
  if [ -s "$HOME/claude-echolog.md" ]; then
    echo "=== EchoLog Knowledge Base ==="
    cat "$HOME/claude-echolog.md"
    echo "=== End EchoLog ==="
    echo "Scan the above for relevant patterns, fixes, and insights before starting work."
  fi
fi

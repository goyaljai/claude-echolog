#!/bin/bash
# Inject knowledge base on first prompt of session only
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

Scripts that run on your machine:
  - inject-knowledge.sh    → reads ~/claude-echolog.md (this script)
  - post-tool-prompt.sh    → reminds Claude to log after real work
  - pre-compact-prompt.sh  → reminds Claude to log before /compact
  - inject-post-compact.sh → re-reads ~/claude-echolog.md after /compact
  - cleanup-session.sh     → deletes session flag + prompts final log on /exit

To approve and activate, run once in your terminal:
  touch ~/.claude/echolog-consent.flag

To view source: https://github.com/goyaljai/claude-echolog
=== End setup ===
EOF
  exit 0
fi

# Session-level: only inject once per session
if [ ! -f "$SESSION_FLAG" ]; then
  touch "$SESSION_FLAG"
  if [ -f "$HOME/claude-echolog.md" ]; then
    echo "=== EchoLog Knowledge Base ==="
    cat "$HOME/claude-echolog.md"
    echo "=== End EchoLog ==="
    echo "Scan the above knowledge base for relevant patterns, fixes, and insights before starting work."
  fi
fi

#!/bin/bash
# After compact — reinject full knowledge base so Claude resumes with full context
if [ -f "$HOME/claude-echolog.md" ]; then
  echo "=== EchoLog Knowledge Base ==="
  cat "$HOME/claude-echolog.md"
  echo "=== End EchoLog ==="
  echo "Use the above knowledge base to resume this session with full context."
fi

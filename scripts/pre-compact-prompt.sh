#!/bin/bash
# PreCompact — Claude cannot be instructed via systemMessage (it's UI-only)
# Strategy: write a PENDING file that UserPromptSubmit will inject next session
# so the pre-compact context is not lost

SESSION_ID="${CLAUDE_CODE_SESSION_ID:-${CLAUDE_SESSION_ID:-unknown}}"
PENDING="$HOME/.claude/echolog-pending-$SESSION_ID.md"

# Write a placeholder so next session knows a compact happened
echo "## $(date +%Y-%m-%d) [pre-compact — pending]
**Note:** Session compacted. Claude should fill in What/How/Key from context above if meaningful work was done." > "$PENDING"

# Return empty JSON — let compact proceed
echo '{}'

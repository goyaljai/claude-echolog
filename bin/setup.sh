#!/bin/bash
set -e

echo "Installing claude-echolog..."

# Create plugin directory
PLUGIN_DIR="$HOME/.claude/plugins/claude-echolog"
mkdir -p "$PLUGIN_DIR/scripts"

# Copy scripts
cp "$(dirname "$0")/../scripts/"*.sh "$PLUGIN_DIR/scripts/"
chmod +x "$PLUGIN_DIR/scripts/"*.sh

# Create empty knowledge base if not exists
if [ ! -f "$HOME/claude-echolog.md" ]; then
  cat > "$HOME/claude-echolog.md" << 'EOF'
# EchoLog Knowledge Base
<!-- Auto-maintained by claude-echolog. Do not edit manually. -->

EOF
  echo "Created ~/claude-echolog.md"
fi

echo ""
echo "claude-echolog installed successfully."
echo ""
echo "Your knowledge base: ~/claude-echolog.md"
echo "Manual inject: /echolog"
echo ""
echo "Claude will now silently log every meaningful insight, fix, and pattern — forever."

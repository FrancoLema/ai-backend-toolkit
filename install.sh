#!/usr/bin/env bash

set -euo pipefail

# AI Backend Toolkit installer
#
# Usage:
#   ./install.sh /path/to/project
#
# Or install into the current directory:
#   ./install.sh .

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${1:-.}"

COMMANDS_SOURCE="$SCRIPT_DIR/.cursor/commands"
RULES_SOURCE="$SCRIPT_DIR/.cursor/rules"

TARGET_DIR="$(realpath "$TARGET_DIR")"
CURSOR_DIR="$TARGET_DIR/.cursor"
COMMANDS_TARGET="$CURSOR_DIR/commands"
RULES_TARGET="$CURSOR_DIR/rules"

echo "Installing AI Backend Toolkit..."
echo
echo "Target: $TARGET_DIR"
echo

# Validate target directory
if [[ ! -d "$TARGET_DIR" ]]; then
    echo "Error: target directory does not exist:"
    echo "  $TARGET_DIR"
    exit 1
fi

# Validate toolkit structure
if [[ ! -d "$COMMANDS_SOURCE" ]]; then
    echo "Error: commands directory not found:"
    echo "  $COMMANDS_SOURCE"
    exit 1
fi

if [[ ! -d "$RULES_SOURCE" ]]; then
    echo "Error: rules directory not found:"
    echo "  $RULES_SOURCE"
    exit 1
fi

# Create Cursor directories
mkdir -p "$COMMANDS_TARGET"
mkdir -p "$RULES_TARGET"

echo "Installing commands..."

for file in "$COMMANDS_SOURCE"/*.md; do
    filename="$(basename "$file")"
    cp "$file" "$COMMANDS_TARGET/$filename"
    echo "  ✓ $filename"
done

echo
echo "Installing toolkit rules..."

for file in "$RULES_SOURCE"/*.mdc; do
    filename="$(basename "$file")"

    # Only overwrite rules owned by this toolkit.
    cp "$file" "$RULES_TARGET/$filename"

    echo "  ✓ $filename"
done

echo
echo "Installation complete."
echo
echo "Available commands:"
echo

for file in "$COMMANDS_TARGET"/*.md; do
    filename="$(basename "$file" .md)"
    echo "  /$filename"
done

echo
echo "Project-specific rules are preserved."
echo "AI Backend Toolkit rules are used as defaults when no project-specific rules exist."
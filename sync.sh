#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Syncing Homebrew packages..."
brew bundle dump --file="$DOTFILES_DIR/Brewfile" --force

echo "==> Syncing npm globals..."
npm list -g --depth=0 --parseable 2>/dev/null | tail -n +2 | xargs -n1 basename | grep -v "^npm$" | sort > "$DOTFILES_DIR/npm-globals"

echo ""
echo "Done! Review changes with: git diff"

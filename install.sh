#!/bin/bash
set -e
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Git
ln -sf "$DOTFILES_DIR/git/gitconfig" ~/.gitconfig
echo "→ Linked gitconfig"

# Shell
ln -sf "$DOTFILES_DIR/shell/zshrc" ~/.zshrc
echo "→ Linked zshrc"

echo ""
echo "Done! Reload shell: source ~/.zshrc"
echo ""
echo "Create local overrides:"
echo "  ~/.gitconfig.local  (name, email)"
echo "  ~/.zshrc.local      (machine-specific)"

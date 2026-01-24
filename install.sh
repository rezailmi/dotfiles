#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Installing Homebrew packages..."
brew bundle --file="$DOTFILES_DIR/Brewfile"

echo "==> Creating symlinks..."
ln -sf "$DOTFILES_DIR/git/gitconfig" ~/.gitconfig
echo "→ Linked gitconfig"

ln -sf "$DOTFILES_DIR/shell/zshrc" ~/.zshrc
echo "→ Linked zshrc"

mkdir -p ~/.config/ghostty
ln -sf "$DOTFILES_DIR/ghostty/config" ~/.config/ghostty/config
echo "→ Linked ghostty config"

echo "==> Installing npm global packages..."
if [ -f "$DOTFILES_DIR/npm-globals" ]; then
    xargs npm install -g < "$DOTFILES_DIR/npm-globals"
fi

echo ""
echo "Done! Reload shell: source ~/.zshrc"
echo ""
echo "Create local overrides:"
echo "  ~/.gitconfig.local  (name, email)"
echo "  ~/.zshrc.local      (machine-specific)"

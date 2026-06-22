# Dotfiles TODO

- [ ] Track cmux config in dotfiles.
  - File lives at `~/.config/cmux/cmux.json` (currently local-only, not symlinked here).
  - Suggested: add a `cmux/cmux.json` here and symlink it via `install.sh` / `sync.sh`, same pattern as `ghostty/config`.
  - Current contents include `workspaceColors.selectionColor = "#cba6f7"` (Catppuccin Mocha mauve — used as the focused/selected-workspace accent).
  - Pre-edit backup exists at `~/.config/cmux/cmux.json.<timestamp>.bak` if a clean baseline is needed.

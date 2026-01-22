# Dotfiles

Personal configuration files for macOS development environment.

## Structure

```
dotfiles/
├── Brewfile          # Homebrew packages, casks, and VS Code extensions
├── git/
│   └── gitconfig     # Git configuration (sources ~/.gitconfig.local)
├── shell/
│   └── zshrc         # Zsh configuration (sources ~/.zshrc.local)
└── install.sh        # Symlinks configs to home directory
```

## Setup on Fresh Machine

1. Clone the repository:
   ```bash
   git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
   ```

2. Install Homebrew packages:
   ```bash
   brew bundle --file=~/dotfiles/Brewfile
   ```

3. Run the install script:
   ```bash
   cd ~/dotfiles
   ./install.sh
   ```

4. Create local override files:
   ```bash
   # Git identity
   cat > ~/.gitconfig.local << 'EOF'
   [user]
       name = Your Name
       email = your@email.com
   EOF

   # Machine-specific shell settings (optional)
   touch ~/.zshrc.local
   ```

5. Reload the shell:
   ```bash
   source ~/.zshrc
   ```

## Setup on Machine with Existing Configs

Before running `install.sh`, back up any machine-specific settings:

1. Extract existing git user info:
   ```bash
   git config user.name >> ~/.gitconfig.local.tmp
   git config user.email >> ~/.gitconfig.local.tmp
   ```

2. Move any custom zsh settings you want to keep to a temp file:
   ```bash
   # Review ~/.zshrc and copy custom settings
   cat ~/.zshrc  # Check for custom aliases, exports, etc.
   ```

3. Run the install script (overwrites existing configs with symlinks):
   ```bash
   cd ~/dotfiles
   ./install.sh
   ```

4. Create local override files with your backed-up settings:
   ```bash
   # Git identity from backup
   cat > ~/.gitconfig.local << 'EOF'
   [user]
       name = Your Name
       email = your@email.com
   EOF

   # Machine-specific shell settings
   touch ~/.zshrc.local
   # Add any custom settings from your backup
   ```

## Updating Brewfile

After installing new packages via Homebrew, update the Brewfile:

```bash
brew bundle dump --file=~/dotfiles/Brewfile --force
```

Review and commit the changes:

```bash
cd ~/dotfiles
git diff Brewfile
git add Brewfile
git commit -m "Update Brewfile"
```

# dotfiles

Personal dotfiles, managed with symlinks. No fancy tooling.

## Setup

```bash
git clone https://github.com/YOUR_USER/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## Devcontainer usage

Add to your `devcontainer.json`:

```json
{
  "dotfiles.repository": "YOUR_USER/dotfiles"
}
```

The install script automatically detects container environments and skips
macOS/GUI-specific config (e.g. Ghostty).

## Structure

```
zsh/.zshrc          → ~/.zshrc
vim/.vimrc          → ~/.vimrc
ghostty/config      → ~/.config/ghostty/config   (macOS only)
starship/starship.toml → ~/.config/starship.toml
git/.gitconfig      → ~/.gitconfig
```


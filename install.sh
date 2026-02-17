#!/bin/bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

info() { printf "\033[0;34m[info]\033[0m %s\n" "$1"; }
ok()   { printf "\033[0;32m[ok]\033[0m   %s\n" "$1"; }

link() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  ln -sf "$src" "$dst"
  ok "$dst → $src"
}

is_container() {
  [ -n "$REMOTE_CONTAINERS" ] || [ -n "$CODESPACES" ] || [ -f /.dockerenv ]
}

# --- Universal configs ---
info "Linking universal configs..."

link "$DOTFILES/zsh/.zshrc"             "$HOME/.zshrc"
link "$DOTFILES/vim/.vimrc"             "$HOME/.vimrc"
link "$DOTFILES/git/.gitconfig"         "$HOME/.gitconfig"
link "$DOTFILES/starship/starship.toml" "$HOME/.config/starship.toml"

# --- macOS / GUI-only configs ---
if is_container; then
  info "Container detected — skipping GUI configs."
else
  info "Linking GUI/macOS configs..."
  link "$DOTFILES/ghostty/config" "$HOME/.config/ghostty/config"
fi

echo ""
ok "All done!"

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

if [ "$1" = "--patch-bash-for-idea" ]; then
  info "Idea detected - overwriting bash to zsh."
  echo 'if [ -t 1 ] && [ -x /usr/bin/zsh ] && [ "$ZSH_VERSION" = "" ]; then exec /usr/bin/zsh; fi' >> ~/.bashrc

  # --- JetBrains devcontainer XDG workaround for mise ---
  # https://youtrack.jetbrains.com/issue/RUBY-34350
  info "Symlinking mise config into JetBrains XDG paths..."
  sudo mkdir -p /.jbdevcontainer/config /.jbdevcontainer/data
  sudo chmod -R 777 /.jbdevcontainer
  ln -sf "$HOME/.config/mise" /.jbdevcontainer/config/mise
  ln -sf "$HOME/.local/share/mise" /.jbdevcontainer/data/mise
  ok "mise symlinks created under /.jbdevcontainer"
fi

echo ""
ok "All done!"

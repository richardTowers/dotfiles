# ─── Path ────────────────────────────────────────────────────────────
path+=($HOME/.docker/bin)

# Homebrew (macOS)
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ─── History ─────────────────────────────────────────────────────────
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt APPEND_HISTORY

# ─── Vi mode ─────────────────────────────────────────────────────────
bindkey -v
export KEYTIMEOUT=1

# ─── Editor ──────────────────────────────────────────────────────────
export EDITOR="vim"
export VISUAL="vim"

# ─── Aliases ─────────────────────────────────────────────────────────

# ─── Prompt ──────────────────────────────────────────────────────────
# Use starship if available, otherwise a simple fallback
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
else
  PS1="%F{blue}%~%f %# "
fi

# ─── Completions ─────────────────────────────────────────────────────
fpath+=($HOME/.zfunc)                                                            
autoload -Uz compinit && compinit -u
zstyle ':completion:*' menu select


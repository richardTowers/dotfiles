# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles repo managed with symlinks. No build system, tests, or linting.

## Installation

```bash
./install.sh                      # symlink all configs
./install.sh --patch-bash-for-idea  # also override bash→zsh for JetBrains IDEs
```

## Architecture

Each tool gets its own directory containing its config file. `install.sh` symlinks them to their expected locations:

| Source | Target |
|--------|--------|
| `zsh/.zshrc` | `~/.zshrc` |
| `vim/.vimrc` | `~/.vimrc` |
| `git/.gitconfig` | `~/.gitconfig` |
| `starship/starship.toml` | `~/.config/starship.toml` |
| `ghostty/config` | `~/.config/ghostty/config` |

The install script detects container environments (`REMOTE_CONTAINERS`, `CODESPACES`, `/.dockerenv`) and skips GUI-only configs (Ghostty) when running inside one.

## Key Details

- `.gitignore` excludes `*.local` files, so any `*.local` file can be used for machine-specific overrides without committing them.
- The zsh config falls back to a basic prompt if Starship isn't installed.
- Homebrew initialization is conditional on macOS (`/opt/homebrew`).

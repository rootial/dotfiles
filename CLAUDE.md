# CLAUDE.md

This file provides guidance to Claude Code when working with code in this repository.

## What This Repo Is

A [chezmoi](https://chezmoi.io) dotfiles repository for macOS. Files here are managed by chezmoi and applied to `$HOME`. The `dot_` prefix maps to `.` (e.g., `dot_zshrc` → `~/.zshrc`), and `dot_config/` maps to `~/.config/`.

## Common Commands

```sh
# Apply changes from this repo to the system
chezmoi apply

# Pull latest changes and apply
chezmoi update

# Preview what would change before applying
chezmoi diff

# Edit a managed file (opens in $EDITOR, applies on save)
chezmoi edit ~/.zshrc

# Add a new file to be managed
chezmoi add ~/.some-new-config
```

## Architecture

### File Naming Conventions

- `dot_*` → `.` prefix in `$HOME` (e.g., `dot_gitignore_global` → `~/.gitignore_global`)
- `executable_*` → file is made executable on apply
- `.chezmoiignore` excludes `dot_config/zsh/.secret` (API keys, never committed)

### Zsh Configuration

Modular structure loaded by `dot_zshrc` → `dot_config/zsh/rc.d/` in numeric order:

| File | Purpose |
|------|---------|
| `00-init.zsh` | Tool init: evalcache, starship, nvm, pyenv, Ghostty integration |
| `05-compinit.zsh` | Zsh completion system |
| `20-settings.zsh` | History, keybindings, IGNOREEOF, bat/eza theme |
| `25-fzf.zsh` | fzf keybindings and preview config |
| `30-aliases.zsh` | Git, system, eza, of() function |
| `90-plugins.zsh` | Zsh plugin loading |
| `95-tips.zsh` | Random terminal tip on shell start |
| `99-zoxide.zsh` | zoxide (smart cd, replaces autojump) |

Secrets (API keys) go in `~/.config/zsh/.secret` — sourced by `dot_zshrc` but excluded from this repo.

### Claude Code Configuration

`dot_claude/` maps to `~/.claude/`:
- `settings.json` — enabled plugins, hooks, model config
- `statusline.sh` — custom status line (model, dir, git branch, API usage)

### Key Managed Configs

- `dot_config/starship.toml` — Starship prompt (Nerd Font, multi-language icons)
- `dot_config/ghostty/config` — Ghostty terminal (font: Maple Mono NF CN)
- `dot_gitignore_global` — Global git ignores (macOS, editors, languages)
- `dot_zshenv` — Universal env vars (EDITOR, LANG, COLORTERM)
- `dot_zprofile` — Login shell PATH setup
- `Brewfile` — All Homebrew packages, casks, and taps

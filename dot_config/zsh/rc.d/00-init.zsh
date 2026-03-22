# ==========================================
# Tool Initializations
# ==========================================

# Initialize evalcache
source $(brew --prefix)/share/evalcache/evalcache.plugin.zsh

# Cache starship init using evalcache
if type starship &>/dev/null; then
  _evalcache starship init zsh
fi

# nvm (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

# pyenv
if command -v pyenv &>/dev/null || [[ -d "$HOME/.pyenv" ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
  _evalcache pyenv init -
fi

# Ghostty shell integration
if [[ -n "$GHOSTTY_RESOURCES_DIR" ]]; then
  source "$GHOSTTY_RESOURCES_DIR/shell-integration/zsh/ghostty-integration"
fi

# GPG
GPG_TTY=$(tty)
export GPG_TTY


# Bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# OpenClaw completion
[ -f "$HOME/openclaw-cluster/owl/.openclaw/completions/openclaw.zsh" ] && \
  source "$HOME/openclaw-cluster/owl/.openclaw/completions/openclaw.zsh"

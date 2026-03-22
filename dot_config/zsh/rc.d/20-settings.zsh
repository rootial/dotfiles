# History Configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=20000
SAVEHIST=10000

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt AUTO_CD

# CDPATH
export CDPATH=".:$HOME:$HOME/Developer:$HOME/Downloads:$HOME/Documents"

# Modern Tools Theme Settings

# bat
export BAT_THEME="base16"

# LS_COLORS
if [[ -f "$HOME/.config/zsh/.dircolors.cache" ]]; then
  source "$HOME/.config/zsh/.dircolors.cache"
elif command -v dircolors >/dev/null; then
  eval "$(dircolors -b)"
else
  export LSCOLORS="Gxfxcxdxbxegedabagacad"
fi

# keybindings
# Alt+Arrow word movement (via Ctrl+Arrow sequences from Ghostty)
bindkey "\x1b[1;5C" forward-word
bindkey "\x1b[1;5D" backward-word

# Require double ctrl+d to exit
IGNOREEOF=1

# clang / openssl
export LDFLAGS="-L/opt/homebrew/opt/zlib/lib"
export CPPFLAGS="-I/opt/homebrew/opt/zlib/include"

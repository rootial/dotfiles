# --- Identity ---
export GITHUB_USERNAME="rootial"

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
setopt HIST_IGNORE_SPACE

# CDPATH
export CDPATH=".:$HOME:$HOME/repos:$HOME/Downloads:$HOME/Documents"

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
bindkey -e                          # 强制 emacs 模式（修复 ^A/^E 等默认绑定）
bindkey '^D' delete-char            # 有字符删字，空行触发 EOF（IGNOREEOF 接管）
bindkey '^U' backward-kill-line     # Ctrl+U 删到行首（非整行）
# Alt+Arrow word movement (via Ctrl+Arrow sequences from Ghostty)
bindkey "\x1b[1;5C" forward-word
bindkey "\x1b[1;5D" backward-word

# Require double ctrl+d to exit
setopt IGNORE_EOF
IGNOREEOF=1

# clang / openssl
export LDFLAGS="-L/opt/homebrew/opt/zlib/lib"
export CPPFLAGS="-I/opt/homebrew/opt/zlib/include"

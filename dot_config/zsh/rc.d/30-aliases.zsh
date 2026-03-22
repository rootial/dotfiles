# ==========================================
# Aliases
# ==========================================

# --- 1. System & Productivity ---
alias reload="source ~/.zshrc"
alias cz="chezmoi"
alias czd="chezmoi diff"
alias cza="chezmoi apply"
alias cze="chezmoi edit"
alias brewst="brew bundle --file=~/.config/zsh/Brewfile"
alias p="pnpm"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias grep="grep --color=auto"
alias ip="ipconfig getifaddr en0"

# Quick Jump
alias down="cd ~/Downloads"
alias dev="cd ~/repos"
alias doc="cd ~/Documents"

if type bat &>/dev/null; then
  alias cat="bat"
fi

if type gdu-go &>/dev/null; then
  alias gdu="gdu-go"
fi

# --- 2. File System (Enhanced ls) ---
if type eza &>/dev/null; then
  alias ls="eza --icons --git --group-directories-first --hyperlink"
  alias ll="eza -l --icons --git -a --group-directories-first --hyperlink"
  alias l="eza -l --icons --git --group-directories-first"
  alias la="eza -la --icons --git --group-directories-first"
  alias tree="eza --tree --icons"
else
  alias ll="ls -lah"
  alias la="ls -A"
  alias l="ls -CF"
fi

# --- 3. Git ---
alias g="git"
alias gst="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gb="git branch"
alias gbd="git branch -d"
alias gm="git merge"
alias ga="git add"
alias gaa="git add --all"
alias gc="git commit -v"
alias gcmsg="git commit -m"
alias gcam="git commit -a -m"
alias gamend="git commit --amend"
alias gl="git pull"
alias gp="git push"
alias gpsup='git push --set-upstream origin $(git branch --show-current)'
alias gpf="git push --force-with-lease"
alias glog="git log --oneline --decorate --graph"
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias gsta="git stash push"
alias gstp="git stash pop"
alias gstl="git stash list"

# --- 4. Custom Functions ---

# Quick open: select path then run `of`, or `of <path>`
of() {
  local p="${1:-$(pbpaste)}"
  p="${p%%:*}"
  if [ -d "$p" ]; then
    open "$p"
  elif [ -f "$p" ]; then
    open -R "$p"
  else
    echo "path not found: $p"
  fi
}

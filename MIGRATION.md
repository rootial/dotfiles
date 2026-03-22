# ZSH 配置迁移记录
日期：2026-03-22
参考：https://github.com/FradSer/dotfiles

## 目标
从 oh-my-zsh 迁移到模块化 zsh 配置，并用 chezmoi 统一管理 dotfiles。

## chezmoi 设置
- 源目录：~/.local/share/chezmoi
- remote：https://github.com/rootial/dotfiles
- 已完成初始化并推送第一次提交

---

## 迁移进度

### ✓ 已完成

#### ~/.zshenv（新建）
- `EDITOR=vim`
- `LANG=en_US.UTF-8`
- `COLORTERM=truecolor`

#### ~/.zprofile（重写）
- Homebrew（arm64 + x86 fallback）
- Go（GOPATH + bin）
- pnpm
- Bun
- uv（新安装）
- ~/.local/bin
- JetBrains Toolbox
- Tailscale CLI（`/Applications/Tailscale.app/Contents/MacOS`）
- trash（`/opt/homebrew/opt/trash/bin`）
- ~/bin

#### ~/.zshrc（替换为 slim 入口）
- 加载 `~/.config/zsh/.secret`
- 加载 `~/.config/zsh/rc.d/*.zsh`

#### ~/.config/zsh/rc.d/00-init.zsh
- evalcache 初始化
- starship init（via evalcache）
- nvm
- pyenv（via evalcache）
- Ghostty shell integration
- GPG_TTY
- Bun completions
- OpenClaw completion

#### ~/.config/zsh/rc.d/05-compinit.zsh
- zsh 补全系统初始化（带缓存优化）

#### ~/.config/zsh/rc.d/20-settings.zsh
- history（HISTFILE、HISTSIZE、SAVEHIST、setopt）
- CDPATH
- BAT_THEME
- LS_COLORS（dircolors）
- keybindings（Alt+Arrow）
- IGNOREEOF=1（双击 ctrl+d 才退出）
- LDFLAGS/CPPFLAGS（zlib）

#### ~/.config/zsh/rc.d/25-fzf.zsh（FradSer 原版）
- fzf init（via evalcache）
- FZF_DEFAULT_OPTS（Nerd Font 风格）
- FZF_CTRL_T / FZF_ALT_C
- fif()、fgb()、fgl()、fkill() 函数

#### ~/.config/zsh/rc.d/30-aliases.zsh
- reload、p、..、grep、ip
- Quick Jump（down/dev/doc）
- bat → cat
- eza → ls/ll/l/la/tree（含 --hyperlink）
- git aliases（g/gst/gd/gco/gcb/gb/gm/ga/gaa/gc/gl/gp/gpf/glog 等）
- of() 函数（快速打开路径）

#### ~/.config/zsh/rc.d/90-plugins.zsh（FradSer 原版，需确认安装）
- zsh-autosuggestions
- fzf-tab
- zsh-autopair
- zsh-you-should-use
- zsh-syntax-highlighting
- zsh-history-substring-search
- history-substring-search keybindings

#### ~/.config/zsh/rc.d/95-tips.zsh（FradSer 原版）
- 随机终端 tip（中文/英文自动检测）

#### ~/.config/zsh/rc.d/99-zoxide.zsh（FradSer 原版）
- zoxide init（via evalcache，替代 autojump）

#### ~/.config/zsh/.secret（新建，不入 git）
- ZENMUX_API_KEY
- DEEPSEEK_API_KEY
- QWCODER_API_KEY
- OPENROUTER_API_KEY

---

### ✗ 未迁移（待确认）

| 项目 | 原内容 | 说明 |
|---|---|---|
| `alias xbrew` | `arch -x86_64 /usr/local/bin/brew` | 是否还需要 Rosetta brew？ |
| `OPT_OUT_LINT_PRE_PUSH_HOOK` | `=true` | 哪个项目用的？ |
| bzip2 PATH | `/opt/homebrew/opt/bzip2/bin` | 是否有工具依赖？ |
| `fpath ~/.zsh/completions` | opencli 补全 | 目录里有什么？ |
| `alias zshrc` | `vi ~/.zshrc` | 是否需要快速编辑 zshrc 的别名？ |
| `alias ghosttyconfig` | 打开 Ghostty config | 是否需要？ |

---

### - 有意丢弃

| 项目 | 原因 |
|---|---|
| oh-my-zsh | 替换为模块化方案 |
| autojump | 替换为 zoxide |
| LDFLAGS/CPPFLAGS openssl（/usr/local） | 旧路径，过时 |
| Go PATH `/usr/local/go/bin` | brew 安装的 Go 不在这里 |
| bun PATH 重复 | 原 zshrc 里写了两遍，zprofile 已统一 |
| `PROMPT_COMMAND` history | bash 语法，zsh 不适用 |

---

## 新安装的工具
- uv（Python 包管理器）
- starship（提示符）
- fd（fast find）
- bat（cat 替代）
- gdu（磁盘分析）
- delta（git diff 增强）
- zoxide（cd 替代，替代 autojump）
- fzf-tab
- zsh-autopair
- zsh-you-should-use
- evalcache（手动安装到 /opt/homebrew/share/evalcache/）

---

## 下一步（dotfiles 其余文件）
- [ ] dot_gitignore_global
- [ ] dot_config/starship.toml
- [ ] dot_claude/settings.json
- [ ] dot_claude/executable_statusline.sh
- [ ] Brewfile（仅参考）
- [ ] 把 zellij config 加入 chezmoi
- [ ] commit & push 所有改动到 rootial/dotfiles

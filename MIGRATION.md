# ZSH 配置迁移记录
日期：2026-03-22
参考：https://github.com/FradSer/dotfiles

## 目标
从 oh-my-zsh 迁移到模块化 zsh 配置，并用 chezmoi 统一管理 dotfiles。

## chezmoi 设置
- 源目录：~/.local/share/chezmoi
- remote：https://github.com/rootial/dotfiles
- bootstrap：`curl -fsSL https://raw.githubusercontent.com/rootial/dotfiles/master/bootstrap.sh | zsh`

---

## 迁移完成状态 ✓

### ~/.zshenv
- `EDITOR=vim`、`LANG=en_US.UTF-8`、`COLORTERM=truecolor`

### ~/.zprofile
- Homebrew、Go、pnpm、Bun、uv、~/.local/bin
- JetBrains Toolbox、Tailscale CLI、trash、~/bin

### ~/.zshrc
- slim 入口：加载 `.secret` 和 `rc.d/*.zsh`

### rc.d 模块

| 文件 | 内容 |
|---|---|
| `00-init.zsh` | evalcache、starship、nvm、pyenv、Ghostty、GPG、bun、openclaw |
| `05-compinit.zsh` | zsh 补全系统 |
| `10-ai-functions.zsh` | claude/codex/gemini/qwen 包装器，provider 切换 |
| `20-settings.zsh` | history、CDPATH（~/repos）、GITHUB_USERNAME、keybindings、IGNOREEOF、AUTO_CD |
| `25-fzf.zsh` | fzf 配置，fif/fgb/fgl/fkill 函数 |
| `30-aliases.zsh` | reload、brewst、git aliases、eza（--hyperlink）、gdu、of() |
| `90-plugins.zsh` | autosuggestions、fzf-tab、autopair、you-should-use、syntax-highlighting |
| `95-tips.zsh` | 随机终端 tip（中英文） |
| `99-zoxide.zsh` | zoxide（替代 autojump） |

### 其他文件
- `~/.config/zsh/.secret` — API keys（不入 git）
- `~/.config/ghostty/config` — Maple Mono NF CN，自定义颜色
- `~/.config/zellij/config.kdl` — on_force_close=detach
- `~/.config/starship.toml` — Nerd Font 图标
- `~/.config/zsh/Brewfile` — brew 包清单（`brewst` 同步）
- `~/.gitignore_global` — 全局 gitignore
- `~/.claude/settings.json` — plugins、hooks、statusline、autoMemory
- `~/.claude/statusline.sh` — 状态栏（模型、目录、git、用量）
- `~/.claude/git.local.md` — commit 规范

---

## 暂缓处理

| 项目 | 说明 |
|---|---|
| `alias xbrew` | Rosetta brew，待确认 |
| `OPT_OUT_LINT_PRE_PUSH_HOOK` | 待确认哪个项目用 |
| bzip2 PATH | 待确认是否有工具依赖 |
| `fpath ~/.zsh/completions` | 待确认目录内容 |
| `dot_config/zsh/dot_claude-providers.toml` | FradSer 的 provider 配置，暂跳过 |

---

## 有意丢弃

| 项目 | 原因 |
|---|---|
| oh-my-zsh | 替换为模块化方案 |
| autojump | 替换为 zoxide |
| robbyrussell theme | 替换为 starship |
| LDFLAGS/CPPFLAGS openssl `/usr/local` | 旧路径，过时 |
| Go PATH `/usr/local/go/bin` | brew 安装的 Go 不在这里 |
| bun PATH 重复 | zprofile 已统一 |
| `PROMPT_COMMAND` history | bash 语法，zsh 不适用 |

---

## 新安装的工具
uv、starship、fd、bat、gdu、delta、zoxide、fzf-tab、zsh-autopair、zsh-you-should-use、evalcache、git-flow-next、git-lfs、git-open、lazygit

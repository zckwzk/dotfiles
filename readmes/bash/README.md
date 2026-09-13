# 🐚 Bash & Dotfiles Helpers Guide

- **Config files**:
  - `~/.bashrc` - Primary interactive shell initialization script
  - `~/.bash_profile` - Login shell startup script
  - `~/.bashrc.d/dotfiles.bash` - Git Bare repository helper functions & aliases
- **Modular directory**: `~/.bashrc.d/`

---

## 🏗️ Modular Architecture (`.bashrc.d/`)

Your `.bashrc` is structured to automatically source all `*.bash` scripts in `~/.bashrc.d/` whenever an interactive shell starts:

```bash
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
```

### Advantages:
1. **Clean & Organized**: No monolithic `.bashrc` cluttered with hundreds of disparate aliases.
2. **Modular Maintenance**: Individual tools and workflows (e.g. `dotfiles.bash`, `waydroid.bash`, work scripts) live in separate, self-contained files.

---

## ⚡ Git Bare Repository Helpers (`dotfiles.bash`)

To manage dotfiles across `$HOME` without complex symlink managers, this helper provides the `dotfiles` command and fast shortcuts.

### 1. Primary Command
- **`dotfiles`**: Official wrapper for `/usr/bin/git --git-dir=$HOME/Documents/dotfiles --work-tree=$HOME`. Supports all standard Git arguments (`status`, `add`, `commit`, `branch`, `diff`, `log`, `push`, etc.).
- **Auto-completion**: Integrates directly with Fedora's system Git bash-completion. You can press `Tab` after typing `dotfiles` to complete commands and branch names (e.g. `dotfiles sta<TAB>` completes to `dotfiles status`).

### 2. Fast Shortcut Reference

| Shortcut | Expanded Command | Description |
| :--- | :--- | :--- |
| `df-status` | `dotfiles status` | Check status of modified or staged dotfiles |
| `df-diff` | `dotfiles diff` | View uncommitted changes in tracked config files |
| `df-log` | `dotfiles log --oneline --graph --decorate -n 15` | View visual commit history graph |
| `df-add <file>` | `dotfiles add <file>` | Stage a config file for tracking in the repository |
| `df-commit -m '...'` | `dotfiles commit -m '...'` | Commit changes to tracked configurations |
| `df-push` | `dotfiles push` | Upload commits to remote repository (GitHub / GitLab) |
| `df-help` / `dotfiles-help` | Helper function | Display interactive command summary in terminal |

---

## 📝 Tracking New Configurations in Dotfiles

When you install a new tool and want its configuration tracked:

```bash
# 1. Stage the configuration file
df-add ~/.config/app_name/config.conf

# 2. Verify status
df-status

# 3. Create a commit
df-commit -m "feat: track app_name configuration"

# 4. Push to remote repository (if configured)
df-push
```

---

## 💡 Adding New Scripts to `.bashrc.d/`

Simply create a new `.bash` file in `~/.bashrc.d/`:

```bash
cat << 'EOF' > ~/.bashrc.d/custom-aliases.bash
# User aliases
alias update='sudo dnf upgrade --refresh -y'
alias cls='clear'
alias ll='ls -la --color=auto'
EOF
```

Then reload your shell with `source ~/.bashrc`.
The new aliases will be active immediately and can be tracked in dotfiles via `df-add ~/.bashrc.d/custom-aliases.bash`.

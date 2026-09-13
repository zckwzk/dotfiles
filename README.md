# 🛠️ Zakaniwa's Dotfiles

Personal dotfiles managed cleanly via a **Git Bare Repository** technique.  
No symlink clutter, no external dotfile manager required—native Git tracking directly within `$HOME`.

---

## 📂 Tracked Configurations

| Component | Path | Description |
| :--- | :--- | :--- |
| **Bash** | `~/.bashrc`, `~/.bash_profile` | Shell startup scripts, automatic loading of `~/.bashrc.d/*` |
| **Dotfiles Helpers** | `~/.bashrc.d/dotfiles.bash` | `dotfiles` command, bash git completions, helper aliases & help menu |
| **Waydroid** | `~/.bashrc.d/waydroid.bash` | Fast Android container helpers (`wd-multiwin`, `wd-stop`, etc.) |
| **Tmux** | `~/.tmux.conf` | `Ctrl-a` prefix, 1-based indexing, vim nav (`h,j,k,l`), TrueColor, Catppuccin theme, TPM plugins |
| **Terminal** | `~/.config/alacritty/alacritty.toml` | Alacritty terminal with JetBrainsMono Nerd Font & maximized start |
| **Neovim** | `~/.config/nvim/` | Full LazyVim IDE setup with plugins, keymaps, options, and lockfile |

---

## 📚 Component Documentation (`readmes/`)

Detailed guides, plugin lists, and shortcut references for each tool are organized inside the [`readmes/`](readmes/README.md) folder:

- 🪟 **[Tmux Guide & Plugins](readmes/tmux/README.md)**: Plugins overview (TPM, sensible, yank, resurrect, continuum), clipboard integration, and full keybinding reference.
- 🐚 **[Bash & Dotfiles Helpers](readmes/bash/README.md)**: Modular `.bashrc.d/` architecture, `dotfiles` command, shortcuts (`df-*`), and shell autocompletion.
- 🤖 **[Waydroid Helpers](readmes/waydroid/README.md)**: Quick commands (`wd-multiwin`, `wd-freeze`, `wd-resume`, `wd-stop`) for running Android apps on Linux.
- 💻 **[Alacritty Terminal](readmes/alacritty/README.md)**: JetBrainsMono Nerd Font setup, maximized window mode, opacity, and Catppuccin color scheme.
- ⚡ **[Neovim (LazyVim)](readmes/neovim/README.md)**: LazyVim directory structure, file navigation, buffer shortcuts, Mason LSP manager, and adding custom plugins.

---

## 🚀 Daily Workflow Commands

Thanks to `~/.bashrc.d/dotfiles.bash`, you can use standard git operations via the `dotfiles` command or quick aliases:

```bash
# Check status of tracked dotfiles
dotfiles status      # or df-status

# View changes you made to tracked configs
dotfiles diff        # or df-diff

# Stage an existing or new config file
dotfiles add ~/.config/new_app/config.conf   # or df-add <file>

# Commit changes
dotfiles commit -m "feat(tmux): tweak status bar"  # or df-commit -m "..."

# View git history
dotfiles log --oneline --graph -n 10        # or df-log

# Push changes to your remote repository
dotfiles push        # or df-push

# View available helper commands in Indonesian
dotfiles-help        # or df-help
```

---

## 📦 Setting Up on a New Machine

To replicate this exact configuration on a fresh Fedora or Linux machine:

```bash
# 1. Clone repository as a bare repository
git clone --bare <YOUR_GIT_REPO_URL> $HOME/Documents/dotfiles

# 2. Define alias temporarily in current shell
alias dotfiles='/usr/bin/git --git-dir=$HOME/Documents/dotfiles/ --work-tree=$HOME'

# 3. Checkout tracked dotfiles into $HOME
# (If default files like .bashrc already exist, backup or remove them before checkout)
mkdir -p $HOME/.dotfiles-backup && dotfiles checkout 2>&1 | grep -E "^\s+" | awk {'print $1'} | xargs -I{} mv $HOME/{} $HOME/.dotfiles-backup/{}
dotfiles checkout

# 4. Hide untracked files from 'dotfiles status'
dotfiles config --local status.showUntrackedFiles no

# 5. Create convenience symlink ~/.dotfiles
ln -sf $HOME/Documents/dotfiles $HOME/.dotfiles

# 6. Reload shell
source ~/.bashrc
```

---

## 🔒 Safe Exclusion

The bare repository is configured with `info/exclude` to automatically prevent accidental commits of sensitive files (SSH keys, GPG keys, tokens, `.env`, credentials) and large directories (`Downloads/`, `Videos/`, `Documents/`, `.cache/`, `.local/share/`).

# 🪟 Tmux Configuration & Plugins Guide

- **Config file**: `~/.tmux.conf`
- **Plugin directory**: `~/.tmux/plugins/`
- **Theme**: Catppuccin Mocha
- **Primary Prefix**: `Ctrl-a` *(secondary: `Ctrl-b`)*

---

## 🔌 Installed Plugins

Plugins are managed via **TPM (Tmux Plugin Manager)**.

### 1. `tmux-plugins/tpm` (Tmux Plugin Manager)
- **Purpose**: Plugin manager for Tmux. Handles installing, updating, and cleaning plugins via Git.
- **How it works**: Clones plugin repositories to `~/.tmux/plugins/` and sources them dynamically at runtime.
- **Key Shortcuts**:
  | Shortcut | Action |
  | :--- | :--- |
  | `Ctrl-a` then `I` *(Shift + i)* | Fetch and install newly added plugins defined in `.tmux.conf` |
  | `Ctrl-a` then `U` *(Shift + u)* | Update all installed plugins to their latest versions |
  | `Ctrl-a` then `Alt + u` | Uninstall and remove plugin folders no longer listed in `.tmux.conf` |

---

### 2. `tmux-plugins/tmux-sensible`
- **Purpose**: A universal baseline of sensible options agreed upon by the Tmux community.
- **Key Features**:
  - Eliminates ESC key delay (essential for responsive Neovim usage).
  - Ensures proper UTF-8 and 256-color terminal support.
  - Configures comfortable scrollback buffer sizes and command history limits.
  - Aligns status bar refresh rates.
- **How to Use**: Operates automatically in the background without needing any manual triggers.

---

### 3. `tmux-plugins/tmux-yank`
- **Purpose**: Seamless integration between Tmux copy mode and the system clipboard (Wayland via `wl-copy`, X11 via `xsel`).
- **Benefit**: Text copied within Tmux can immediately be pasted into any external desktop application (browser, IDE, text documents) using `Ctrl+v`.
- **How to Use**:
  1. Enter copy mode: Press `Ctrl-a` then `[` (or click and drag with your mouse).
  2. Start text selection (keyboard): Press `v`.
  3. Copy to system clipboard: Press `y`.
  4. Line or block selection: Press `V` for full line selection, or `Ctrl-v` for rectangular block selection.

---

### 4. `tmux-plugins/tmux-resurrect`
- **Purpose**: Saves and restores your complete Tmux environment across system reboots, terminal restarts, or unexpected disconnects.
- **What is Restored**:
  - All session names, windows, and pane splits.
  - Window layout arrangements (horizontal / vertical splits).
  - Active working directories for each pane (`current working directory`).
  - Terminal text history in each pane (`@resurrect-capture-pane-contents 'on'`).
  - Active Neovim editor sessions (`@resurrect-strategy-nvim 'session'`).
- **How to Use**:
  | Shortcut | Action |
  | :--- | :--- |
  | `Ctrl-a` then `Ctrl-s` | Manually save the current Tmux environment *(displays "Tmux environment saved!")* |
  | `Ctrl-a` then `Ctrl-r` | Restore the saved Tmux environment *(displays "Tmux restore complete!")* |

---

### 5. `tmux-plugins/tmux-continuum`
- **Purpose**: Full automation on top of `tmux-resurrect` so you never have to remember to manually save.
- **Active Settings**:
  - `@continuum-save-interval '15'`: Automatically saves your entire Tmux state every **15 minutes**.
  - `@continuum-restore 'on'`: Automatically restores your last saved session whenever the Tmux server starts up after reboot.
- **How to Use**: 100% automated; runs seamlessly in the background.

---

## ⌨️ Full Shortcut Reference

### 🧭 Navigation, Windows & Panes

| Shortcut | Action |
| :--- | :--- |
| `Ctrl-a` then `\|` or `\` | Split pane **horizontally** (opens pane to the right, preserving current directory) |
| `Ctrl-a` then `-` or `_` | Split pane **vertically** (opens pane below, preserving current directory) |
| `Ctrl-a` then `c` | Create a **new window** (preserving current directory) |
| `Ctrl-a` then `h` | Move to pane on the **left** (Vim-style) |
| `Ctrl-a` then `j` | Move to pane **below** (Vim-style) |
| `Ctrl-a` then `k` | Move to pane **above** (Vim-style) |
| `Ctrl-a` then `l` | Move to pane on the **right** (Vim-style) |
| `Ctrl-a` then `H / J / K / L` | Resize pane left / down / up / right (repeatable) |
| `Ctrl-a` then `z` | Zoom / maximize active pane (toggle on/off) |
| `Ctrl-a` then `x` | Close active pane (prompts for confirmation y/n) |
| `Ctrl-a` then `1 .. 9` | Quickly jump to window number |
| `Ctrl-a` then `r` | **Reload** `~/.tmux.conf` configuration instantly without restarting |

### 🖱️ Mouse Support
- **Click pane**: Focus and activate pane.
- **Drag pane border**: Resize pane split with precision.
- **Scroll wheel**: Automatically enters scrollback / copy mode to inspect previous logs.
- **Mouse drag selection**: Automatically highlights and copies text to the system clipboard.

---

## 🚀 Automatic Bootstrap on New Machines

The `.tmux.conf` file includes automatic bootstrap logic:
```tmux
if "test ! -d ~/.tmux/plugins/tpm" \
   "run 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins'"
```
When your dotfiles are checked out on a fresh machine and Tmux is launched for the first time, TPM and all plugins will be downloaded and installed automatically.

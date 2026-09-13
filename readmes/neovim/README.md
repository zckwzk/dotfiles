# ⚡ Neovim (LazyVim) Configuration Guide

- **Config directory**: `~/.config/nvim/`
- **Distribution / Framework**: [LazyVim](https://www.lazyvim.org/)
- **Plugin Manager**: [`lazy.nvim`](https://github.com/folke/lazy.nvim)
- **Leader Key**: `<Space>`

---

## 📂 Neovim Directory Structure

```text
~/.config/nvim/
├── init.lua                   # Main Neovim entry point
├── lazyvim.json               # Configured LazyVim extras
├── lazy-lock.json             # Precise commit hashes for all plugins (stability lock)
├── stylua.toml                # Lua code formatter configuration
└── lua/
    ├── config/
    │   ├── lazy.lua           # lazy.nvim package manager initialization
    │   ├── options.lua        # General editor options (line numbers, indentation, etc.)
    │   ├── keymaps.lua        # User custom key mappings
    │   └── autocmds.lua       # Event autocommands (e.g. format-on-save)
    └── plugins/
        ├── example.lua        # Template for plugin overrides / custom plugins
        └── ...                # Custom plugin specification files
```

---

## ⌨️ Essential LazyVim Keybindings

### 🔍 Navigation & File Search
| Shortcut | Action |
| :--- | :--- |
| `<Space> <Space>` | Search and open files (*Find Files*) |
| `<Space> e` | Toggle file explorer tree (*Neo-tree*) |
| `<Space> /` | Global regex text search across workspace (*Live Grep*) |
| `<Space> f b` | Search active open buffers (*Find Buffers*) |
| `<Space> f r` | Browse recently opened files (*Recent Files*) |

### 📑 Buffer & Tab Management
| Shortcut | Action |
| :--- | :--- |
| `]b` | Move to next buffer tab on the right |
| `[b` | Move to previous buffer tab on the left |
| `<Space> b d` | Close current active buffer |
| `<Space> b o` | Close all other buffers except current |

### 🛠️ Plugin & Tooling Management
| Shortcut / Command | Action |
| :--- | :--- |
| `<Space> l` or `:Lazy` | Open **Lazy.nvim** UI (plugin status, updates, profiling) |
| `<Space> c m` or `:Mason` | Open **Mason** UI (install & manage LSP servers, linters, formatters) |
| `:Lazy update` | Update all plugins to latest available upstream commits |
| `:Lazy sync` | Synchronize plugins with `lazy-lock.json` |

---

## 🧩 Adding Custom Plugins

To install or configure additional plugins, create a new Lua file in `lua/plugins/`.  
Example: creating `lua/plugins/colorscheme.lua`:

```lua
return {
  -- Install Catppuccin color scheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
    },
  },
  -- Configure LazyVim to load Catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
```

Once saved, open Neovim and run `:Lazy` to review automatic installation. Then commit your new configuration to dotfiles:
```bash
df-add ~/.config/nvim/
df-commit -m "feat(nvim): add catppuccin theme"
```

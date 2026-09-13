# 💻 Alacritty Terminal Configuration Guide

- **Config file**: `~/.config/alacritty/alacritty.toml`
- **Format**: TOML format (modern configuration standard for Alacritty v0.13+)

---

## ⚙️ Active Settings

```toml
[window]
startup_mode = "Maximized"

[font]
normal = { family = "JetBrainsMono Nerd Font" }
size = 10.0
```

- **`startup_mode = "Maximized"`**: Launches Alacritty maximized for a clean, distraction-free terminal workspace.
- **`family = "JetBrainsMono Nerd Font"`**: Uses JetBrains Mono patched with Nerd Font glyphs, providing seamless icon rendering across Neovim, Tmux, and shell statuslines.
- **`size = 10.0`**: Balanced font size calibrated for laptop displays.

---

## 🎨 Customization Tips

### 1. Window Opacity / Transparency
To enable a subtle semi-transparent background:
```toml
[window]
startup_mode = "Maximized"
opacity = 0.95
blur = true
```

### 2. Padding (Inner Margins)
To add breathable padding around the terminal edges:
```toml
[window.padding]
x = 8
y = 8
```

### 3. Catppuccin Mocha Color Scheme Example
To synchronize Alacritty colors with the Catppuccin Mocha Tmux theme:
```toml
[colors.primary]
background = "#1e1e2e"
foreground = "#cdd6f4"

[colors.cursor]
text = "#1e1e2e"
cursor = "#f5e0dc"

[colors.normal]
black = "#45475a"
red = "#f38ba8"
green = "#a6e3a1"
yellow = "#f9e2af"
blue = "#89b4fa"
magenta = "#f5c2e7"
cyan = "#94e2d5"
white = "#bac2de"
```

---

## 🔄 Applying Changes
Alacritty supports live configuration reloading. Once `alacritty.toml` is saved, modifications to fonts, colors, or opacity are applied instantly without restarting the terminal.

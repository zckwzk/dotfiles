# 💻 Alacritty Terminal Configuration Guide

- **Config file**: `~/.config/alacritty/alacritty.toml`
- **Format**: TOML format (standar modern konfigurasi Alacritty v0.13+)

---

## ⚙️ Pengaturan Saat Ini

```toml
[window]
startup_mode = "Maximized"

[font]
normal = { family = "JetBrainsMono Nerd Font" }
size = 10.0
```

- **`startup_mode = "Maximized"`**: Alacritty langsung terbuka dalam ukuran layar penuh tanpa border mengganggu.
- **`family = "JetBrainsMono Nerd Font"`**: Menggunakan JetBrains Mono dengan patch Nerd Font untuk mendukung simbol/glif ikon di Neovim, Tmux, dan prompt shell.
- **`size = 10.0`**: Ukuran teks ideal untuk layar laptop.

---

## 🎨 Tips Kustomisasi Tambahan

### 1. Mengatur Transparansi (Opacity) Jendela
Jika Anda ingin latar belakang terminal sedikit tembus pandang (*semi-transparent*):
```toml
[window]
startup_mode = "Maximized"
opacity = 0.95
blur = true
```

### 2. Mengatur Padding (Jarak Margin Tepi)
Untuk memberi ruang nafas di pinggiran teks:
```toml
[window.padding]
x = 8
y = 8
```

### 3. Skema Warna Catppuccin Mocha (Contoh Tema)
Untuk menyelaraskan warna Alacritty dengan tema Tmux Catppuccin Mocha:
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

## 🔄 Menerapkan Perubahan
Alacritty mendukung *live-reload*. Begitu berkas `alacritty.toml` disimpan, perubahan font atau warna akan langsung diterapkan secara instan tanpa perlu menutup terminal.

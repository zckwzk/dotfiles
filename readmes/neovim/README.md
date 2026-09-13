# ⚡ Neovim (LazyVim) Configuration Guide

- **Config directory**: `~/.config/nvim/`
- **Distro / Framework**: [LazyVim](https://www.lazyvim.org/)
- **Plugin Manager**: [`lazy.nvim`](https://github.com/folke/lazy.nvim)
- **Leader Key**: `<Space>` (Spasi)

---

## 📂 Struktur Direktori Neovim

```text
~/.config/nvim/
├── init.lua                   # Titik masuk utama Neovim
├── lazyvim.json               # Konfigurasi extras yang diaktifkan di LazyVim
├── lazy-lock.json             # Kunci hash commit versi plugin (menjaga kestabilan)
├── stylua.toml                # Konfigurasi formatter Lua
└── lua/
    ├── config/
    │   ├── lazy.lua           # Inisialisasi package manager lazy.nvim
    │   ├── options.lua        # Pengaturan umum Vim (line numbers, indentasi, dll.)
    │   ├── keymaps.lua        # Pemetaan tombol kustom Anda
    │   └── autocmds.lua       # Event otomatisasi (mis: auto format on save)
    └── plugins/
        ├── example.lua        # Contoh template penambahan/override plugin
        └── ...                # File spesifikasi plugin kustom Anda
```

---

## ⌨️ Shortcut Penting LazyVim

### 🔍 Navigasi & Pencarian File
| Shortcut | Aksi |
| :--- | :--- |
| `<Space> <Space>` | Cari dan buka file (*Find Files*) |
| `<Space> e` | Buka / tutup file explorer sidebar (*Neo-tree*) |
| `<Space> /` | Pencarian teks secara global di seluruh project (*Live Grep*) |
| `<Space> f b` | Cari buffer / tab yang sedang aktif (*Find Buffers*) |
| `<Space> f r` | Buka file yang baru saja diakses (*Recent Files*) |

### 📑 Manajemen Buffer & Tab
| Shortcut | Aksi |
| :--- | :--- |
| `]b` | Pindah ke buffer / file berikutnya di sebelah kanan |
| `[b` | Pindah ke buffer / file sebelumnya di sebelah kiri |
| `<Space> b d` | Tutup buffer aktif saat ini |
| `<Space> b o` | Tutup semua buffer lain kecuali yang aktif |

### 🛠️ Manajemen Plugin & Perkakas
| Shortcut / Perintah | Aksi |
| :--- | :--- |
| `<Space> l` atau `:Lazy` | Buka menu antarmuka **Lazy.nvim** (status plugin, update, log) |
| `<Space> c m` atau `:Mason` | Buka menu antarmuka **Mason** (install LSP server, linter, formatter) |
| `:Lazy update` | Memperbarui seluruh plugin ke commit terbaru |
| `:Lazy sync` | Menyelaraskan plugin sesuai dengan `lazy-lock.json` |

---

## 🧩 Cara Menambahkan Plugin Kustom

Untuk memasang plugin baru, cukup buat berkas baru di dalam folder `lua/plugins/`.  
Contoh: membuat file `lua/plugins/colorscheme.lua`:

```lua
return {
  -- Tambahkan tema Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
    },
  },
  -- Terapkan tema sebagai warna bawaan LazyVim
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
```

Setelah disimpan, jalankan `:Lazy` untuk melihat instalasi otomatis. Jangan lupa simpan perubahan ke repositori dotfiles dengan:
```bash
df-add ~/.config/nvim/
df-commit -m "feat(nvim): add catppuccin theme"
```

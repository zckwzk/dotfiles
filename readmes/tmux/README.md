# 🪟 Tmux Configuration & Plugins Guide

- **Config file**: `~/.tmux.conf`
- **Plugin directory**: `~/.tmux/plugins/`
- **Theme**: Catppuccin Mocha
- **Primary Prefix**: `Ctrl-a` *(secondary: `Ctrl-b`)*

---

## 🔌 Installed Plugins

Plugins are managed via **TPM (Tmux Plugin Manager)**.

### 1. `tmux-plugins/tpm` (Tmux Plugin Manager)
- **Fungsi**: Manajer plugin untuk Tmux. Memungkinkan instalasi, update, dan penghapusan plugin dengan mudah via Git.
- **Cara Kerja**: Men-clone repositori plugin ke folder `~/.tmux/plugins/` dan memuatnya secara dinamis saat Tmux berjalan.
- **Shortcut Penting**:
  | Shortcut | Aksi |
  | :--- | :--- |
  | `Ctrl-a` lalu `I` *(Shift + i)* | Mengunduh dan memasang plugin baru yang ditambahkan ke `.tmux.conf` |
  | `Ctrl-a` lalu `U` *(Shift + u)* | Memperbarui (*update*) seluruh plugin yang terpasang ke versi terbaru |
  | `Ctrl-a` lalu `Alt + u` | Menghapus folder plugin yang sudah dihapus dari `.tmux.conf` |

---

### 2. `tmux-plugins/tmux-sensible`
- **Fungsi**: Kumpulan konfigurasi standar universal yang disepakati komunitas Tmux.
- **Fitur Utama**:
  - Mengatasi lag input / delay tombol ESC.
  - Memastikan dukungan karakter UTF-8 dan terminal 256-color.
  - Mengatur ukuran history buffer yang nyaman.
  - Menyelaraskan refresh rate status bar.
- **Cara Penggunaan**: Berjalan otomatis di latar belakang tanpa tombol khusus.

---

### 3. `tmux-plugins/tmux-yank`
- **Fungsi**: Integrasi clipboard Tmux langsung ke clipboard sistem operasi (didukung oleh `wl-copy` di Wayland dan `xsel` di X11).
- **Keunggulan**: Teks yang disalin di dalam Tmux bisa langsung di-paste (`Ctrl+v`) ke aplikasi desktop lain (browser, IDE, dokumen).
- **Cara Penggunaan**:
  1. Masuk ke mode salin: Tekan `Ctrl-a` lalu `[` (atau drag kursor mouse di panel teks).
  2. Mulai seleksi teks (jika memakai keyboard): Tekan `v`.
  3. Salin ke clipboard sistem: Tekan `y`.
  4. Mode baris / blok: Tekan `V` untuk seleksi satu baris penuh, atau `Ctrl-v` untuk blok kolom.

---

### 4. `tmux-plugins/tmux-resurrect`
- **Fungsi**: Menyimpan dan memulihkan seluruh sesi Tmux ketika laptop dimatikan, di-reboot, atau Tmux ditutup.
- **Apa saja yang dipulihkan?**:
  - Semua nama sesi, jendela (windows), dan pembagian panel (panes).
  - Susunan layout panel (split horizontal / vertikal).
  - Direktori kerja aktif masing-masing panel (`current working directory`).
  - Riwayat teks di dalam panel (`@resurrect-capture-pane-contents 'on'`).
  - Sesi kerja editor Neovim (`@resurrect-strategy-nvim 'session'`).
- **Cara Penggunaan**:
  | Shortcut | Aksi |
  | :--- | :--- |
  | `Ctrl-a` lalu `Ctrl-s` | Simpan sesi Tmux secara manual *(muncul status "Tmux environment saved!")* |
  | `Ctrl-a` lalu `Ctrl-r` | Pulihkan kembali sesi yang tersimpan *(muncul status "Tmux restore complete!")* |

---

### 5. `tmux-plugins/tmux-continuum`
- **Fungsi**: Otomasi penuh dari `tmux-resurrect` agar Anda tidak perlu mengingat untuk menekan tombol simpan manual.
- **Pengaturan Aktif**:
  - `@continuum-save-interval '15'`: Menyimpan kondisi sesi secara otomatis setiap **15 menit**.
  - `@continuum-restore 'on'`: Secara otomatis memulihkan sesi terakhir saat Tmux server pertama kali dijalankan setelah komputer restart.
- **Cara Penggunaan**: 100% otomatis tanpa perlu intervensi pengguna.

---

## ⌨️ Daftar Lengkap Shortcut Tmux Zakaniwa

### 🧭 Navigasi & Jendela / Panel

| Shortcut | Aksi |
| :--- | :--- |
| `Ctrl-a` lalu `\|` atau `\` | Split panel **horizontal** (membuka panel di sebelah kanan, di folder yang sama) |
| `Ctrl-a` lalu `-` atau `_` | Split panel **vertikal** (membuka panel di sebelah bawah, di folder yang sama) |
| `Ctrl-a` lalu `c` | Buat **jendela baru** (di folder yang sama) |
| `Ctrl-a` lalu `h` | Pindah ke panel **kiri** (Vim-style) |
| `Ctrl-a` lalu `j` | Pindah ke panel **bawah** (Vim-style) |
| `Ctrl-a` lalu `k` | Pindah ke panel **atas** (Vim-style) |
| `Ctrl-a` lalu `l` | Pindah ke panel **kanan** (Vim-style) |
| `Ctrl-a` lalu `H / J / K / L` | Mengubah ukuran (*resize*) panel ke kiri / bawah / atas / kanan |
| `Ctrl-a` lalu `z` | Zoom / Maximize panel aktif (tekan lagi untuk mengembalikan) |
| `Ctrl-a` lalu `x` | Tutup panel aktif saat ini (dengan konfirmasi y/n) |
| `Ctrl-a` lalu `1 .. 9` | Pindah cepat ke nomor jendela tertentu |
| `Ctrl-a` lalu `r` | **Reload konfigurasi** `~/.tmux.conf` secara instan tanpa restart |

### 🖱️ Mouse Support
- **Klik panel**: Mengaktifkan panel.
- **Drag pembatas panel**: Mengubah ukuran split panel secara presisi.
- **Scroll roda mouse**: Otomatis masuk ke mode scrollback / copy mode untuk melihat log sebelumnya.
- **Drag seleksi mouse**: Otomatis menyeleksi dan menyalin teks ke clipboard sistem.

---

## 🚀 Bootstrap Otomatis di Mesin Baru

Konfigurasi `.tmux.conf` sudah dilengkapi logika *auto-bootstrap*:
```tmux
if "test ! -d ~/.tmux/plugins/tpm" \
   "run 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins'"
```
Saat dotfiles dicheckout ke laptop baru dan Tmux pertama kali dibuka, TPM dan semua plugin di atas akan otomatis diunduh dan dipasang secara mandiri.

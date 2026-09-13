# 🐚 Bash & Dotfiles Helpers Guide

- **Config files**:
  - `~/.bashrc` - Skrip inisialisasi shell interaktif utama
  - `~/.bash_profile` - Skrip login shell
  - `~/.bashrc.d/dotfiles.bash` - Helper fungsi & alias repositori bare Git
- **Folder modular**: `~/.bashrc.d/`

---

## 🏗️ Arsitektur Modular `.bashrc.d/`

Berkas `.bashrc` Anda dikonfigurasi untuk memuat seluruh berkas skrip yang berada di dalam `~/.bashrc.d/*.bash` secara otomatis saat terminal dibuka:

```bash
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
```

### Keuntungan:
1. **Bersih & Rapi**: Anda tidak perlu menumpuk ratusan baris alias di satu file `.bashrc`.
2. **Mudah Dikelola**: Setiap topik (misalnya: `dotfiles.bash`, `waydroid.bash`, alias project kerjaan, dll.) dipisahkan dalam file masing-masing.

---

## ⚡ Helper Git Bare Repository (`dotfiles.bash`)

Untuk mengelola file dotfiles yang tersebar di `$HOME` tanpa membuat symlink rumit, helper ini menyediakan perintah `dotfiles` dan shortcut cepat.

### 1. Perintah Utama
- **`dotfiles`**: Wrapper resmi untuk `/usr/bin/git --git-dir=$HOME/Documents/dotfiles --work-tree=$HOME`. Menerima seluruh argumen standar Git (`status`, `add`, `commit`, `branch`, `diff`, `log`, dll.).
- **Auto-completion**: Terintegrasi langsung dengan bash-completion Git bawaan sistem Fedora. Anda bisa menekan `Tab` setelah mengetik `dotfiles` untuk melengkapi perintah Git (contoh: `dotfiles sta<TAB>` menjadi `dotfiles status`).

### 2. Shortcut Cepat (Daftar Lengkap)

| Alias | Perintah Asli | Deskripsi |
| :--- | :--- | :--- |
| `df-status` | `dotfiles status` | Cek status berkas konfigurasi yang telah diubah atau distage |
| `df-diff` | `dotfiles diff` | Melihat baris perubahan kode/konfigurasi yang belum dicommit |
| `df-log` | `dotfiles log --oneline --graph --decorate -n 15` | Melihat riwayat visual commit dotfiles Anda |
| `df-add <file>` | `dotfiles add <file>` | Mendaftarkan berkas config baru ke dalam pelacakan repositori |
| `df-commit -m '...'` | `dotfiles commit -m '...'` | Menyimpan perubahan konfigurasi dalam commit baru |
| `df-push` | `dotfiles push` | Mengunggah commit ke remote repositori (GitHub/GitLab) |
| `df-help` / `dotfiles-help` | Fungsi bantuan | Menampilkan menu rangkuman helper dalam bahasa Indonesia |

---

## 📝 Cara Menambahkan Konfigurasi Baru ke Dotfiles

Jika Anda baru saja memasang aplikasi baru dan ingin konfigurasinya dilacak oleh dotfiles:

```bash
# 1. Daftarkan file konfigurasinya
df-add ~/.config/nama_aplikasi/config.conf

# 2. Periksa status
df-status

# 3. Buat commit
df-commit -m "feat: tambahkan konfigurasi nama_aplikasi"

# 4. (Opsional) Push ke GitHub jika remote sudah terpasang
df-push
```

---

## 💡 Cara Menambahkan Skrip Baru ke `.bashrc.d/`

Cukup buat file baru berakhiran `.bash` di dalam folder `~/.bashrc.d/`:

```bash
cat << 'EOF' > ~/.bashrc.d/my-custom-aliases.bash
# Alias kustom harian
alias update='sudo dnf upgrade --refresh -y'
alias cls='clear'
alias ll='ls -la --color=auto'
EOF
```

Kemudian reload shell Anda dengan `source ~/.bashrc`.
Skrip tersebut langsung aktif dan bisa didaftarkan ke repositori dengan `df-add ~/.bashrc.d/my-custom-aliases.bash`.

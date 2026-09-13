# 🤖 Waydroid Helper Commands Guide

- **Config file**: `~/.bashrc.d/waydroid.bash`
- **Tujuan**: Memudahkan pengelolaan container Android (Waydroid) di desktop Wayland Linux dengan satu baris perintah.

---

## 📋 Daftar Perintah & Alias

Helper ini menyediakan nama perintah pendek (`wd-*`) maupun nama panjang (`waydroid-*`).

| Perintah Pendek | Perintah Panjang | Fungsi & Penjelasan |
| :--- | :--- | :--- |
| `wd-multiwin` | `waydroid-multiwin` | **Mengaktifkan Multi-Window**: Setiap aplikasi Android terbuka di jendelanya sendiri seperti aplikasi native Linux. Me-restart container secara otomatis. |
| `wd-multiwin-off` | `waydroid-multiwin-off` | **Mematikan Multi-Window**: Menjalankan Waydroid dalam satu jendela penuh (mode single-window / tablet UI). |
| `wd-freeze` | `waydroid-freeze` | **Membekukan Container (Suspend)**: Mem-pause seluruh proses CPU container tanpa mematikan aplikasi Android. Sangat hemat baterai saat tidak dipakai. |
| `wd-resume` | `waydroid-resume` | **Membangunkan Container (Unfreeze)**: Melanjutkan kembali proses container secara instan dan menyambung sesi layar. |
| `wd-session-stop` | `waydroid-session-stop` | **Tutup Sesi Aplikasi**: Menutup antarmuka grafis aplikasi, namun container background tetap berjalan di belakang layar. |
| `wd-stop` | `waydroid-stop` | **Matikan Total**: Menghentikan sesi grafis dan container systemd secara tuntas. Mengosongkan penggunaan RAM secara maksimal. |
| `wd-help` | `waydroid-help` | **Bantuan**: Menampilkan daftar ringkas perintah helper Waydroid ini di terminal. |

---

## 🎯 Contoh Skenario Penggunaan

### 1. Ingin menjalankan aplikasi Android berdampingan dengan browser & terminal
Cukup jalankan:
```bash
wd-multiwin
```
Lalu buka aplikasi Android Anda (misal: WhatsApp, Telegram Android, atau game) dari menu aplikasi desktop.

### 2. Ingin menghemat baterai saat jeda istirahat
Daripada mematikan total dan harus menunggu boot ulang aplikasi:
```bash
wd-freeze
```
Ketika ingin melanjutkan kembali:
```bash
wd-resume
```

### 3. Selesai menggunakan Waydroid dan ingin RAM laptop kembali lega
```bash
wd-stop
```

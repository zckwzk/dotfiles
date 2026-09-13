# ==========================================
# Waydroid Aliases & Helpers
# ==========================================

# 1. Aliases Operasional
alias waydroid-multiwin="waydroid prop set persist.waydroid.multi_windows true && sudo systemctl restart waydroid-container"
alias wd-multiwin="waydroid-multiwin"

alias waydroid-multiwin-off="waydroid prop set persist.waydroid.multi_windows false && sudo systemctl restart waydroid-container"
alias waydroid-multiwin-off="waydroid-multiwin-off"

alias waydroid-session-stop="waydroid session stop"
alias wd-session-stop="waydroid session stop"

alias waydroid-stop="waydroid session stop && sudo waydroid container stop"
alias wd-stop="waydroid-stop"

alias waydroid-freeze="sudo waydroid container freeze"
alias wd-freeze="sudo waydroid container freeze"

alias waydroid-resume="sudo waydroid container unfreeze && waydroid session start"
alias wd-resume="waydroid-resume"

# 2. Command Bantuan (Daftar & Penjelasan Perintah)
waydroid-help() {
  echo -e "\033[1;34m=== Daftar Perintah / Alias Waydroid ===\033[0m"
  printf "  \033[1;32m%-20s\033[0m : %s\n" "wd-multiwin" "Aktifkan mode multi-window & restart container"
  printf "  \033[1;32m%-20s\033[0m : %s\n" "wd-multiwin-off" "Matikan mode multi-window & restart container"
  printf "  \033[1;32m%-20s\033[0m : %s\n" "wd-session-stop" "Tutup sesi aplikasi (container tetap aktif)"
  printf "  \033[1;32m%-20s\033[0m : %s\n" "wd-stop" "Matikan total session & container (hemat RAM)"
  printf "  \033[1;32m%-20s\033[0m : %s\n" "wd-freeze" "Bekukan container / suspend sementara"
  printf "  \033[1;32m%-20s\033[0m : %s\n" "wd-resume" "Bangunkan kembali (unfreeze) & mulai sesi"
  printf "  \033[1;32m%-20s\033[0m : %s\n" "wd-help" "Tampilkan daftar perintah dan bantuan ini"
  echo -e "\033[0;33mTip:\033[0m Anda juga bisa mengetik versi panjang \033[1mwaydroid-*\033[0m (contoh: \033[1mwaydroid-stop\033[0m)."
}
wd-help() {
  waydroid-help
}

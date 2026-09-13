# ==========================================
# Dotfiles Git Bare Repository Helpers
# ==========================================

export DOTFILES_DIR="${HOME}/Documents/dotfiles"

# 1. Main Function & Alias for Git Bare Repository
dotfiles() {
    /usr/bin/git --git-dir="${DOTFILES_DIR}" --work-tree="${HOME}" "$@"
}
alias dotfiles="/usr/bin/git --git-dir=\"${DOTFILES_DIR}\" --work-tree=\"${HOME}\""

# Quick shortcuts
alias df-status="dotfiles status"
alias df-diff="dotfiles diff"
alias df-log="dotfiles log --oneline --graph --decorate -n 15"
alias df-add="dotfiles add"
alias df-commit="dotfiles commit"
alias df-push="dotfiles push"

# 2. Bash Auto-completion for 'dotfiles'
if [ -f /usr/share/bash-completion/completions/git ]; then
    . /usr/share/bash-completion/completions/git
fi
if type __git_complete &>/dev/null; then
    __git_complete dotfiles __git_main
elif type _git &>/dev/null; then
    complete -o default -o nospace -F _git dotfiles
fi

# 3. Command Bantuan (Daftar & Penjelasan Perintah Dotfiles)
dotfiles-help() {
  echo -e "\033[1;34m=== Daftar Perintah / Helper Dotfiles (Git Bare) ===\033[0m"
  printf "  \033[1;32m%-22s\033[0m : %s\n" "dotfiles status" "Cek status file dotfiles yang berubah / terlacak"
  printf "  \033[1;32m%-22s\033[0m : %s\n" "dotfiles add <file>" "Tambahkan file konfigurasi ke dotfiles (mis: ~/.bashrc)"
  printf "  \033[1;32m%-22s\033[0m : %s\n" "dotfiles commit -m '...'" "Commit perubahan pada dotfiles"
  printf "  \033[1;32m%-22s\033[0m : %s\n" "dotfiles diff" "Lihat perubahan kode / config yang belum dicommit"
  printf "  \033[1;32m%-22s\033[0m : %s\n" "dotfiles log" "Lihat riwayat commit konfigurasi"
  printf "  \033[1;32m%-22s\033[0m : %s\n" "dotfiles push" "Upload commit ke remote repo (GitHub / GitLab)"
  printf "  \033[1;32m%-22s\033[0m : %s\n" "df-status / df-diff" "Shortcut cepat untuk cek status & diff"
  printf "  \033[1;32m%-22s\033[0m : %s\n" "df-commit / df-push" "Shortcut cepat untuk commit & push"
  printf "  \033[1;32m%-22s\033[0m : %s\n" "dotfiles-help" "Tampilkan daftar bantuan ini (alias: df-help)"
  echo -e "\033[0;33mTip:\033[0m Perintah \033[1mdotfiles\033[0m menerima semua opsi git standard (add, commit, branch, checkout, dll)."
}

df-help() {
  dotfiles-help
}

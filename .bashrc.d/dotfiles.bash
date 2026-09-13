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

# 3. Help Command (List & Describe Dotfiles Commands)
dotfiles-help() {
  echo -e "\033[1;34m=== Dotfiles (Git Bare) Commands & Helpers ===\033[0m"
  printf "  \033[1;32m%-22s\033[0m : %s\n" "dotfiles status" "Check status of modified/tracked dotfiles"
  printf "  \033[1;32m%-22s\033[0m : %s\n" "dotfiles add <file>" "Add a configuration file to dotfiles (e.g. ~/.bashrc)"
  printf "  \033[1;32m%-22s\033[0m : %s\n" "dotfiles commit -m '...'" "Commit changes in tracked dotfiles"
  printf "  \033[1;32m%-22s\033[0m : %s\n" "dotfiles diff" "View uncommitted modifications"
  printf "  \033[1;32m%-22s\033[0m : %s\n" "dotfiles log" "View visual commit history"
  printf "  \033[1;32m%-22s\033[0m : %s\n" "dotfiles push" "Upload commits to remote repo (GitHub / GitLab)"
  printf "  \033[1;32m%-22s\033[0m : %s\n" "df-status / df-diff" "Quick shortcuts for status & diff"
  printf "  \033[1;32m%-22s\033[0m : %s\n" "df-commit / df-push" "Quick shortcuts for commit & push"
  printf "  \033[1;32m%-22s\033[0m : %s\n" "dotfiles-help" "Show this help menu (alias: df-help)"
  echo -e "\033[0;33mTip:\033[0m The \033[1mdotfiles\033[0m command accepts all standard git options (add, commit, branch, checkout, etc.)."
}

df-help() {
  dotfiles-help
}

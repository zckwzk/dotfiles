# ==========================================
# Waydroid Aliases & Helpers
# ==========================================

# 1. Operational Aliases
alias waydroid-multiwin="waydroid prop set persist.waydroid.multi_windows true && sudo systemctl restart waydroid-container"
alias wd-multiwin="waydroid-multiwin"

alias waydroid-multiwin-off="waydroid prop set persist.waydroid.multi_windows false && sudo systemctl restart waydroid-container"
alias wd-multiwin-off="waydroid-multiwin-off"

alias waydroid-session-stop="waydroid session stop"
alias wd-session-stop="waydroid session stop"

alias waydroid-stop="waydroid session stop && sudo waydroid container stop"
alias wd-stop="waydroid-stop"

alias waydroid-freeze="sudo waydroid container freeze"
alias wd-freeze="sudo waydroid container freeze"

alias waydroid-resume="sudo waydroid container unfreeze && waydroid session start"
alias wd-resume="waydroid-resume"

# 2. Help Command (Command List & Descriptions)
waydroid-help() {
  echo -e "\033[1;34m=== Waydroid Aliases & Helpers ===\033[0m"
  printf "  \033[1;32m%-20s\033[0m : %s\n" "wd-multiwin" "Enable multi-window mode & restart container"
  printf "  \033[1;32m%-20s\033[0m : %s\n" "wd-multiwin-off" "Disable multi-window mode & restart container"
  printf "  \033[1;32m%-20s\033[0m : %s\n" "wd-session-stop" "Stop GUI app session (container keeps running)"
  printf "  \033[1;32m%-20s\033[0m : %s\n" "wd-stop" "Fully stop session & container (frees RAM)"
  printf "  \033[1;32m%-20s\033[0m : %s\n" "wd-freeze" "Freeze / suspend container processes"
  printf "  \033[1;32m%-20s\033[0m : %s\n" "wd-resume" "Unfreeze container & resume session"
  printf "  \033[1;32m%-20s\033[0m : %s\n" "wd-help" "Display this command list and help"
  echo -e "\033[0;33mTip:\033[0m You can also run the full names \033[1mwaydroid-*\033[0m (e.g. \033[1mwaydroid-stop\033[0m)."
}
wd-help() {
  waydroid-help
}

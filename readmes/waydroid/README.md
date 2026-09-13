# 🤖 Waydroid Helper Commands Guide

- **Config file**: `~/.bashrc.d/waydroid.bash`
- **Purpose**: Convenient management of Waydroid (Android container) on Linux Wayland desktop environments using streamlined single-line commands.

---

## 📋 Command & Alias Reference

Both short convenience commands (`wd-*`) and explicit names (`waydroid-*`) are available:

| Short Command | Full Command | Description & Purpose |
| :--- | :--- | :--- |
| `wd-multiwin` | `waydroid-multiwin` | **Enable Multi-Window**: Each Android app opens in its own floating desktop window as if it were a native Linux application. Automatically restarts the container. |
| `wd-multiwin-off` | `waydroid-multiwin-off` | **Disable Multi-Window**: Runs Waydroid within a single consolidated tablet-style window. |
| `wd-freeze` | `waydroid-freeze` | **Freeze / Suspend Container**: Pauses all container CPU processes without closing Android apps. Great for conserving battery life when stepping away. |
| `wd-resume` | `waydroid-resume` | **Resume / Unfreeze Container**: Instantly unfreezes container processes and resumes active screen sessions. |
| `wd-session-stop` | `waydroid-session-stop` | **Stop App Session**: Closes graphical app windows while keeping background container services running. |
| `wd-stop` | `waydroid-stop` | **Full Stop**: Completely terminates both GUI sessions and the systemd container. Maximizes available system RAM. |
| `wd-help` | `waydroid-help` | **Help Menu**: Displays a quick summary of Waydroid commands directly in your terminal. |

---

## 🎯 Common Workflow Scenarios

### 1. Running Android apps alongside browser & terminal windows
Run:
```bash
wd-multiwin
```
Then launch Android apps from your desktop application launcher.

### 2. Conserving laptop battery during a break
Rather than shutting down completely and waiting for cold boot:
```bash
wd-freeze
```
When you return:
```bash
wd-resume
```

### 3. Done using Android apps and want all RAM freed
```bash
wd-stop
```

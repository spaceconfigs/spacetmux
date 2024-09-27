#!/usr/bin/env bash
# prefix f: find / config menu
source "$(dirname "$0")/common.sh"

case "${1:-}" in
edit)
    menu "Edit / reload config" \
        "Open in nvim"    d "new-window 'nvim \"$MYTMUXRC\"'" \
        "Reload config"   R "run-shell 'tmux source-file \"$MYTMUXRC\"; tmux display-message Reloaded-config'" \
        "Install plugins" U "run-shell '$TMUX_PLUGIN_MANAGER_PATH/bin/install_plugins'"
    ;;
*)
    menu "Find / config" \
        "Edit config..." e "$(submenu config.sh edit)" \
        "Rename window"  R "command-prompt -p 'Rename window:' 'rename-window \"%%\"'"
    ;;
esac

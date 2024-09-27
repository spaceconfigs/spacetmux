#!/usr/bin/env bash
# prefix b: buffer / window menu
source "$(dirname "$0")/common.sh"

case "${1:-}" in
new)
    menu "New" \
        "New terminal/session" f "run-shell 'ghostty -e tmux new-session'"
    ;;
*)
    menu "Buffer / window" \
        "List with preview" b "display-popup -w 100% -h 100% -E '$SCRIPTS/window-picker.sh'" \
        "Choose tree"       B "choose-tree -Zw" \
        "Clear history"     e "clear-history" \
        "Previous window"   p "previous-window" \
        "Next window"       n "next-window" \
        "New window"        s "new-window -c '#{pane_current_path}'" \
        "Delete window"     d "kill-window" \
        "New..."            N "$(submenu buffer.sh new)"
    ;;
esac

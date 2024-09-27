#!/usr/bin/env bash
# prefix C-x: move menu
source "$(dirname "$0")/common.sh"

case "${1:-}" in
tab)
    menu "Move tab" \
        "Move to target" r "command-prompt -p 'Move tab to:' 'move-window -t \"%%\"'"
    ;;
*)
    menu "Move" \
        "Tab..." t "$(submenu move.sh tab)"
    ;;
esac

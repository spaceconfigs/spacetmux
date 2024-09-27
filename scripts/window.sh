#!/usr/bin/env bash
# prefix t: window actions menu
source "$(dirname "$0")/common.sh"

case "${1:-}" in
list)
    menu "List actions" \
        "Quit" q ""
    ;;
*)
    menu "Window actions" \
        "List"               l "$(submenu window.sh list)" \
        "Delete this window" d "confirm-before -p 'Delete this window? (y/n)' kill-window" \
        "Cancel"             q ""
    ;;
esac

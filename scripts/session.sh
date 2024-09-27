#!/usr/bin/env bash
# prefix l: session menu
source "$(dirname "$0")/common.sh"

menu "Session" \
    "Delete session"    d   "kill-session" \
    "List with preview" l   "display-popup -w 100% -h 100% -E '$SCRIPTS/session-picker.sh'" \
    "Choose tree"       L   "choose-tree -Zs" \
    "Rename session"    R   "command-prompt -p 'Rename session:' 'rename-session \"%%\"'" \
    "New session"       s   "command-prompt -p 'New session name:' 'if-shell -F \"#{==:%%,}\" new-session \"new-session -s \\\"%%\\\"\"'" \
    "Last session"      Tab "switch-client -l"

#!/usr/bin/env bash
# prefix F: heavy actions menu
source "$(dirname "$0")/common.sh"

menu "Heavy actions" \
    "Join pane"    b "list-panes -a; command-prompt -p 'join-pane from (session:window.pane):' 'join-pane -s \"%%\"'" \
    "Break pane"   B "break-pane" \
    "New terminal" n "run-shell 'ghostty -e tmux new-session -A'"

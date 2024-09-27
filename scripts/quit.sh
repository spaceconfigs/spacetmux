#!/usr/bin/env bash
# prefix q: quit menu
source "$(dirname "$0")/common.sh"

menu "Quit" \
    "Quit tmux (confirm)" q "confirm-before -p 'Quit tmux? (y/n)' kill-server" \
    "Quit tmux now"       Q "kill-server"

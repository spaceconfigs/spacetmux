#!/usr/bin/env bash
# Shared paths and helpers sourced by every menu script.

# tmux exports these from tmux.conf with a literal `~`; expand it here.
TMUX_HOME="${TMUX_HOME:-$HOME/.config/tmux}"
TMUX_HOME="${TMUX_HOME/#\~/$HOME}"
TMUX_PLUGIN_MANAGER_PATH="${TMUX_PLUGIN_MANAGER_PATH:-$HOME/.local/share/tmux/plugins}"
TMUX_PLUGIN_MANAGER_PATH="${TMUX_PLUGIN_MANAGER_PATH/#\~/$HOME}"
TMUX_PLUGIN_MANAGER_PATH="${TMUX_PLUGIN_MANAGER_PATH%/}"
MYTMUXRC="$TMUX_HOME/tmux.conf"
SCRIPTS="$TMUX_HOME/scripts"

FZF_COLORS='--color=fg:#b6b8bb,bg:#0c0c0c,hl:#78a9ff,fg+:#78a9ff,bg+:#0c0c0c,hl+:#78a9ff,info:#7b7c7e,prompt:#78a9ff,pointer:#78a9ff,marker:#78a9ff,spinner:#78a9ff,header:#b6b8bb,border:#78a9ff'

# menu <title> <label> <key> <command> ...
menu() {
    local title=$1
    shift
    tmux display-menu -x C -y P -T "$title" "$@"
}

# submenu <script> <name>: tmux command that opens another script's sub-menu
submenu() {
    printf "run-shell '%s/%s %s'" "$SCRIPTS" "$1" "$2"
}


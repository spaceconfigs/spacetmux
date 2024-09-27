#!/usr/bin/env bash
# prefix j: jump menu
source "$(dirname "$0")/common.sh"

menu "Jump" \
    "Start tmux-jump" j "run-shell -b \"JUMP_COLOR_DIM='#{@jump-color-dim}' JUMP_COLOR_MATCH='#{@jump-color-match}' JUMP_COLOR_SELECTED='#{@jump-color-selected}' JUMP_COLOR_HINT='#{@jump-color-hint}' $TMUX_PLUGIN_MANAGER_PATH/tmux-jump/tmux-jump.sh\""

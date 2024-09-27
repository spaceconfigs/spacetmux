#!/usr/bin/env bash
# prefix w: window / pane menu
source "$(dirname "$0")/common.sh"

menu "Window / pane" \
    "Resize right 5"   '[' "resize-pane -R 5" \
    "Resize left 5"    ']' "resize-pane -L 5" \
    "Resize up 5"      '{' "resize-pane -U 5" \
    "Resize down 5"    '}' "resize-pane -D 5" \
    "Tiled layout"     =   "select-layout tiled" \
    "Delete pane"      d   "kill-pane" \
    "Split horizontal" V   "split-window -h -c '#{pane_current_path}'" \
    "Split vertical"   S   "split-window -v -c '#{pane_current_path}'" \
    "Select left"      h   "select-pane -L" \
    "Select down"      j   "select-pane -D" \
    "Select up"        k   "select-pane -U" \
    "Select right"     l   "select-pane -R" \
    "Swap down"        J   "swap-pane -D" \
    "Swap up"          K   "swap-pane -U" \
    "Toggle zoom"      m   "resize-pane -Z" \
    "Rotate forward"   r   "rotate-window" \
    "Rotate backward"  R   "rotate-window -D"

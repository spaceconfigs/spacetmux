#!/usr/bin/env bash
# prefix G: window navigation menu
source "$(dirname "$0")/common.sh"

menu "Window navigation" \
    "Next window"     t "next-window" \
    "Previous window" T "previous-window"

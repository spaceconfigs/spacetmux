#!/usr/bin/env bash
# prefix $: agent sidebar menu
source "$(dirname "$0")/common.sh"

menu "Agent sidebar" \
    "Toggle for this window" '$' "run-shell '\"#{@agent_sidebar_bin}\" toggle \"#{window_id}\" \"#{pane_current_path}\"'" \
    "Toggle for all windows" E   "run-shell '\"#{@agent_sidebar_bin}\" toggle-all'"

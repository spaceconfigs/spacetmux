#!/usr/bin/env bash
# C-b: top-level command menu. Each item forwards its key through the prefix table.
source "$(dirname "$0")/common.sh"

menu "tmux" \
    "Buffer / window"   b   "switch-client -T prefix; send-keys -K b" \
    "Find / config"     f   "switch-client -T prefix; send-keys -K f" \
    "Heavy actions"     F   "switch-client -T prefix; send-keys -K F" \
    "Window navigation" G   "switch-client -T prefix; send-keys -K G" \
    "Help"              h   "switch-client -T prefix; send-keys -K h" \
    "Jump"              j   "switch-client -T prefix; send-keys -K j" \
    "Session"           l   "switch-client -T prefix; send-keys -K l" \
    "Quit"              q   "switch-client -T prefix; send-keys -K q" \
    "Window actions"    t   "switch-client -T prefix; send-keys -K t" \
    "Window / pane"     w   "switch-client -T prefix; send-keys -K w" \
    "Last window"       Tab "last-window" \
    "Move"              C-x "switch-client -T prefix; send-keys -K C-x" \
    "Agent sidebar"     '$' "switch-client -T prefix; send-keys -K '\$'" \
    "Command prompt"    :   "switch-client -T prefix; send-keys -K ':'" \
    "List bindings"     ?   "switch-client -T prefix; send-keys -K '?'"

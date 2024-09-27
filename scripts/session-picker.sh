#!/usr/bin/env bash
# Select a session with fzf and preview its active window.
source "$(dirname "$0")/common.sh"

current=$(tmux display-message -p '#{session_name}')

# The first field is hidden from fzf and gives the preview script an exact
# window target. The second is the session target used after selection.
list=$(tmux list-sessions -F $'#{session_name}:#{session_active_window_index}\t#{session_name}\t#{session_windows}\t#{?session_attached,attached,detached}' \
    | sort -t $'\t' -k2,2 \
    | awk -F '\t' 'BEGIN { OFS="\t" } {
        windows = $3 == 1 ? "1 window" : $3 " windows"
        print $1, $2, windows, $4
    }')

pos=$(printf '%s\n' "$list" | awk -F '\t' -v current="$current" '$2 == current { print NR; exit }')

fzf_args=(
    --layout=default
    --delimiter=$'\t' --with-nth=2..
    --prompt='session> '
    "$FZF_COLORS"
    --preview="$SCRIPTS/window-preview.sh {1}"
    --preview-window=up:80%
)
# fzf reads its input asynchronously, so the requested row may not exist yet
# when the start event fires. Wait until the full session list has loaded.
[ -n "$pos" ] && fzf_args+=(--bind "load:pos($pos)")

selected=$(printf '%s\n' "$list" | fzf "${fzf_args[@]}") || exit
[ -n "$selected" ] && tmux switch-client -t "$(printf '%s' "$selected" | cut -f2)"

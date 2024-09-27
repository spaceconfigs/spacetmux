#!/usr/bin/env bash
# prefix b b: fzf window picker with a live preview of the highlighted window.
# Enter switches to it; a query that matches nothing creates a window with that name.
source "$(dirname "$0")/common.sh"

session=$(tmux display-message -p '#{session_name}')
current=$(tmux display-message -p '#{session_name}:#{window_index}')

# Hidden first field is the switch target; fzf shows session and window (tab)
# name. Sorted by session, then numerically by window index.
list=$(tmux list-windows -a -F $'#{session_name}\t#{window_index}\t#{window_name}' \
    | sort -t $'\t' -k1,1 -k2,2n \
    | awk -F '\t' '{ printf "%s:%s\t%s\t%s\n", $1, $2, $1, $3 }')

pos=$(printf '%s\n' "$list" | awk -F '\t' -v c="$current" '$1 == c { print NR; exit }')

fzf_args=(
    --print-query --layout=default
    --delimiter=$'\t' --with-nth=2..
    --prompt='window> '
    "$FZF_COLORS"
    --preview="$SCRIPTS/window-preview.sh {1}"
    --preview-window=up:80%
)
# fzf reads its input asynchronously, so the requested row may not exist yet
# when the start event fires. Wait until the full window list has loaded.
[ -n "$pos" ] && fzf_args+=(--bind "load:pos($pos)")

out=$(printf '%s\n' "$list" | fzf "${fzf_args[@]}")
status=$?
mapfile -t lines <<<"$out"
query=${lines[0]}
selected=${lines[1]}

if [ $status -eq 0 ] && [ -n "$selected" ]; then
    tmux switch-client -t "${selected%%$'\t'*}"
elif [ $status -eq 1 ] && [ -n "$query" ]; then
    tmux new-window -t "$session:" -n "$query"
fi

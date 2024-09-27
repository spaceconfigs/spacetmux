#!/usr/bin/env bash
# window-preview.sh <session:window>: print every pane of a window laid out as
# it is on screen. `capture-pane` only grabs one pane, so split windows are
# stitched together here (plain text; a single-pane window keeps its colours).
target=$1

if [ "$(tmux display-message -p -t "$target" '#{window_panes}')" -eq 1 ]; then
    exec tmux capture-pane -ep -t "$target"
fi

{
    tmux display-message -p -t "$target" '#{window_width} #{window_height}'
    tmux list-panes -t "$target" -F '#{pane_id} #{pane_left} #{pane_top} #{pane_width} #{pane_height}' |
        while read -r id left top width height; do
            echo "P $left $top $width $height"
            tmux capture-pane -p -t "$id" | sed 's/^/L /'
        done
} | LC_ALL=${LC_ALL:-C.UTF-8} gawk '
    NR == 1 {
        W = $1; H = $2
        for (y = 0; y < H; y++) for (x = 0; x < W; x++) cell[y, x] = " "
        next
    }
    $1 == "P" {
        left = $2; top = $3; width = $4; height = $5; row = 0
        # Borders sit just left of / above a pane that does not touch the edge.
        if (left > 0) for (y = top - (top > 0); y < top + height; y++) cell[y, left - 1] = "│"
        if (top > 0) for (x = left; x < left + width; x++) cell[top - 1, x] = "─"
        next
    }
    {
        if (row >= height) next
        n = split(substr($0, 3), ch, "")
        for (i = 1; i <= n && i <= width; i++) cell[top + row, left + i - 1] = ch[i]
        row++
    }
    END {
        # Turn vertical borders into junctions where a horizontal one meets them.
        for (y = 0; y < H; y++) for (x = 0; x < W; x++) {
            if (cell[y, x] != "│") continue
            l = x > 0 && cell[y, x - 1] == "─"
            r = x < W - 1 && cell[y, x + 1] == "─"
            if (l && r) cell[y, x] = "┼"
            else if (r) cell[y, x] = "├"
            else if (l) cell[y, x] = "┤"
        }
        for (y = 0; y < H; y++) {
            line = ""
            for (x = 0; x < W; x++) line = line cell[y, x]
            sub(/ +$/, "", line)
            print line
        }
    }
'

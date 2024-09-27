#!/usr/bin/env bash
# Nightfox colors for Tmux
# Style: carbonfox
# Upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/carbonfox/carbonfox.tmux
set -g mode-style "fg=#0c0c0c,bg=#b6b8bb"
set -g message-style "fg=#b6b8bb,bg=default"
set -g message-command-style "fg=#b6b8bb,bg=default"
set -g menu-style "fg=#b6b8bb,bg=#0c0c0c"
set -g menu-selected-style "fg=#0c0c0c,bg=#b6b8bb,bold"
set -g menu-border-style "fg=#78a9ff,bg=#0c0c0c"
set -g menu-border-lines "rounded"
set -g popup-style "fg=#b6b8bb,bg=#0c0c0c"
set -g popup-border-style "fg=#78a9ff,bg=#0c0c0c"
set -g popup-border-lines "rounded"
set -g pane-border-style "fg=#b6b8bb"
set -g pane-active-border-style "fg=#78a9ff"
set -g pane-border-status off
set -g clock-mode-colour blue
setw -g clock-mode-colour colour135
set -g status "on"
set -g status-position bottom
set -g status-justify "left"
set -g status-style "fg=#b6b8bb,bg=default"
set -g status-left-length "100"
set -g status-right-length "100"
set -g status-left-style NONE
set -g status-right-style NONE
set -g status-left ""
set -g status-right "#[fg=#78a9ff,bold] #S "
setw -g window-status-activity-style "underscore,fg=#7b7c7e,bg=default"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#7b7c7e,bg=default"
setw -g window-status-format "#{?#{==:#{window_name},__window_picker__},, #I  #W #F }"
setw -g window-status-current-format "#{?#{==:#{window_name},__window_picker__},,#[fg=#78a9ff]#[bold] #I  #W #F }"

# Plugin colors
set -g @jump-color-dim      'fg=#7b7c7e,dim'
set -g @jump-color-match    'fg=#b6b8bb,bg=#0c0c0c,bold'
set -g @jump-color-selected 'fg=#0c0c0c,bg=#78a9ff,bold'
set -g @jump-color-hint     'fg=#0c0c0c,bg=#b6b8bb,bold'

#!/usr/bin/env bash

. $HOME/.cache/wal/colors.sh

cat > zathurarc << EOF
# Zathura config

set selection-clipboard clipboard
set window-title-basename true
set statusbar-basename true
set incremental-search true

# Keyboard mappings
unmap f
map f toggle_fullscreen
map [fullscreen] f toggle_fullscreen
map <C-i> zoom in
map <C-o> zoom out

# Open document in fit-width mode by default
set adjust-open "best-fit"

# One page per row by default
set pages-per-row 1

# Stop at page boundries
set scroll-page-aware "true"
set smooth-scroll "true"
set scroll-full-overlap 0.01
set scroll-step 100
set render-loading "false"
set scroll-step 50

# Zoom settings
set zoom-min 10
set guioptions ""

# Font
set font "hack 15"

# Set default color to not inverse color
set recolor "false"
set recolor-lightcolor "#000000" #00
set recolor-darkcolor "#E0E0E0" #06
set recolor-reverse-video "true"
set recolor-keephue "true"

# Colors
set completion-bg "$background"
set completion-fg "$foreground"
set completion-group-bg "$background"
set completion-group-fg "$color2"
set completion-highlight-bg "$foreground"
set completion-highlight-fg "$background"
set recolor-lightcolor "$background"
set recolor-darkcolor "$foreground"
set default-bg "$background"
set inputbar-bg "$background"
set inputbar-fg "$foreground"
set notification-bg "$background"
set notification-fg "$foreground"
set notification-error-bg "$color1"
set notification-error-fg "$foreground"
set notification-warning-bg "$color1"
set notification-warning-fg "$foreground"
set statusbar-bg "$background"
set statusbar-fg "$foreground"
set index-bg "$background"
set index-fg "$foreground"
set index-active-bg "$foreground"
set index-active-fg "$background"
set render-loading-bg "$background"
set render-loading-fg "$foreground"
set window-title-home-tilde true
set statusbar-basename true
set selection-clipboard clipboard
EOF

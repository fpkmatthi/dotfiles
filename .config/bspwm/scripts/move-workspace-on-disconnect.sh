#!/bin/sh

# Define the laptop screen and target workspace
LAPTOP_SCREEN="$MONITOR"  # Change based on your `xrandr --query` output
TARGET_WORKSPACE="V"

# Workspaces on external monitors (7, 8, 9)
WORKSPACES_TO_MOVE=("VI" "VII" "VIII" "IX" "X")

# Check if external monitors are disconnected
EXTERNAL_MONITORS=$(xrandr --query | grep " connected" | grep -v "$LAPTOP_SCREEN" | cut -d' ' -f1)

echo $EXTERNAL_MONITORS
if [[ -z "$EXTERNAL_MONITORS" ]]; then
    for ws in "${WORKSPACES_TO_MOVE[@]}"; do
        # Move all nodes from workspaces 6, 7, 8, 9, 10 to workspace 5
        bspc node "$(bspc query -N -d "$ws")" -d "$TARGET_WORKSPACE"
    done
fi


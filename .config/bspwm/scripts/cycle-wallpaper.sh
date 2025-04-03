#!/bin/sh

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Ensure the directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Wallpaper directory not found: $WALLPAPER_DIR"
    exit 1
fi

# Pick a random wallpaper
wallpaper=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | shuf -n 1)

# If a wallpaper is found, set it
if [ -n "$wallpaper" ]; then
    feh --bg-scale "$wallpaper"
    echo "Wallpaper set to: $wallpaper"
else
    echo "No images found in $WALLPAPER_DIR"
    exit 1
fi


#!/bin/dash

CHOICE=$(printf "Yes\nNo\n" | xargs -n 1 | rofi -dmenu -p "Close i3?")

if [ "$CHOICE" = "Yes" ]; then
    # Close i3
    echo "closing i3"
    i3-msg exit
elif [ "$CHOICE" = "No" ]; then
    # Don't close i3
    echo "Not closing i3"
fi



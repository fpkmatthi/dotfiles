#!/bin/dash

case $1 in
    on)
        setxkbmap -option caps:swapescape
        ;;
    off)
        setxkbmap -option
        ;;
    *)
        echo "Usage: $0 {on|off}"
        echo "    on  -- switches escape and caps lock using setxkbmap"
        echo "    off -- reset keyboard layout to normal"
        ;;
esac

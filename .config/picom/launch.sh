#!/bin/dash
  
killall -q picom

while pgrep -u "$(id -ru)" -x picom >/dev/null ;do sleep 1; done

picom --config $HOME/.config/picom/picom.conf --experimental-backends -b


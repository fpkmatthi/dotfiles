#!/bin/dash

killall -q polybar

while pgrep -u "$(id -ru)" -x polybar >/dev/null ;do sleep 1; done

monitors=$(mons | grep 'Monitors' | cut -d: -f2 | tr -d '[:space:]')
echo $monitors

if [ $monitors -eq 1 ]; then
  polybar mid &
elif [ $monitors -eq 2 ]; then
  polybar --config=$HOME/.config/polybar/config_multiple_bars left &
  polybar --config=$HOME/.config/polybar/config_multiple_bars mid &
elif [ $monitors -eq 3 ]; then
  polybar --config=$HOME/.config/polybar/config_multiple_bars left &
  polybar --config=$HOME/.config/polybar/config_multiple_bars mid &
  polybar --config=$HOME/.config/polybar/config_multiple_bars right &
fi



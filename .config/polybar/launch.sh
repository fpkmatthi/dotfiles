#!/bin/dash

killall -q polybar

while pgrep -u "$(id -ru)" -x polybar >/dev/null ;do sleep 1; done

polybar --config=$HOME/.config/polybar/config_multiple_bars left &
polybar --config=$HOME/.config/polybar/config_multiple_bars center &
polybar --config=$HOME/.config/polybar/config_multiple_bars right &


# polybar main &
# polybar second &

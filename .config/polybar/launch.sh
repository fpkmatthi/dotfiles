#!/bin/dash

killall -q polybar

while pgrep -u "$(id -ru)" -x polybar >/dev/null ;do sleep 1; done

polybar main &
polybar second &

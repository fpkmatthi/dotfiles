#!/bin/sh

killall -q polybar

while pgrep -u "$(id -ru)" -x polybar >/dev/null ;do sleep 0.5; done

polybar main &


#!/bin/sh
  
killall -q compton

while pgrep -u "$(id -ru)" -x compton >/dev/null ;do sleep 1; done

compton -b


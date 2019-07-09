#!/bin/sh
  
killall -q compton

while pgrep -u "$(id -ru)" -x compton >/dev/null ;do sleep 0.5; done

compton -b


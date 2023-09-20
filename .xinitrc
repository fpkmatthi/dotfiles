#!/bin/sh

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

xrdb ~/.Xresources-xrdp


if [ -f /usr/bin/bspwm ];then
  /usr/bin/prime-offload
  export MONITOR=$(xrandr | grep -Eo "eDP.*" | cut -d ' ' -f1)

  monitors=$(xrandr | grep " connected" | wc -l)
  if [ $monitors -eq 3 ]; then
    export MONITOR2="DVI-I-2-1"
    export MONITOR3="DVI-I-3-2"
    xrandr --output "${MONITOR2}" --mode 1920x1080 --pos 0x0 --rotate normal --output "${MONITOR}" --primary --mode 1920x1080 --pos 3840x0 --rotate normal --output "${MONITOR3}" --mode 1920x1080 --pos 1920x0 --rotate normal
  fi

  exec bspwm
fi

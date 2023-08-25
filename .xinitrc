#!/bin/sh

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

xrdb ~/.Xresources-xrdp


if [ -f /usr/bin/bspwm ];then
  /usr/bin/prime-offload
  export MONITOR=$(xrandr | grep -Eo "eDP.*" | cut -d ' ' -f1)
  export MONITOR2="DVI-I-2-1"
  export MONITOR3="DVI-I-3-2"
  exec bspwm
fi

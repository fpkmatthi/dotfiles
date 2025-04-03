#!/bin/sh

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

xrdb ~/.Xresources

if [ -f /usr/bin/bspwm ];then
  # ~/.bin/export-monitors.sh
  export DESKTOP_SESSION='bspwm'
  exec bspwm
fi

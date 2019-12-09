#!/bin/sh

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

if [ -f /usr/bin/bspwm ];then
  /usr/bin/prime-offload
  exec bspwm
fi

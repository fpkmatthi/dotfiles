#!/bin/sh

get_brightness() {
  if [ -f /usr/bin/light ]; then
    light -G | cut -d '.' -f 1
  elif [ -f /usr/bin/xbacklight ]; then
    xbacklight -get | cut -d '.' -f 1
  fi
}

send_notification() {
  brightness=$(get_brightness)

  icon="/usr/share/icons/rose-pine-icons/48x48/apps/preferences-system-brightness-lock.svg"

  dunstify "      " -I "$icon" -u 0 -t 2000 -h int:value:"${brightness}"  --replace=555
}

increase_brightness() {
  if [ -f /usr/bin/light ]; then
    light -A 4
  elif [ -f /usr/bin/xbacklight ]; then
    xbacklight -inc 7
  fi
  send_notification
}

decrease_brightness() {
  if [ -f /usr/bin/light ]; then
    light -U 4
  elif [ -f /usr/bin/xbacklight ]; then
    xbacklight -dec 7
  fi
  send_notification
}

case $1 in
  up)
    increase_brightness
    ;;
  down)
    decrease_brightness
    ;;
esac

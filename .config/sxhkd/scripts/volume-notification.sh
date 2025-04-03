#!/bin/sh

get_volume() {
  pamixer --get-volume
  # amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

is_mute() {
  pamixer --get-mute
  # amixer get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

send_notification() {
  volume=$(get_volume)

  icon="/usr/share/icons/rose-pine-icons/48x48/apps/preferences-system-brightness-lock.svg"

  if [ "${volume}" = "0" ]; then
    # icon_name="/usr/share/icons/Papirus-Dark/16x16/panel/audio-volume-muted.svg"
    dunstify "${volume}""      " -i "$icon_name" -t 2000 -h int:value:"${volume}" -h string:synchronous:"─" --replace=555
  else
    if [  "${volume}" -lt "10" ]; then
        # icon_name="/usr/share/icons/Papirus-Dark/16x16/panel/audio-volume-low.svg"
        dunstify "${volume}""     " -i "$icon_name" --replace=555 -t 2000
    else
      if [ "${volume}" -lt "30" ]; then
          icon_name="/usr/share/icons/rose-pine-icons/48x48/status/notification-audio-volume-low.svg"
      else
        if [ "${volume}" -lt "70" ]; then
          icon_name="/usr/share/icons/rose-pine-icons/48x48/status/notification-audio-volume-medium.svg"
        else
          icon_name="/usr/share/icons/rose-pine-icons/48x48/status/notification-audio-volume-high.svg"
        fi
      fi
      bar=$(seq -s "─" $((${volume}/5)) | sed 's/[0-9]//g')
      dunstify "${volume}""     ""$bar" -i "$icon_name" -t 2000 -h int:value:"${volume}" -h string:synchronous:"$bar" --replace=555
    fi
  fi
}

increase_volume() {
  pamixer -ui 5
  # amixer set Master on > /dev/null
  # amixer sset Master 6%+ > /dev/null
  send_notification
}

decrease_volume() {
  pamixer -ud 5
  # amixer set Master on > /dev/null
  # amixer sset Master 6%- > /dev/null
  send_notification
}

mute_volume() {
    pamixer --toggle-mute
    # amixer set Master 1+ toggle > /dev/null
    if is_mute ; then
      dunstify -i "/usr/share/icons/rose-pine-icons/48x48/status/notification-audio-volume-muted.svg" --replace=555 -u normal "Mute" -t 2000
    else
      send_notification
    fi
}

case $1 in
  up)
    # Set the volume on (if it was muted)
    increase_volume
    ;;
  down)
    decrease_volume
    ;;
  mute)
    mute_volume
    ;;
esac

#!/bin/dash

get_brightness() {
    xbacklight -get | cut -d '.' -f 1
}

send_notification() {
    brightness=$(get_brightness)

    icon_name="/usr/share/icons/Papirus-Dark/16x16/apps/preferences-system-brightness-lock.svg"

    bar=$(seq -s "─" $((${brightness}/7)) | sed 's/[0-9]//g')

    dunstify "     ""$bar" -i "$icon_name" -t 2000 -h int:value:"${brightness}" -h string:synchronous:"$bar" --replace=555
}


case $1 in
    up)
        xbacklight -inc 7
        send_notification
        ;;
    down)
        xbacklight -dec 7
        send_notification
        ;;
esac

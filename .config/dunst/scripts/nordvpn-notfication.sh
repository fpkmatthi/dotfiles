#!/bin/dash

is_connected() {
    nordvpn status | grep Connected
}

send_notification() {
    status=$(nordvpn status)

    if is_connected ;then
        ip=$(nordvpn status | grep  IP | cut -d ':' -f 2 | xargs)
        country=$(nordvpn status | grep Country | cut -d ':' -f 2 | xargs)
        protocol=$(nordvpn status | grep protocol | cut -d ':' -f 2 | xargs)
        dunstify 'NordVPN' "\n${ip}\n${country}\n${protocol}"
    else
        status='Disconnected'
        dunstify 'NordVPN' 'Disconnected'
    fi
}

send_notification

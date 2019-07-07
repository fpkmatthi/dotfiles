#!/bin/sh

STATUS=$(nordvpn status | grep Status | tr -d ' ' | cut -d ':' -f2)

if [ "$STATUS" = "Disconnected" ]; then
    nordvpn connect
else
    nordvpn disconnect
fi

sh $HOME/.scripts/vpn-nordvpn-status.sh

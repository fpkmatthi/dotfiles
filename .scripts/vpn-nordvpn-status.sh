#!/bin/sh

STATUS=$(nordvpn status | grep Status | tr -d ' ' | cut -d ':' -f2)

if [ "$STATUS" = "Connected" ]; then
    echo "%{F#60f542}ﱾ $(nordvpn status | grep IP | tr -d ' ' | cut -d ':' -f2)%{F-}"
else
    echo "%{F#f54242}ﱾ%{F-}"
fi

#!/bin/dash

if ! updates_arch=$(pacman -Qum 2> /dev/null | wc -l ); then
    updates_arch=0
fi

if ! updates_aur=$(yay -Qum 2> /dev/null | wc -l); then
    updates_aur=0
fi

updates=`expr $updates_arch + $updates_aur`

if [ "$updates" -gt 0 ]; then
    echo "ﮮ $updates"
else
    echo ""
fi

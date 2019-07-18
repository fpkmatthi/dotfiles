#!/bin/sh

### TODO: at least try to get this working u lazy fuck

BATTERYSTATUS=$(cat /sys/class/power_supply/BAT0/uevent | grep POWER_SUPPLY_ENERGY | grep -v DESIGN)

FULL=$(echo "$BATTERYSTATUS" | grep FULL | cut -d "=" -f 2)

NOW=$(echo "$BATTERYSTATUS" | grep NOW | cut -d "=" -f 2)

echo "$FULL"
echo "$NOW"
echo "$((($FULL-$NOW)/$NOW))"

echo "(37230000-36430000)/36430000" | bc -l

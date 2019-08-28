#!/bin/dash

root=$(df -h | grep "/dev/mapper/ssdVG-root" | egrep -o "[0-9]{1,2}%")
home=$(df -h | grep "/dev/mapper/hddVG-home" | egrep -o "[0-9]{1,2}%")

echo "ﲂ ${root}   ${home}"

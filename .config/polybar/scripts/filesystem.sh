#!/bin/dash

root=$(df -h | grep "/dev/mapper/rootVG-root" | egrep -o "[0-9]{1,2}%")
home=$(df -h | grep "/dev/mapper/homeVG-home" | egrep -o "[0-9]{1,2}%")

echo "ﲂ ${root}   ${home}"

#!/bin/dash

root=$(df -h | grep "/dev/mapper/rootVG-root" | grep -Eo "[0-9]{1,2}%")
home=$(df -h | grep "/dev/mapper/homeVG-home" | grep -Eo "[0-9]{1,2}%")

echo "ﲂ ${root}   ${home}"

#!/bin/sh

root=$(df -h | grep "/dev/mapper/vg0-root" | grep -Eo "[0-9]{1,2}%")
home=$(df -h | grep "/dev/mapper/vg0-home" | grep -Eo "[0-9]{1,2}%")

echo "󰞄 ${root}  󰋜 ${home}"

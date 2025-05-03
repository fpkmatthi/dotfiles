#!/bin/sh

root=$(df -h | grep "/dev/mapper/ArchinstallVg-root" | grep -Eo "[0-9]{1,2}%")
home=$(df -h | grep "/dev/mapper/ArchinstallVg-home" | grep -Eo "[0-9]{1,2}%")

echo "󰞄 ${root}  󰋜 ${home}"

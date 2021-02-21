#!/bin/bash
monitors=$(xrandr | grep connected | cut -d ' ' -f1-2)

connected=$(echo "${monitors}" | grep " connected" | cut -d ' ' -f 1)
echo "${connected}"
disconnected=$(echo "${monitors}" | grep " disconnected" | cut -d ' ' -f 1)
echo "${disconnected}"
echo "---"


echo -e "connected: \n${connected}"
echo -e "disconnected: \n${disconnected}"

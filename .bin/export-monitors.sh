#!/usr/bin/env bash

export MONITOR=$(xrandr | grep -Eo "eDP.*" | cut -d ' ' -f1)

# monitors=$(xrandr | grep " connected" | wc -l)

if autorandr --detected | grep -q "portablescreen"; then
  export MONITOR2="DP-2"
  autorandr portablescreen
elif autorandr --detected | grep -q "office"; then
  export MONITOR2="HDMI-1"
  autorandr office
elif autorandr --detected | grep -q "docked"; then
  export MONITOR2="DVI-I-1-1"
  export MONITOR3="DVI-I-2-2"
  autorandr docked
fi


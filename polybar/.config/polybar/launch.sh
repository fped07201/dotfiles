#!/usr/bin/env bash

killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 0.1; done

# Start primary FIRST (tray owner)
polybar i3-primary &

# Start secondary bars
for m in $(polybar --list-monitors | cut -d: -f1 | grep -v eDP-1); do
  MONITOR=$m polybar i3-secondary &
done


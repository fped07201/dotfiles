#!/bin/bash
# Multi-monitor setup script with optional arguments and robust sync

# Default monitor names
DEFAULT_LEFT="eDP-1"
DEFAULT_MIDDLE="DP-2-1"
DEFAULT_RIGHT="DP-2-2"

# Assign from arguments or use defaults
left="${1:-$DEFAULT_LEFT}"
middle="${2:-$DEFAULT_MIDDLE}"
right="${3:-$DEFAULT_RIGHT}"

echo "Configuring monitors:"
echo "  Left: $left"
echo "  Middle: $middle"
echo "  Right: $right"

# Turn off middle and right monitors
xrandr --output "$middle" --off
xrandr --output "$right" --off

# Wait until they're actually off
for monitor in "$middle" "$right"; do
  while xrandr --query | grep -q "^$monitor connected.*[0-9]\+x[0-9]\+.*"; do
    sleep 0.1
  done
done

# Set up the monitors
xrandr \
  --output "$left"   --primary --mode 1920x1080 --pos 0x0 \
  --output "$middle" --mode 1920x1080 --pos 1920x0 \
  --output "$right"  --mode 1920x1080 --pos 3840x0

# Small delay to ensure monitors are registered
sleep 0.2

# Launch polybar on all monitors
while pgrep -x polybar >/dev/null; do sleep 0.1 && killall -q polybar; done

# Start primary FIRST (tray owner)
MONITOR=$left polybar i3-primary &

# Start secondary bars
MONITOR=$middle polybar i3-secondary &
MONITOR=$right  polybar i3-secondary &

# Wallpaper
feh --bg-fill /home/fpedrera/Pictures/Wallpapers/kamehouse.jpg


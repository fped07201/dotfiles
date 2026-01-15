#!/bin/bash
# Multi-monitor setup script (layout + polybar)

set -e

# Source detection
. "$HOME/.config/scripts/monitors_detect.sh"

echo "Configuring monitors:"
echo "  Left:   ${LEFT}"
echo "  Middle: ${MIDDLE:-<none>}"
echo "  Right:  ${RIGHT:-<none>}"

MIDDLE_MON=${MIDDLE:-$LEFT}
RIGHT_MON=${RIGHT:-$LEFT}

# Turn off external monitors
[ -n "$MIDDLE" ] && xrandr --output "$MIDDLE" --off
[ -n "$RIGHT" ]  && xrandr --output "$RIGHT"  --off

# Wait until they're really off
for monitor in "$MIDDLE" "$RIGHT"; do
  [ -z "$monitor" ] && continue
  while xrandr --query | grep -q "^$monitor connected.*[0-9]\+x[0-9]\+"; do
    sleep 0.1
  done
done

# Apply layout
xrandr \
  --output "$LEFT"   --primary --mode 1920x1080 --pos 0x0 \
  ${MIDDLE:+--output "$MIDDLE" --mode 1920x1080 --pos 1920x0} \
  ${RIGHT:+--output "$RIGHT"  --mode 1920x1080 --pos 3840x0}

# Restart polybar cleanly
if pgrep -x polybar >/dev/null; then
    killall -w -9 polybar
fi

# Primary first (tray owner)
MONITOR="$LEFT" polybar i3-primary &
# Secondary bars
[ -n "$MIDDLE" ] && MONITOR="$MIDDLE" polybar i3-secondary &
[ -n "$RIGHT" ]  && MONITOR="$RIGHT"  polybar i3-secondary &

# Wallpaper
feh --bg-fill /home/fpedrera/Pictures/Wallpapers/kamehouse.jpg

i3-msg "workspace 1; move workspace to output $LEFT"
i3-msg "workspace 2; move workspace to output $MIDDLE_MON"
i3-msg "workspace 3; move workspace to output $RIGHT_MON"
i3-msg "workspace 4; move workspace to output $LEFT"
i3-msg "workspace 5; move workspace to output $MIDDLE_MON"
i3-msg "workspace 6; move workspace to output $RIGHT_MON"
i3-msg "workspace 7; move workspace to output $LEFT"
i3-msg "workspace 8; move workspace to output $MIDDLE_MON"
i3-msg "workspace 9; move workspace to output $RIGHT_MON"

# Generate workspace.conf
OUTPUT_FILE="$HOME/.config/i3/workspaces.conf"
cat <<EOL > "$OUTPUT_FILE"
set \$mon1 $LEFT
set \$mon2 $MIDDLE_MON
set \$mon3 $RIGHT_MON

# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
set \$ws1 "1"
set \$ws2 "2"
set \$ws3 "3"
set \$ws4 "4"
set \$ws5 "5"
set \$ws6 "6"
set \$ws7 "7"
set \$ws8 "8"
set \$ws9 "9"

# Distribute workspaces
workspace 1 output \$mon1
workspace 2 output \$mon2 
workspace 3 output \$mon3
workspace 4 output \$mon1
workspace 5 output \$mon2 
workspace 6 output \$mon3
workspace 7 output \$mon1
workspace 8 output \$mon2 
workspace 9 output \$mon3

# switch to workspace
bindsym \$mod+1 workspace number \$ws1
bindsym \$mod+2 workspace number \$ws2
bindsym \$mod+3 workspace number \$ws3
bindsym \$mod+4 workspace number \$ws4
bindsym \$mod+5 workspace number \$ws5
bindsym \$mod+6 workspace number \$ws6
bindsym \$mod+7 workspace number \$ws7
bindsym \$mod+8 workspace number \$ws8
bindsym \$mod+9 workspace number \$ws9
bindsym \$mod+Next workspace next_on_output
bindsym \$mod+Prior workspace prev_on_output


# move focused container to workspace
bindsym \$mod+Shift+1 move container to workspace number \$ws1;  workspace number \$ws1
bindsym \$mod+Shift+2 move container to workspace number \$ws2;  workspace number \$ws2
bindsym \$mod+Shift+3 move container to workspace number \$ws3;  workspace number \$ws3
bindsym \$mod+Shift+4 move container to workspace number \$ws4;  workspace number \$ws4
bindsym \$mod+Shift+5 move container to workspace number \$ws5;  workspace number \$ws5
bindsym \$mod+Shift+6 move container to workspace number \$ws6;  workspace number \$ws6
bindsym \$mod+Shift+7 move container to workspace number \$ws7;  workspace number \$ws7
bindsym \$mod+Shift+8 move container to workspace number \$ws8;  workspace number \$ws8
bindsym \$mod+Shift+9 move container to workspace number \$ws9;  workspace number \$ws9
EOL

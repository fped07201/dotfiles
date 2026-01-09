#!/bin/sh

# Fixed internal display
LEFT="eDP-1"

# Get DP outputs (alphabetical)
DP_LIST=$(xrandr --query \
    | grep "^DP-[0-9].* connected" \
    | awk '{print $1}' \
    | sort)

# Extract first and second DP outputs
MIDDLE=$(printf "%s\n" "$DP_LIST" | sed -n '1p')
RIGHT=$(printf "%s\n" "$DP_LIST" | sed -n '2p')

export LEFT MIDDLE RIGHT

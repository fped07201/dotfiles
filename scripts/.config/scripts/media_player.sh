#!/usr/bin/env bash

# Check if any player is running
if ! playerctl -l 2>/dev/null | grep -q .; then
    echo ""
    # No player found, exit silently
    exit 0
fi

# Get current track metadata
artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)
status=$(playerctl status 2>/dev/null)

# If metadata exists, show it
if [[ -n "$artist" && -n "$title" ]]; then
    if [[ "$status" == "Playing" ]]; then
        echo " $artist — $title"  # Playing icon
    else
        echo " $artist — $title"  # Paused icon
    fi
fi


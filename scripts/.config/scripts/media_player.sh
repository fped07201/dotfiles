#!/usr/bin/env bash

# Check if any player is running
if ! playerctl -l 2>/dev/null | grep -q .; then
    echo ""
    exit 0
fi

# Get current track metadata
artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)
status=$(playerctl status 2>/dev/null)

# Function to truncate text
truncate() {
    local str="$1"
    local max_len="$2"
    if [ ${#str} -gt "$max_len" ]; then
        echo "${str:0:max_len}…"
    else
        echo "$str"
    fi
}

# If metadata exists, show it
if [[ -n "$artist" && -n "$title" ]]; then
    artist=$(truncate "$artist" 15)  # limit artist to 15 chars
    title=$(truncate "$title" 30)    # limit title to 30 chars

    if [[ "$status" == "Playing" ]]; then
        echo " $artist — $title"
    else
        echo " $artist — $title"
    fi
fi


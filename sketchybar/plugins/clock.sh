#!/bin/sh

# Source colors
source "$HOME/.config/sketchybar/colors.sh"

# Get current date and time
DATE_TIME=$(date '+%a %d %b %H:%M')

# Update the clock item with enhanced styling
sketchybar --set "$NAME" \
           label="$DATE_TIME" \
           label.color="$LABEL_COLOR"

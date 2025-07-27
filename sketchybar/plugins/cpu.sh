#!/bin/sh

# Source colors
source "$HOME/.config/sketchybar/colors.sh"

# Get CPU usage
CPU_USAGE=$(top -l 1 | grep "CPU usage" | awk '{print $3}' | sed 's/%//')

if [ -z "$CPU_USAGE" ]; then
  CPU_USAGE="0"
fi

# Convert to integer for comparison
CPU_INT=$(echo $CPU_USAGE | cut -d. -f1)

# Determine color based on CPU usage
if [ "$CPU_INT" -ge 80 ]; then
  COLOR=$ERROR_COLOR
elif [ "$CPU_INT" -ge 50 ]; then
  COLOR=$WARNING_COLOR
else
  COLOR=$SUCCESS_COLOR
fi

# Update the CPU item
sketchybar --set "$NAME" \
           label="${CPU_USAGE}%" \
           icon.color="$COLOR" \
           label.color="$COLOR"
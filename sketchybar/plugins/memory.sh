#!/bin/sh

# Source colors
source "$HOME/.config/sketchybar/colors.sh"

# Get memory usage
MEMORY_PRESSURE=$(memory_pressure | grep "System-wide memory free percentage" | awk '{print $5}' | sed 's/%//')

if [ -z "$MEMORY_PRESSURE" ]; then
  # Fallback to top command if memory_pressure is not available
  MEM_USED=$(top -l 1 | grep "PhysMem" | awk '{print $2}' | sed 's/M//')
  MEMORY_PRESSURE=$(echo "scale=0; 100 - ($MEM_USED * 100 / 8192)" | bc 2>/dev/null || echo "50")
fi

# Convert to integer for comparison
MEM_INT=$(echo $MEMORY_PRESSURE | cut -d. -f1)

# Determine color based on memory usage (lower percentage = higher usage)
if [ "$MEM_INT" -le 20 ]; then
  COLOR=$ERROR_COLOR
elif [ "$MEM_INT" -le 50 ]; then
  COLOR=$WARNING_COLOR
else
  COLOR=$SUCCESS_COLOR
fi

# Calculate usage percentage (inverse of free percentage)
USAGE_PERCENT=$(echo "scale=0; 100 - $MEMORY_PRESSURE" | bc 2>/dev/null || echo "50")

# Update the memory item
sketchybar --set "$NAME" \
           label="${USAGE_PERCENT}%" \
           icon.color="$COLOR" \
           label.color="$COLOR"
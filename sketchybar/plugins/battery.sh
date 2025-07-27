#!/bin/sh

# Source colors
source "$HOME/.config/sketchybar/colors.sh"

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

# Determine color based on battery level and charging state
if [[ "$CHARGING" != "" ]]; then
  ICON="󰂄"
  COLOR=$BATTERY_CHARGING
elif [ "$PERCENTAGE" -ge 90 ]; then
  ICON="󰁹"
  COLOR=$BATTERY_100
elif [ "$PERCENTAGE" -ge 75 ]; then
  ICON="󰂂"
  COLOR=$BATTERY_100
elif [ "$PERCENTAGE" -ge 50 ]; then
  ICON="󰂀"
  COLOR=$BATTERY_75
elif [ "$PERCENTAGE" -ge 25 ]; then
  ICON="󰁾"
  COLOR=$BATTERY_50
else
  ICON="󰁺"
  COLOR=$BATTERY_25
fi

# Update with enhanced styling
sketchybar --set "$NAME" \
           icon="$ICON" \
           icon.color="$COLOR" \
           label="${PERCENTAGE}%" \
           label.color="$COLOR" \
           background.color="$SURFACE0" \
           background.border_color="$COLOR" \
           background.border_width=1 \
           background.drawing=on
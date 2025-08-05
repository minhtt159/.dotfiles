#!/bin/sh

# Source colors
source "$HOME/.config/sketchybar/colors.sh"

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"

  case "$VOLUME" in
    [6-9][0-9]|100) ICON="󰕾"
    ;;
    [3-5][0-9]) ICON="󰖀"
    ;;
    [1-9]|[1-2][0-9]) ICON="󰕿"
    ;;
    *) ICON="󰖁"
  esac

  # Determine color based on volume level
  if [ "$VOLUME" -ge 70 ]; then
    COLOR=$SUCCESS_COLOR
  elif [ "$VOLUME" -ge 30 ]; then
    COLOR=$WARNING_COLOR
  elif [ "$VOLUME" -gt 0 ]; then
    COLOR=$ACCENT_COLOR
  else
    COLOR=$ERROR_COLOR
  fi

  sketchybar --set "$NAME" \
             icon="$ICON" \
             icon.color="$COLOR" \
             label="$VOLUME%" \
             label.color="$COLOR"
fi

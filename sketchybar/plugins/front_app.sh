#!/bin/sh

# Source colors
source "$HOME/.config/sketchybar/colors.sh"

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

if [ "$SENDER" = "front_app_switched" ]; then
    APP_ICON="$($HOME/.config/sketchybar/plugins/icon_map.sh "$INFO")"
    
    sketchybar --set "$NAME" \
               label="$INFO" \
               icon="$APP_ICON" \
               icon.color="$ACCENT_COLOR" \
               label.color="$LABEL_COLOR"
fi

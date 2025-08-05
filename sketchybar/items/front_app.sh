#!/usr/bin/env sh

sketchybar --add item front_app left \
           --set front_app icon.font="sketchybar-app-font:Regular:16.0" \
                           icon.color=$ACCENT_COLOR \
                           label.font="SF Pro:Medium:13.0" \
                           label.color=$LABEL_COLOR \
                           background.color=$SURFACE0 \
                           background.corner_radius=4 \
                           background.height=24 \
                           background.drawing=on \
                           script="$PLUGIN_DIR/front_app.sh" \
           --subscribe front_app front_app_switched

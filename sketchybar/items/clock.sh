#!/usr/bin/env sh

sketchybar --add item clock right \
           --set clock update_freq=30 \
                       icon=󰥔 \
                       icon.font="SF Pro:Semibold:16.0" \
                       icon.color=$ACCENT_COLOR \
                       label.font="SF Pro:Medium:13.0" \
                       background.color=$SURFACE0 \
                       background.corner_radius=4 \
                       background.height=24 \
                       background.drawing=on \
                       script="$PLUGIN_DIR/clock.sh"

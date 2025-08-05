#!/usr/bin/env sh

sketchybar --add item network right \
           --set network update_freq=10 \
                         icon=󰛳 \
                         icon.font="SF Pro:Semibold:16.0" \
                         icon.color=$ACCENT_COLOR \
                         label.font="SF Pro:Medium:13.0" \
                         background.color=$SURFACE0 \
                         background.corner_radius=4 \
                         background.height=24 \
                         background.drawing=on \
                         script="$PLUGIN_DIR/network.sh" \
           --subscribe network wifi_change
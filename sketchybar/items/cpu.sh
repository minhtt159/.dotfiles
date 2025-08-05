#!/usr/bin/env sh

sketchybar --add item cpu right \
           --set cpu update_freq=2 \
                     icon=󰻠 \
                     icon.font="SF Pro:Semibold:16.0" \
                     icon.color=$ACCENT_COLOR \
                     label.font="SF Pro:Medium:13.0" \
                     background.color=$SURFACE0 \
                     background.corner_radius=4 \
                     background.height=24 \
                     background.drawing=on \
                     script="$PLUGIN_DIR/cpu.sh" \
           --subscribe cpu system_woke

#!/usr/bin/env sh

sketchybar --add item battery right \
           --set battery update_freq=120 \
                         icon.font="SF Pro:Semibold:16.0" \
                         label.font="SF Pro:Medium:13.0" \
                         background.corner_radius=8 \
                         background.height=30 \
                         script="$PLUGIN_DIR/battery.sh" \
           --subscribe battery system_woke power_source_change

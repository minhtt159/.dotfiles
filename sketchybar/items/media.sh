#!/usr/bin/env sh

sketchybar --add item media center \
           --set media icon=󰎈 \
                       icon.font="SF Pro:Semibold:16.0" \
                       icon.color=$ACCENT_COLOR \
                       label.font="SF Pro:Medium:13.0" \
                       label.max_chars=30 \
                       background.color=$SURFACE0 \
                       background.corner_radius=4 \
                       background.height=24 \
                       background.drawing=off \
                       script="$PLUGIN_DIR/media.sh" \
                       update_freq=5 \
                       click_script="$PLUGIN_DIR/media.sh toggle" \
           --subscribe media media_change
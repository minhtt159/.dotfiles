#!/usr/bin/env sh

sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item "space.$sid" left \
        --subscribe "space.$sid" aerospace_workspace_change \
        --set "space.$sid" \
              icon="$sid" \
              icon.font="SF Pro:Bold:14.0" \
              icon.width=28 \
              icon.padding_left=8 \
              icon.padding_right=8 \
              icon.color=$GREY \
              icon.highlight_color=$ACCENT_COLOR \
              background.color=$SURFACE0 \
              background.corner_radius=12 \
              background.height=28 \
              background.border_width=1 \
              background.border_color=$SURFACE1 \
              background.drawing=on \
              click_script="aerospace workspace $sid" \
              script="$CONFIG_DIR/plugins/aerospacer.sh $sid"
done

# Add separator for better visual separation
sketchybar --add item separator left \
           --set separator icon=│ \
                          icon.font="SF Pro:Medium:16.0" \
                          icon.color=$SURFACE2 \
                          background.padding_left=8 \
                          background.padding_right=8 \
                          label.drawing=off
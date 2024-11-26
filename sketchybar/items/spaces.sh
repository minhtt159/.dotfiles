#!/usr/bin/env sh

sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item "space.$sid" left \
        --subscribe "space.$sid" aerospace_workspace_change \
        --set "space.$sid" \
              icon="$sid" \
              icon.padding_left=10 \
              icon.padding_right=10 \
              icon.highlight_color=$RED \
              background.color=$BLACK \
              background.corner_radius=15 \
              background.height=30 \
              background.drawing=off \
              click_script="aerospace workspace $sid" \
              script="$CONFIG_DIR/plugins/aerospacer.sh $sid"
done

              # label.font="sketchybar-app-font:Regular:16.0" \
              # label.background.height=30                    \
              # label.background.drawing=on                   \
              # label.background.color=0xff494d64             \
              # label.background.corner_radius=9              \
              # label.drawing=off \
 
# sketchybar   --add item       separator left                          \
#              --set separator  icon=                                  \
#                               icon.font="Hack Nerd Font:Regular:16.0" \
#                               background.padding_left=15              \
#                               background.padding_right=15             \
#                               label.drawing=off                       \
#                               associated_display=active               \
#                               icon.color=$WHITE

#!/usr/bin/env sh

##### Adding Mission Control Space Indicators #####
# Let's add some mission control spaces:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item
# to indicate active and available mission control spaces.

# SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")
# for i in "${!SPACE_ICONS[@]}"
# do
#   sid="$(($i+1))"
#   space=(
#     space="$sid"
#     icon="${SPACE_ICONS[i]}"
#     icon.padding_left=7
#     icon.padding_right=7
#     background.color=0x40ffffff
#     background.corner_radius=5
#     background.height=25
#     label.drawing=off
#     script="$PLUGIN_DIR/space.sh"
#     click_script="yabai -m space --focus $sid"
#   )
#   sketchybar --add space space."$sid" left --set space."$sid" "${space[@]}"
# done

sketchybar --add event aerospace_workspace_change
RED=0xffed8796
for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item "space.$sid" left \
        --subscribe "space.$sid" aerospace_workspace_change \
        --set "space.$sid" \
              icon="$sid" \
              # icon.padding_left=22                          \
              # icon.padding_right=22                         \
              # label.padding_right=33                        \
              # icon.highlight_color=$RED                     \
              # background.color=0x44ffffff \
              # background.corner_radius=5 \
              # background.height=30 \
              # background.drawing=off                         \
              label.font="sketchybar-app-font:Regular:16.0" \
              # label.background.height=30                    \
              # label.background.drawing=on                   \
              # label.background.color=0xff494d64             \
              # label.background.corner_radius=9              \
              label.drawing=off                             \
        click_script="aerospace workspace $sid" \
        script="$PLUGINS_DIR/aerospacer.sh $sid"
done

sketchybar   --add item       separator left                          \
             --set separator  icon=                                  \
                              icon.font="Hack Nerd Font:Regular:16.0" \
                              background.padding_left=15              \
                              background.padding_right=15             \
                              label.drawing=off                       \
                              associated_display=active               \
                              icon.color=$WHITE

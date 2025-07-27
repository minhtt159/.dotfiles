#!/usr/bin/env sh

# Source colors and icons
source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

sketchybar --add event aerospace_workspace_change

# Workspace configuration
WORKSPACE_ICONS="一 二 三 四 五 六 七 八 九 十"

get_workspace_icon() {
  local index=$1
  echo "$WORKSPACE_ICONS" | cut -d' ' -f$index
}

# Create workspace items
workspace_index=1
for sid in $(aerospace list-workspaces --all); do
    # Get custom icon for workspace or fallback to number
    if [ $workspace_index -le 10 ]; then
        WORKSPACE_ICON=$(get_workspace_icon $workspace_index)
    else
        WORKSPACE_ICON="$sid"
    fi
    
    sketchybar --add item "space.$sid" left \
        --subscribe "space.$sid" aerospace_workspace_change \
        --set "space.$sid" \
              icon="$WORKSPACE_ICON" \
              icon.font="SF Pro:Bold:16.0" \
              icon.width=32 \
              icon.padding_left=4 \
              icon.padding_right=4 \
              icon.color=$SURFACE2 \
              icon.highlight_color=$WHITE \
              label.drawing=off \
              background.color=0x00000000 \
              background.corner_radius=8 \
              background.height=20 \
              background.border_width=0 \
              background.padding_left=2 \
              background.padding_right=2 \
              background.drawing=off \
              click_script="aerospace workspace $sid" \
              script="$CONFIG_DIR/plugins/aerospacer.sh $sid"
    
    workspace_index=$((workspace_index + 1))
done

# Add a visual separator with better styling
sketchybar --add item spaces_separator left \
           --set spaces_separator \
                 icon="􀆞" \
                 icon.font="SF Pro:Medium:14.0" \
                 icon.color=$SURFACE1 \
                 icon.padding_left=8 \
                 icon.padding_right=8 \
                 background.drawing=off \
                 label.drawing=off
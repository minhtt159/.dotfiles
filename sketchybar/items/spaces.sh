#!/usr/bin/env sh

# Source colors and icons
source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

sketchybar --add event aerospace_workspace_change

# Workspace configuration with elegant design
WORKSPACE_ICONS="一 二 三 四 五 六 七 八 九 十"

get_workspace_icon() {
  local index=$1
  echo "$WORKSPACE_ICONS" | cut -d' ' -f$index
}

# Multi-monitor support - detect available monitors
MONITORS=$(aerospace list-monitors --format '%{monitor-id}' 2>/dev/null || echo "1")

# Create workspace items with enhanced styling
workspace_index=1
for monitor in $MONITORS; do
    for sid in $(aerospace list-workspaces --monitor "$monitor" 2>/dev/null || aerospace list-workspaces --all); do
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
                  icon.padding_left=6 \
                  icon.padding_right=6 \
                  icon.color=$SURFACE2 \
                  icon.highlight_color=$WHITE \
                  icon.shadow.drawing=off \
                  icon.shadow.color=$ACCENT_COLOR \
                  icon.shadow.angle=45 \
                  icon.shadow.distance=2 \
                  label.drawing=off \
                  background.color=0x00000000 \
                  background.corner_radius=8 \
                  background.height=20 \
                  background.border_width=0 \
                  background.border_color=$ACCENT_COLOR \
                  background.padding_left=2 \
                  background.padding_right=2 \
                  background.drawing=off \
                  background.shadow.drawing=off \
                  background.shadow.color=0x33000000 \
                  background.shadow.angle=90 \
                  background.shadow.distance=2 \
                  click_script="aerospace workspace $sid" \
                  script="$CONFIG_DIR/plugins/aerospacer.sh $sid"
        
        workspace_index=$((workspace_index + 1))
    done
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
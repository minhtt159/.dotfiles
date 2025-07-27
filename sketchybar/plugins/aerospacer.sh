#!/bin/bash

# Source colors for consistent theming
source "$CONFIG_DIR/colors.sh"

WORKSPACE_ID="$1"

# Check if this workspace is focused
if [ "$WORKSPACE_ID" = "$FOCUSED_WORKSPACE" ]; then
    # Active workspace styling with animation
    sketchybar --set "$NAME" \
               background.drawing=on \
               background.color=$ACCENT_COLOR \
               background.corner_radius=8 \
               background.height=20 \
               icon.color=$BASE \
               icon.highlight=on \
               --animate tanh 15 \
               --set "$NAME" background.color=$ACCENT_COLOR
else
    # Inactive workspace styling
    sketchybar --set "$NAME" \
               background.drawing=off \
               background.color=0x00000000 \
               icon.color=$SURFACE2 \
               icon.highlight=off \
               --animate tanh 15 \
               --set "$NAME" icon.color=$SURFACE2
fi

# Check if workspace has windows (optional enhancement)
WORKSPACE_WINDOWS=$(aerospace list-windows --workspace "$WORKSPACE_ID" 2>/dev/null | wc -l | tr -d ' ')

if [ "$WORKSPACE_WINDOWS" -gt 0 ] && [ "$WORKSPACE_ID" != "$FOCUSED_WORKSPACE" ]; then
    # Workspace has windows but is not focused - show as occupied
    sketchybar --set "$NAME" icon.color=$TEXT
fi

#!/bin/bash

# Source colors for consistent theming
source "$CONFIG_DIR/colors.sh"

WORKSPACE_ID="$1"

# Check if this workspace is focused
if [ "$WORKSPACE_ID" = "$FOCUSED_WORKSPACE" ]; then
    # Active workspace styling with enhanced visual effects
    sketchybar --set "$NAME" \
               background.drawing=on \
               background.color=$ACCENT_COLOR \
               background.corner_radius=8 \
               background.height=20 \
               background.border_width=2 \
               background.border_color=$WHITE \
               background.shadow.drawing=on \
               icon.color=$BASE \
               icon.highlight=on \
               icon.shadow.drawing=on \
               --animate tanh 20 \
               --set "$NAME" \
               background.color=$ACCENT_COLOR \
               icon.color=$BASE
else
    # Check if workspace has windows for different styling
    WORKSPACE_WINDOWS=$(aerospace list-windows --workspace "$WORKSPACE_ID" 2>/dev/null | wc -l | tr -d ' ')
    
    if [ "$WORKSPACE_WINDOWS" -gt 0 ]; then
        # Workspace has windows but is not focused - show as occupied with subtle highlight
        sketchybar --set "$NAME" \
                   background.drawing=on \
                   background.color=0x22585b70 \
                   background.corner_radius=8 \
                   background.border_width=1 \
                   background.border_color=0x44cdd6f4 \
                   background.shadow.drawing=off \
                   icon.color=$TEXT \
                   icon.highlight=off \
                   icon.shadow.drawing=off \
                   --animate tanh 15 \
                   --set "$NAME" \
                   icon.color=$TEXT
    else
        # Empty inactive workspace - minimal styling
        sketchybar --set "$NAME" \
                   background.drawing=off \
                   background.color=0x00000000 \
                   background.border_width=0 \
                   background.shadow.drawing=off \
                   icon.color=$SURFACE2 \
                   icon.highlight=off \
                   icon.shadow.drawing=off \
                   --animate tanh 15 \
                   --set "$NAME" \
                   icon.color=$SURFACE2
    fi
fi

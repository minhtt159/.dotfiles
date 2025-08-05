#!/bin/sh

# Source colors
source "$HOME/.config/sketchybar/colors.sh"

# Function to get current playing track
get_media_info() {
    # Try Spotify first
    if pgrep -x "Spotify" > /dev/null; then
        PLAYER_STATE=$(osascript -e 'tell application "Spotify" to player state as string' 2>/dev/null)
        if [ "$PLAYER_STATE" = "playing" ]; then
            TRACK=$(osascript -e 'tell application "Spotify" to name of current track' 2>/dev/null)
            ARTIST=$(osascript -e 'tell application "Spotify" to artist of current track' 2>/dev/null)
            echo "spotify:$TRACK:$ARTIST"
            return
        fi
    fi
    
    # Try Apple Music
    if pgrep -x "Music" > /dev/null; then
        PLAYER_STATE=$(osascript -e 'tell application "Music" to player state as string' 2>/dev/null)
        if [ "$PLAYER_STATE" = "playing" ]; then
            TRACK=$(osascript -e 'tell application "Music" to name of current track' 2>/dev/null)
            ARTIST=$(osascript -e 'tell application "Music" to artist of current track' 2>/dev/null)
            echo "music:$TRACK:$ARTIST"
            return
        fi
    fi
    
    echo "none:::"
}

# Handle click events
if [ "$1" = "toggle" ]; then
    if pgrep -x "Spotify" > /dev/null; then
        osascript -e 'tell application "Spotify" to playpause' 2>/dev/null
    elif pgrep -x "Music" > /dev/null; then
        osascript -e 'tell application "Music" to playpause' 2>/dev/null
    fi
    exit 0
fi

# Get media information
MEDIA_INFO=$(get_media_info)
PLAYER=$(echo "$MEDIA_INFO" | cut -d: -f1)
TRACK=$(echo "$MEDIA_INFO" | cut -d: -f2)
ARTIST=$(echo "$MEDIA_INFO" | cut -d: -f3)

if [ "$PLAYER" != "none" ]; then
    # Show media info
    if [ ${#TRACK} -gt 25 ]; then
        TRACK="${TRACK:0:22}..."
    fi
    
    if [ "$PLAYER" = "spotify" ]; then
        ICON="󰓇"
        COLOR=$GREEN
    else
        ICON="󰎈"
        COLOR=$BLUE
    fi
    
    LABEL="$TRACK"
    if [ -n "$ARTIST" ] && [ ${#ARTIST} -lt 15 ]; then
        LABEL="$TRACK • $ARTIST"
    fi
    
    sketchybar --set "$NAME" \
               icon="$ICON" \
               icon.color="$COLOR" \
               label="$LABEL" \
               label.color="$LABEL_COLOR" \
               background.drawing=on
else
    # Hide when nothing is playing
    sketchybar --set "$NAME" background.drawing=off
fi
#!/bin/sh

# Source colors
source "$HOME/.config/sketchybar/colors.sh"

# Check internet connectivity
CONNECTED=$(ping -c 1 8.8.8.8 >/dev/null 2>&1 && echo "true" || echo "false")

if [ "$CONNECTED" = "true" ]; then
  # Check if connected via WiFi or Ethernet
  WIFI_NETWORK=$(networksetup -getairportnetwork en0 2>/dev/null | cut -d' ' -f4-)
  
  if [ "$WIFI_NETWORK" != "" ] && [ "$WIFI_NETWORK" != "You are not associated with an AirPort network." ]; then
    ICON="󰖩"
    LABEL="$WIFI_NETWORK"
    COLOR=$SUCCESS_COLOR
  else
    # Check for Ethernet
    ETHERNET=$(ifconfig en1 2>/dev/null | grep "inet " >/dev/null && echo "true" || echo "false")
    if [ "$ETHERNET" = "true" ]; then
      ICON="󰈀"
      LABEL="Ethernet"
      COLOR=$SUCCESS_COLOR
    else
      ICON="󰛳"
      LABEL="Connected"
      COLOR=$SUCCESS_COLOR
    fi
  fi
else
  ICON="󰌙"
  LABEL="Offline"
  COLOR=$ERROR_COLOR
fi

# Update the network item
sketchybar --set "$NAME" \
           icon="$ICON" \
           icon.color="$COLOR" \
           label="$LABEL" \
           label.color="$COLOR"
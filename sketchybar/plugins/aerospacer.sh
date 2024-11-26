#!/bin/bash

echo "called with $1"
echo "$FOCUSED_WORKSPACE"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
	sketchybar --set $NAME background.drawing=on icon.highlight=on
else
	sketchybar --set $NAME background.drawing=off icon.highlight=off
fi

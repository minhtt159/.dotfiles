#!/bin/bash

echo "called with $1"
echo "$FOCUSED_WORKSPACE"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
	sketchybar --set $NAME icon.highlight=on # background.drawing=on
else
	sketchybar --set $NAME icon.highlight=off # background.drawing=off
fi

# This script requires 'jq' to be installed.
# brew install jq
#
# WORKSPACES=$(aerospace list-workspaces --focused)
# FOCUSED_WORKSPACE=$(echo "$WORKSPACES" | jq -r '.name')
#
# args=()
# while read -r name; do
# 	if [ "$name" == "$FOCUSED_WORKSPACE" ]; then
# 		args+=(--set spaces.$name background.drawing=on)
# 	else
# 		args+=(--set spaces.$name background.drawing=off)
# 	fi
# done <<<"$(aerospace list-workspaces | jq -r '.[].name')"
#
# sketchybar -m "${args[@]}"

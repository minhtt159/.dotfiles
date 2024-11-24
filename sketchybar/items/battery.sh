#!/usr/bin/env sh

sketchybar --add item battery right \
	--set battery update_freq=120 \
	icon.font="Hack Nerd Font" \
	script="$PLUGIN_DIR/battery.sh" \
	--subscribe battery system_woke power_source_change

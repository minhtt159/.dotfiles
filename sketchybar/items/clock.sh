#!/usr/bin/env sh

# Some items refresh on a fixed cycle, e.g. the clock runs its script once
# every 10s. Other items respond to events they subscribe to, e.g. the
# volume.sh script is only executed once an actual change in system audio
# volume is registered. More info about the event system can be found here:
# https://felixkratz.github.io/SketchyBar/config/events

sketchybar --add item clock right \
	--set clock update_freq=10 icon= script="$PLUGIN_DIR/clock.sh" \
	--add item volume right \
	--set volume script="$PLUGIN_DIR/volume.sh" \
	--subscribe volume volume_change \
	--add item battery right \
	--set battery update_freq=120 script="$PLUGIN_DIR/battery.sh" \
	--subscribe battery system_woke power_source_change

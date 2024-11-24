#!/usr/bin/env sh

sketchybar  --add item cpu.top right \
            --set cpu.top label.font="$FONT:Semibold:7" \
                          label=CPU \
                          icon.drawing=off \
                          width=15 \
                          background.padding_right=23 \
                          drawing=off \
            \
            --add graph cpu.sys right 55 \
            --set cpu.sys width=0 \
                  graph.color=$RED \
                  graph.fill_color=$RED \
                  label.drawing=off \
                  icon.drawing=off \
                  background.padding_right=10 \
                  background.padding_left=10 \
                  background.height=30 \
                  background.drawing=on \
                  background.color=$TRANSPARENT \
            \
	--add graph cpu.user right 55 \
	--set cpu.user graph.color=$BLUE \
	label.drawing=off \
	icon.drawing=off \
	background.padding_right=10 \
	background.padding_left=10 \
	background.height=30 \
	background.drawing=on \
	background.color=$TRANSPARENT# --add item cpu.percent right \
	\
	# label=CPU \
	\
	# update_freq=2 \
	\
	# background.padding_right=20 # \
# --set cpu.percent label.font="$FONT:Heavy:12" \
# icon.drawing=off \
# mach_helper="$HELPER" \

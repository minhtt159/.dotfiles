#!/usr/bin/env sh
# This is a demo config to showcase some of the most important commands.
# It is meant to be changed and configured, as it is intentionally kept sparse.
# For a (much) more advanced configuration example see my dotfiles:
# https://github.com/FelixKratz/dotfiles

# NOTE: This file has been converted to use SbarLua for better performance
# and event handling. The original shell-based configuration is preserved
# here for reference, but the actual configuration now runs through init.lua

source "$HOME/.config/sketchybar/colors.sh" # Loads all defined colors
source "$HOME/.config/sketchybar/icons.sh" # Loads all defined icons

ITEM_DIR="$HOME/.config/sketchybar/items" # Directory where the items are configured
PLUGIN_DIR="$HOME/.config/sketchybar/plugins" # Directory where all the plugin scripts are stored

FONT="Hack Nerd Font"
# FONT="SF Pro"

##### Bar Appearance #####
# Configuring the general appearance of the bar.
# These are only some of the options available. For all options see:
# https://felixkratz.github.io/SketchyBar/config/bar
# If you are looking for other colors, see the color picker:
# https://felixkratz.github.io/SketchyBar/config/tricks#color-picker

bar=(
  position=top
  height=35
  color=$BAR_COLOR
)
sketchybar --bar "${bar[@]}"

##### Changing Defaults #####
# We now change some default values, which are applied to all further items.
# For a full list of all available item properties see:
# https://felixkratz.github.io/SketchyBar/config/items

default=(
  padding_left=5
  padding_right=5
  icon.padding_left=4
  icon.padding_right=4
  label.padding_left=4
  label.padding_right=4
  icon.font="$FONT:Semibold:17.0"
  label.font="$FONT:Semibold:14.0"
  icon.color=$ICON_COLOR
  label.color=$LABEL_COLOR
)
sketchybar --default "${default[@]}"

##### Adding Left Items #####
# We add some regular items to the left side of the bar, where
# only the properties deviating from the current defaults need to be set

source "$ITEM_DIR/spaces.sh"
source "$ITEM_DIR/front_app.sh"

##### Adding Right Items #####
# In the same way as the left items we can add items to the right side.
# Additional position (e.g. center) are available, see:
# https://felixkratz.github.io/SketchyBar/config/items#adding-items-to-sketchybar

source "$ITEM_DIR/clock.sh"
source "$ITEM_DIR/volume.sh"
source "$ITEM_DIR/battery.sh"
# source "$ITEM_DIR/cpu.sh"

##### Force all scripts to run the first time (never do this in a script) #####
sketchybar --update

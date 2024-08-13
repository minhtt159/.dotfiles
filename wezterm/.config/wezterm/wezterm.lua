-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "terminal.sexy"
-- config.color_scheme = "Batman"

config.font = wezterm.font("JetBrains Mono")
-- config.font = wezterm.font("Hack Nerd Font")
config.font_size = 15.5

config.window_background_opacity = 0.93
-- config.text_background_opacity = 0.0

-- GUI windows
config.initial_cols = 150
config.initial_rows = 40
-- and finally, return the configuration to wezterm
return config

-- local wezterm = require "wezterm"
-- local config = wezterm.config_builder()
-- config.color_scheme = "terminal.sexy"
-- -- config.font = wezterm.font("Hack Nerd Font")
-- config.font_size = 15.5
-- config.window_background_opacity = 0.93
-- -- config.text_background_opacity = 0.0
-- config.initial_cols = 150
-- config.initial_rows = 40
-- return config

local Config = require("config")

-- require('utils.backdrops'):set_files():random()
require("events.right-status").setup()
require("events.left-status").setup()
require("events.tab-title").setup()
require("events.new-tab-button").setup()

return Config:init()
  :append(require("config.appearance"))
  :append(require("config.bindings"))
  :append(require("config.domains"))
  :append(require("config.fonts"))
  :append(require("config.general"))
  :append(require("config.launch")).options

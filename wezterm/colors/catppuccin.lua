local wezterm = require("wezterm")

-- ref: https://github.com/catppuccin/wezterm/blob/main/dist/catppuccin-mocha.toml
local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
custom.background = "#000000"
custom.tab_bar.background = "#040404"
custom.tab_bar.inactive_tab.bg_color = "#0f0f0f"
custom.tab_bar.new_tab.bg_color = "#080808"

-- NOTE: Downstream nvim catppuccin theme uses the following colors
custom.indexed = {}

return {
  color_schemes = {
    ["OLEDppuccin"] = custom,
  },
}

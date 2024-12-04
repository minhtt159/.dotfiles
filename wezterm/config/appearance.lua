local gpu_adapters = require("utils.gpu_adapter")

return {
  animation_fps = 60,
  max_fps = 60,
  front_end = "WebGpu",
  webgpu_power_preference = "HighPerformance",
  webgpu_preferred_adapter = gpu_adapters:pick_best(),

  -- color_scheme = "GruvboxDarkHard",
  color_scheme = "OLEDppuccin",

  -- background
  background = {
    {
      source = { Color = "#000000" },
      height = "100%",
      width = "100%",
      opacity = 0.93,
    },
  },

  -- scrollbar
  enable_scroll_bar = true,

  -- tab bar
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  tab_max_width = 25,
  show_tab_index_in_tab_bar = true,
  switch_to_last_active_tab_when_closing_tab = true,

  -- window
  window_padding = {
    left = 5,
    right = 10,
    top = 5,
    bottom = 0,
  },
  window_close_confirmation = "NeverPrompt",
  window_frame = {
    active_titlebar_bg = "#090909",
    -- font = fonts.font,
    -- font_size = fonts.font_size,
  },
  -- window_decorations = "None",
  inactive_pane_hsb = {
    saturation = 0.8,
    brightness = 0.3,
  },
}

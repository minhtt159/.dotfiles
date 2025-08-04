local settings = require("settings")
local colors = require("colors")

-- ##### Changing Defaults #####
-- # We now change some default values, which are applied to all further items.
-- # For a full list of all available item properties see:
-- # https://felixkratz.github.io/SketchyBar/config/items
sbar.default({
  updates = "when_shown",
  padding_left=8,
  padding_right=8,
  scroll_texts = true,

  icon = {
    font = {
      family = settings.font.text,
      -- icon.font="SF Pro:Semibold:16.0"
      style = settings.font.style_map["Bold"],
      -- icon.color=$ICON_COLOR
      size = 14.0
    },
    color = colors.catppuccin.white,
    -- padding_left = settings.paddings,
    -- padding_right = settings.paddings,
    padding_left = 6,
    padding_right = 6,
    background = { image = { corner_radius = 9 } },
  },

  label = {
    font = {
      family = settings.font.text,
    -- label.font="SF Pro:Medium:13.0"
      style = settings.font.style_map["Semibold"],
      size = 13.0
    },
    color = colors.catppuccin.white,
    -- padding_left = settings.paddings,
    -- padding_right = settings.paddings,
    padding_left=6,
    padding_right=6,
  },

  background = {
    height = 28,
    corner_radius = 9,
    border_width = 2,
    border_color = colors.bg2,
    -- background.height=20
    -- background.corner_radius=4
    -- background.padding_left=2
    -- background.padding_right=2
    image = {
      corner_radius = 9,
      border_color = colors.grey,
      border_width = 1
    }
  },

  popup = {
    background = {
      border_width = 2,
      corner_radius = 9,
      border_color = colors.popup.border,
      color = colors.popup.bg,
      shadow = { drawing = true },
    },
    blur_radius = 50,
  },
})

local settings = require("settings")
local colors = require("colors")

-- Equivalent to the --default domain from sketchybarrc
sbar.default({
  padding_left = 5,
  padding_right = 5,
  icon = {
    padding_left = 4,
    padding_right = 4,
    font = {
      family = settings.font,
      style = "Semibold",
      size = 17.0
    },
    color = colors.icon,
  },
  label = {
    padding_left = 4,
    padding_right = 4,
    font = {
      family = settings.font,
      style = "Semibold", 
      size = 14.0
    },
    color = colors.label,
  },
})
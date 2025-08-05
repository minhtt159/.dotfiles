local colors = require("colors")

-- #### Bar Appearance #####
-- Configuring the general appearance of the bar.
-- These are only some of the options available. For all options see:
-- https://felixkratz.github.io/SketchyBar/config/bar
-- If you are looking for other colors, see the color picker:
-- https://felixkratz.github.io/SketchyBar/config/tricks#color-picker

sbar.bar({
  position= "top",
  height = 35,
  margin = 0,
  corner_radius = 10,
  color = colors.bar.bg,
  padding_right = 20,
  padding_left = 20,
  shadow=true,
  sticky=true,
  y_offset = 0,
})


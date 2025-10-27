local colors = require("colors")

-- Equivalent to the --bar domain
Sbar.bar({
	potition = "top",
	height = 35,
	-- color = colors.bar.bg,
	color = colors.bar.transparent,
	border_color = colors.bar.border,
	shadow = true,
	sticky = true,
	-- padding_left = 10,
	-- padding_right = 10,
	-- blur_radius = 20,
})

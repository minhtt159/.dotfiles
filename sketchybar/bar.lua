local colors = require("colors")

-- Equivalent to the --bar domain
Sbar.bar({
	potition = "top",
	height = 34,
	color = colors.bar.bg,
	border_color = colors.bar.border,
	shadow = true,
	sticky = true,
	padding_left = 10,
	padding_right = 10,
	blur_radius = 20,
})

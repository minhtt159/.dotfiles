-- Global settings for sketchybar
local settings = require("settings")
local colors = require("colors")

Sbar.default({
	update = "when_shown",
	icon = {
		color = colors.white,
		font = {
			family = settings.font.text,
			style = settings.font.style_map["Bold"],
			size = 13.0,
		},
		-- padding_left = settings.paddings,
		-- padding_right = settings.paddings,
		padding_left = settings.icon_padding,
		padding_right = settings.icon_padding,
		background = {
			image = {
				corner_radius = 9,
			},
		},
	},
	label = {
		color = colors.white,
		font = {
			family = settings.font.text,
			style = settings.font.style_map["Semibold"],
			size = 13.0,
		},
		padding_left = settings.paddings,
		padding_right = settings.paddings,
		-- background = {
		--   height = 24,
		--   corner_radius = 5,
		--   color = colors.BACKGROUND,
		-- },
	},
	padding_left = 5,
	padding_right = 5,
	scroll_texts = true,
})

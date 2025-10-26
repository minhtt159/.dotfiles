return {
	-- Fonts
	icon_font = "SF Pro:Bold:16.0",
	label_font = "SF Pro:Semibold:13.0",

	-- Layout / paddings
	bar_height = 34,
	bar_radius = 10,
	bar_y_offset = 0,
	bar_padding_l = 8,
	bar_padding_r = 8,
	item_padding = 6,
	icon_padding = 4,
	paddings = 3,
	group_paddings = 5,

	-- Behavior
	topmost = "window", -- or "always" / "off"
	sticky = "off",
	blur_radius = 0,

	icons = "sf-symbols", -- alternatively available: NerdFont
	-- Alternatively, this is a font config for JetBrainsMono Nerd Font
	font = {
		text = "JetBrainsMono Nerd Font", -- Used for text
		numbers = "JetBrainsMono Nerd Font", -- Used for numbers
		style_map = {
			["Regular"] = "Regular",
			["Semibold"] = "Medium",
			["Bold"] = "SemiBold",
			["Heavy"] = "Bold",
			["Black"] = "ExtraBold",
		},
	},
}

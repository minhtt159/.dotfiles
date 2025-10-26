return {
	-- # Color Palette
	black = 0xff181926,
	white = 0xffcad3f5,
	red = 0xffed8796,
	green = 0xffa6da95,
	blue = 0xff8aadf4,
	yellow = 0xffeed49f,
	orange = 0xfff5a97f,
	magenta = 0xffc6a0f6,
	grey = 0xff939ab7,
	transparent = 0x00000000,

	-- bar = {
	--   bg = 0x40000000 -- Original bar color
	--   fg = "0xffcad3f5"
	-- },
	bar = {
		bg = 0xd01e1e2e,
		border = 0xff494d64,
	},

	popup = {
		bg = 0xff1e1e2e,
		border = 0xffcad3f5,
	},

	bg1 = 0x803c3e4f,
	bg2 = 0xff494d64,

	with_alpha = function(color, alpha)
		if alpha > 1.0 or alpha < 0.0 then
			return color
		end
		return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
	end,
}

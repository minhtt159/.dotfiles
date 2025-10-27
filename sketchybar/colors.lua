return {
	-- -- # Color Palette
	-- black = 0xff181926,
	-- white = 0xffcad3f5,
	-- red = 0xffed8796,
	-- green = 0xffa6da95,
	-- blue = 0xff8aadf4,
	-- yellow = 0xffeed49f,
	-- orange = 0xfff5a97f,
	-- magenta = 0xffc6a0f6,
	-- grey = 0xff939ab7,
	-- transparent = 0x00000000,
	--
	-- bar = {
	-- 	bg = 0xd01e1e2e,
	-- 	border = 0xff494d64,
	-- },
	--
	-- popup = {
	-- 	bg = 0xff1e1e2e,
	-- 	border = 0xffcad3f5,
	-- },
	--
	-- bg1 = 0x803c3e4f,
	-- bg2 = 0xff494d64,

	-- rosepine
	black = 0xff191724,
	white = 0xffe0def4,
	red = 0xffeb6f92,
	green = 0xff9ccfd8,
	blue = 0xff31748f,
	yellow = 0xfff6c177,
	orange = 0xffebbcba,
	magenta = 0xffc4a7e7,
	grey = 0xff6e6a86,
	transparent = 0x00000000,

	bar = {
		bg = 0xff191724,
		border = 0xff2c2e34,
	},

	popup = {
		bg = 0xff1f1d2e,
		border = 0xff7f8490,
	},

	bg1 = 0xff26233a,
	bg2 = 0xff403d52,

	with_alpha = function(color, alpha)
		if alpha > 1.0 or alpha < 0.0 then
			return color
		end
		return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
	end,
}

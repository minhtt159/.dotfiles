local catppuccinn = {
	black = 0xff11111b,
	white = 0xffcdd6f4,
	red = 0xfff38ba8,
	green = 0xffa6e3a1,
	blue = 0xff89b4fa,
	yellow = 0xfff9e2af,
	orange = 0xfffab387,
	magenta = 0xffcba6f7,
	grey = 0xff6c7086,
	transparent = 0x00000000,
}

catppuccinn.surface = {
	_0 = 0xff313244,
	_1 = 0xff45475a,
	_2 = 0xff585b70,
}

return {
	catppuccinn = catppuccinn,

	bar = {
		-- NOTE: Author color
		-- bg = 0xd01e1e2e,
		-- border = 0xff494d64,
		-- NOTE: Old color
		bg = 0xe01e1e2e,
		border = 0xff494d64,
	},
	popup = {
		-- NOTE: Author color
		-- bg = 0xff1e1e2e,
		-- border = 0xffcad3f5,
		-- NOTE: Old color
		bg = 0xf01e1e2e,
		border = catppuccinn.surface._1,
	},
	bg1 = 0x803c3e4f,
	bg2 = 0xff494d64,

	-- NOTE: more colors
	icon_color = catppuccinn.white,
	label_color = catppuccinn.white,

	state = {
		accent_color = catppuccinn.blue,
		success_color = catppuccinn.green,
		warning_color = catppuccinn.yellow,
		error_color = catppuccinn.red,
	},

	battery = {
		_100 = catppuccinn.green,
		_75 = catppuccinn.yellow,
		_50 = catppuccinn.orange,
		_25 = catppuccinn.red,
		_charging = catppuccinn.blue,
	},

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then return color end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}

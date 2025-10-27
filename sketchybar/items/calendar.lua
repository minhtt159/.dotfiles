local settings = require("settings")
local colors = require("colors")

-- Padding item required because of bracket
Sbar.add("item", { position = "right", width = settings.group_paddings })

local cal = Sbar.add("item", {
	icon = {
		color = colors.white,
		padding_left = 8,
		font = {
			style = settings.font.style_map["Black"],
			size = 13.0,
		},
	},
	label = {
		color = colors.white,
		padding_right = 8,
		width = 52,
		align = "right",
		font = {
			style = settings.font.numbers,
		},
	},
	position = "right",
	update_freq = 3,
	padding_left = 1,
	padding_right = 1,
	background = {
		color = colors.bg2,
		border_color = colors.black,
		border_width = 1,
	},
	click_script = "open -a 'Calendar'",
})

-- Double border for calendar using a single item bracket
Sbar.add("bracket", { cal.name }, {
	background = {
		color = colors.transparent,
		height = 26,
		border_color = colors.grey,
	},
})

-- Padding item required because of bracket
Sbar.add("item", { position = "right", width = settings.group_paddings })

cal:subscribe({ "forced", "routine", "system_woke" }, function(env)
	cal:set({ icon = os.date("%a %b %d"), label = os.date("%H:%M") })
end)

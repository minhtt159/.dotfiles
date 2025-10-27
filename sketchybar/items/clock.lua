local Sbar = require("sketchybar")

Sbar.add("item", "clock", {
	position = "right",
	icon = { string = icons.CLOCK },
	label = {
		string = os.date("%H:%M"),
		width = 50,
		align = "center",
	},
	update_freq = 1,
})

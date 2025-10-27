local Sbar = require("sketchybar")

Sbar.add("item", "calendar", {
	position = "right",
	icon = { string = icons.CALENDAR },
	label = {
		string = os.date("%a %d. %b"),
		width = 78,
		align = "center",
	},
	update_freq = 30,
})

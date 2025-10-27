local Sbar = require("sketchybar")

Sbar.add("item", "brew", {
	position = "right",
	icon = { string = icons.BREW },
	label = { string = "??" },
	script = "sketchybar/plugins/brew.sh",
	update_freq = 3600, -- Update every hour
})

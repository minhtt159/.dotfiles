local Sbar = require("sketchybar")

Sbar.add("item", "mem", {
	position = "right",
	icon = { string = icons.RAM },
	label = { string = "0%" },
	update_freq = 2,
	script = "sketchybar/plugins/mem.sh",
})

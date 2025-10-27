local Sbar = require("sketchybar")

Sbar.add("item", "cpu", {
	position = "right",
	icon = { string = icons.CPU },
	label = { string = "0%" },
	update_freq = 2,
	script = "sketchybar/plugins/cpu.sh",
})

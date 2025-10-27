local Sbar = require("sketchybar")

Sbar.add("item", "disk", {
	position = "right",
	icon = { string = icons.DISK },
	label = { string = "0%" },
	update_freq = 60,
	script = "sketchybar/plugins/disk.sh",
})

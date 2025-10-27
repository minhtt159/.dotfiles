local colors = require("colors")
local app_icons = require("helpers.app_icons")
local settings = require("settings")

local front_app = Sbar.add("item", "front_app", {
	display = "active",
	icon = {
		font = "sketchybar-app-font:Regular:16.0",
	},
	label = {
		font = {
			style = settings.font.style_map["Black"],
			size = 14.0,
		},
		padding_left = 8,
	},
	updates = true,
})

front_app:subscribe("front_app_switched", function(env)
	-- Lookup app icon string
	local lookup = app_icons[env.INFO]
	front_app:set({
		label = { string = env.INFO },
		icon = { string = ((lookup == nil) and app_icons["Default"] or lookup) },
	})
end)

-- front_app:subscribe("mouse.clicked", function(env)
-- 	Sbar.trigger("swap_menus_and_spaces")
-- end)

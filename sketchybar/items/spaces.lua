local colors = require("colors")

-- local spaces = {}
-- TODO: Get spaces from aerospace
local total_spaces = 4

for i = 1, total_spaces, 1 do
	local space = Sbar.add("space", "space." .. i, {
		position = "left",
		space = i,
		icon = { width = 5 },
		background = {
			color = colors.white,
			corner_radius = 5,
			height = 12,
			padding_left = i == 1 and 7 or 2,
			padding_right = i == total_spaces and 7 or 2,
		},
	})

	space:subscribe("space_change", function(env)
		local selected = env.SELECTED == "true"
		Sbar:animate("circ", 15, function()
			space:set({
				icon = { width = selected and 31 or 7 },
				background = {
					color = selected and colors.red or colors.white,
				},
			})
		end)
	end)
end

-- add bracket around the spaces
Sbar.add("bracket", { "/space\\.\\d*/" }, {
	blur_radius = 32,
	background = {
		-- color = colors.transparent,
		-- border_color = colors.bg2,
		-- border_width = 2,
		color = colors.bg,
		corner_radius = 8,
		height = 16,
	},
})

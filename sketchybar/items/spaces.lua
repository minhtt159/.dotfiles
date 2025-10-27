local colors = require("colors")

local function parse_string_to_table(s)
	local result = {}
	for line in s:gmatch("([^\n]+)") do
		table.insert(result, line)
	end
	return result
end

-- Get Aerospace workspaces
local file = io.popen("aerospace list-workspaces --all")
if file == nil then
	error("Failed to open aerospace command.")
	return
end
local result = file:read("*a")
file:close()

local workspaces = parse_string_to_table(result)
for i, workspace in ipairs(workspaces) do
	local space = Sbar.add("item", "space." .. i, {
		icon = { width = 7 },
		background = {
			color = colors.white,
			corner_radius = 4,
			height = 8,
			padding_left = i == 1 and 4 or 0,
			padding_right = 4,
		},
	})

	-- Space change function
	space:subscribe("aerospace_workspace_change", function(env)
		local selected = env.FOCUSED_WORKSPACE == workspace
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

-- TODO: Add static bracket around spaces
-- -- add bracket around the spaces
-- Sbar.add("bracket", { "/space\\.\\d*/" }, {
-- 	blur_radius = 32,
-- 	background = {
-- 		color = colors.transparent,
-- 		-- border_color = colors.bg2,
-- 		-- border_width = 2,
-- 		-- color = colors.bg,
-- 		-- corner_radius = 8,
-- 		-- height = 16,
-- 	},
-- })

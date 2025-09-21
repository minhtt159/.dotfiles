local colors = require("colors")

-- Add the aerospace workspace change event
sbar.add("event", "aerospace_workspace_change")

-- Function to get workspace list from aerospace
local function get_workspaces()
  local workspaces = {}
  sbar.exec("aerospace list-workspaces --all", function(result)
    for workspace in result:gmatch("%S+") do
      table.insert(workspaces, workspace)
    end
  end)
  return workspaces
end

-- Create workspace items
local workspace_items = {}

-- Get aerospace workspaces and create items for each
sbar.exec("aerospace list-workspaces --all", function(result)
  for workspace in result:gmatch("%S+") do
    local space_item = sbar.add("item", "space." .. workspace, {
      position = "left",
      icon = {
        string = workspace,
        width = 20,
        padding_left = 10,
        padding_right = 10,
        highlight_color = colors.icon,
      },
      background = {
        color = colors.black,
        corner_radius = 15,
        height = 30,
        drawing = false,
      },
      click_script = "aerospace workspace " .. workspace
    })

    -- Store reference to the item
    workspace_items[workspace] = space_item

    -- Subscribe to aerospace workspace change events
    space_item:subscribe("aerospace_workspace_change", function(env)
      local focused_workspace = env.FOCUSED_WORKSPACE
      if workspace == focused_workspace then
        space_item:set({
          background = { drawing = true },
          icon = { highlight = true }
        })
      else
        space_item:set({
          background = { drawing = false },
          icon = { highlight = false }
        })
      end
    end)
  end
end)
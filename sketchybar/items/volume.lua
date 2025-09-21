local icons = require("icons")

local volume = sbar.add("item", "volume", {
  position = "right",
})

local function update_volume(volume_info)
  local vol = tonumber(volume_info) or 0
  local icon
  
  if vol >= 60 then
    icon = icons.volume._100
  elseif vol >= 30 then
    icon = icons.volume._66
  elseif vol >= 1 then
    icon = icons.volume._33
  else
    icon = icons.volume._0
  end
  
  volume:set({
    icon = { string = icon },
    label = { string = vol .. "%" }
  })
end

volume:subscribe("volume_change", function(env)
  update_volume(env.INFO)
end)
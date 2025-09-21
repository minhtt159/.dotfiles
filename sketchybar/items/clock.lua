local clock = sbar.add("item", "clock", {
  position = "right",
  update_freq = 30,
})

local function update_clock()
  sbar.exec("date '+%d/%m %H:%M'", function(result)
    clock:set({
      label = { string = result:gsub("%s+", "") } -- Remove any trailing whitespace
    })
  end)
end

-- Initial update
update_clock()

-- Subscribe to routine updates
clock:subscribe("routine", update_clock)
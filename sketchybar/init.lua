-- Require the sketchybar module
Sbar = require("sketchybar")

-- Bundle the entire initial configuration into a single message to sketchybar
Sbar.begin_config()
require("bar")
require("default")
require("items")
Sbar.end_config()

-- Run the event loop of the sketchybar module
-- (without this there will be no callback functions executed in the lua module)
Sbar.event_loop()

-- local backdrops = require("utils.backdrops")
local platform = require("utils.platform")()
local wezterm = require("wezterm")
local act = wezterm.action

local mod = {
  DEFAULT = "NONE",
  SHIFT_REV = "SHIFT|CTRL",
}

if platform.is_mac then
  -- SUPER == CMD
  mod.SUPER = "SUPER"
  mod.SUPER_REV = "SUPER|CTRL"
  mod.OPT = "OPT"
elseif platform.is_win or platform.is_linux then
  mod.SUPER = "ALT"
  mod.SUPER_REV = "ALT|CTRL"
  mod.OPT = "CTRL"
end

local LEADER = {
  key = "Space",
  mods = mod.OPT,
  timeout_milliseconds = 1000,
}

local keys = {
  -- Wezterm default key bindings
  -- `wezterm show-keys --lua`
  --   { key = 'h', mods = 'SHIFT|CTRL', action = act.HideApplication },
  --   { key = 'h', mods = 'SUPER', action = act.HideApplication },
  --   { key = 'H', mods = 'CTRL', action = act.HideApplication },
  --   { key = 'H', mods = 'SHIFT|CTRL', action = act.HideApplication },
  --   { key = 'm', mods = 'SHIFT|CTRL', action = act.Hide },
  --   { key = 'm', mods = 'SUPER', action = act.Hide },
  --   { key = 'M', mods = 'CTRL', action = act.Hide },
  --   { key = 'M', mods = 'SHIFT|CTRL', action = act.Hide },

  --   { key = 'K', mods = 'CTRL', action = act.ClearScrollback 'ScrollbackOnly' },
  --   { key = 'K', mods = 'SHIFT|CTRL', action = act.ClearScrollback 'ScrollbackOnly' },
  --   { key = 'k', mods = 'SHIFT|CTRL', action = act.ClearScrollback 'ScrollbackOnly' },
  --   { key = 'k', mods = 'SUPER', action = act.ClearScrollback 'ScrollbackOnly' },

  --   { key = 'u', mods = 'SHIFT|CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
  --   { key = 'U', mods = 'CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
  --   { key = 'U', mods = 'SHIFT|CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },

  --   { key = 'z', mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState },
  --   { key = 'Z', mods = 'CTRL', action = act.TogglePaneZoomState },
  --   { key = 'Z', mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState },
  { key = "phys:Space", mods = "SHIFT|CTRL", action = act.QuickSelect },

  --   { key = 'PageUp', mods = 'SHIFT', action = act.ScrollByPage(-1) },
  --   { key = 'PageUp', mods = 'CTRL', action = act.ActivateTabRelative(-1) },
  --   { key = 'PageUp', mods = 'SHIFT|CTRL', action = act.MoveTabRelative(-1) },
  --   { key = 'PageDown', mods = 'SHIFT', action = act.ScrollByPage(1) },
  --   { key = 'PageDown', mods = 'CTRL', action = act.ActivateTabRelative(1) },
  --   { key = 'PageDown', mods = 'SHIFT|CTRL', action = act.MoveTabRelative(1) },

  -- DEBUG
  { key = "l", mods = mod.SHIFT_REV, action = act.ShowDebugOverlay },
  -- { key = "l", mods = mod.SUPER_REV, action = act.ShowDebugOverlay },

  --------- COMMAND PALETTE ---------
  { key = "F2", mods = mod.DEFAULT, action = act.ActivateCommandPalette },
  -- { key = "p", mods = mod.SUPER, action = act.ActivateCommandPalette },
  -- { key = 'p', mods = 'SHIFT|CTRL', action = act.ActivateCommandPalette },
  -- { key = 'P', mods = 'CTRL', action = act.ActivateCommandPalette },
  -- { key = 'P', mods = 'SHIFT|CTRL', action = act.ActivateCommandPalette },

  --------- COPY MODE ---------
  { key = "F1", mods = mod.DEFAULT, action = "ActivateCopyMode" },
  -- { key = 'X', mods = 'CTRL', action = act.ActivateCopyMode },
  -- { key = 'X', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },
  -- { key = 'x', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },

  --------- LAUNCHER ---------
  { key = "F3", mods = mod.DEFAULT, action = act.ShowLauncher },
  { key = "F4", mods = mod.DEFAULT, action = act.ShowLauncherArgs({ flags = "FUZZY|TABS" }) },
  { key = "F5", mods = mod.DEFAULT, action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
  { key = "F11", mods = mod.DEFAULT, action = act.ToggleFullScreen },
  { key = "F12", mods = mod.DEFAULT, action = act.ShowDebugOverlay },

  --------- FIND THINGS ---------
  { key = "f", mods = mod.SUPER, action = act.Search({ CaseInSensitiveString = "" }) },
  -- { key = 'F', mods = 'CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
  -- { key = 'F', mods = 'SHIFT|CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
  -- { key = 'f', mods = 'SHIFT|CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
  -- { key = 'f', mods = 'SUPER', action = act.Search 'CurrentSelectionOrEmptyString' },

  --------- OPEN URL ---------
  {
    key = "u",
    mods = mod.SUPER,
    action = act.QuickSelectArgs({
      label = "open url",
      -- https://google.com
      patterns = {
        "\\((https?://\\S+)\\)",
        "\\[(https?://\\S+)\\]",
        "\\{(https?://\\S+)\\}",
        "<(https?://\\S+)>",
        "\\bhttps?://\\S+[)/a-zA-Z0-9-]+",
      },
      action = wezterm.action_callback(function(window, pane)
        local url = window:get_selection_text_for_pane(pane)
        wezterm.log_info("opening: " .. url)
        wezterm.open_with(url)
      end),
    }),
  },

  -- Fonts
  --   { key = '_', mods = 'CTRL', action = act.DecreaseFontSize },
  --   { key = '_', mods = 'SHIFT|CTRL', action = act.Decrease
  --   { key = '=', mods = 'SUPER', action = act.IncreaseFontSize },
  --   { key = '=', mods = 'CTRL', action = act.IncreaseFontSize },
  --   { key = '=', mods = 'SHIFT|CTRL', action = act.IncreaseFontSize },FontSize },
  --   { key = ')', mods = 'CTRL', action = act.ResetFontSize },
  --   { key = ')', mods = 'SHIFT|CTRL', action = act.ResetFontSize },
  --   { key = '+', mods = 'CTRL', action = act.IncreaseFontSize },
  --   { key = '+', mods = 'SHIFT|CTRL', action = act.IncreaseFontSize },
  --   { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
  --   { key = '-', mods = 'SHIFT|CTRL', action = act.DecreaseFontSize },
  --   { key = '-', mods = 'SUPER', action = act.DecreaseFontSize },
  --   { key = '0', mods = 'CTRL', action = act.ResetFontSize },
  --   { key = '0', mods = 'SHIFT|CTRL', action = act.ResetFontSize },
  --   { key = '0', mods = 'SUPER', action = act.ResetFontSize },

  -- Arrow movement --
  { key = "LeftArrow", mods = mod.SUPER, action = act.SendString("\x1bOH") },
  { key = "LeftArrow", mods = mod.OPT, action = act.SendString("\x1bb") },
  { key = "RightArrow", mods = mod.SUPER, action = act.SendString("\x1bOF") },
  { key = "RightArrow", mods = mod.OPT, action = act.SendString("\x1bf") },
  { key = "Backspace", mods = mod.SUPER, action = act.SendString("\x15") },
  --   { key = 'LeftArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Left' },
  --   { key = 'LeftArrow', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Left', 1 } },
  --   { key = 'RightArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Right' },
  --   { key = 'RightArrow', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Right', 1 } },
  --   { key = 'UpArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Up' },
  --   { key = 'UpArrow', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Up', 1 } },
  --   { key = 'DownArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Down' },
  --   { key = 'DownArrow', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Down', 1 } },

  -- copy/paste --
  { key = "c", mods = mod.SUPER, action = act.CopyTo("Clipboard") },
  { key = "c", mods = mod.SHIFT_REV, action = act.CopyTo("Clipboard") },
  { key = "Copy", mods = mod.DEFAULT, action = act.CopyTo("Clipboard") },
  { key = "v", mods = mod.SUPER, action = act.PasteFrom("Clipboard") },
  { key = "v", mods = mod.SHIFT_REV, action = act.PasteFrom("Clipboard") },
  { key = "Paste", mods = mod.DEFAULT, action = act.PasteFrom("Clipboard") },

  -- tabs --
  { key = "t", mods = mod.SUPER, action = act.SpawnTab("CurrentPaneDomain") },
  { key = "w", mods = mod.SUPER, action = act.CloseCurrentPane({ confirm = false }) },
  -- tabs: navigation
  { key = "[", mods = mod.SUPER, action = act.ActivateTabRelative(-1) },
  { key = "[", mods = mod.SUPER_REV, action = act.MoveTabRelative(-1) },
  { key = "]", mods = mod.SUPER, action = act.ActivateTabRelative(1) },
  { key = "]", mods = mod.SUPER_REV, action = act.MoveTabRelative(1) },
  { key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
  { key = "Tab", mods = mod.SHIFT_REV, action = act.ActivateTabRelative(-1) },

  --------- Window ---------
  { key = "Enter", mods = mod.SUPER, action = act.ToggleFullScreen },
  { key = "n", mods = mod.SUPER, action = act.SpawnWindow },
  -- { key = 'q', mods = 'SUPER', action = act.QuitApplication },

  -- background controls --
  -- {
  --    key = [[/]],
  --    mods = mod.SUPER,
  --    action = wezterm.action_callback(function(window, _pane)
  --       backdrops:random(window)
  --    end),
  -- },
  -- {
  --    key = [[,]],
  --    mods = mod.SUPER,
  --    action = wezterm.action_callback(function(window, _pane)
  --       backdrops:cycle_back(window)
  --    end),
  -- },
  -- {
  --    key = [[.]],
  --    mods = mod.SUPER,
  --    action = wezterm.action_callback(function(window, _pane)
  --       backdrops:cycle_forward(window)
  --    end),
  -- },
  -- {
  --    key = [[/]],
  --    mods = mod.SUPER_REV,
  --    action = act.InputSelector({
  --       title = 'Select Background',
  --       choices = backdrops:choices(),
  --       fuzzy = true,
  --       fuzzy_description = 'Select Background: ',
  --       action = wezterm.action_callback(function(window, _pane, idx)
  --          ---@diagnostic disable-next-line: param-type-mismatch
  --          backdrops:set_img(window, tonumber(idx))
  --       end),
  --    }),
  -- },

  -- panes --
  -- panes: split panes
  {
    key = "\\",
    mods = mod.SUPER,
    action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "\\",
    mods = mod.SUPER_REV,
    action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  -- { key = '5', mods = 'SHIFT|ALT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
  -- panes: zoom+close pane
  { key = "Enter", mods = mod.OPT, action = act.TogglePaneZoomState },
  -- panes: navigation
  { key = "k", mods = mod.SUPER_REV, action = act.ActivatePaneDirection("Up") },
  { key = "j", mods = mod.SUPER_REV, action = act.ActivatePaneDirection("Down") },
  { key = "h", mods = mod.SUPER_REV, action = act.ActivatePaneDirection("Left") },
  { key = "l", mods = mod.SUPER_REV, action = act.ActivatePaneDirection("Right") },
  {
    key = "p",
    mods = mod.SUPER_REV,
    action = act.PaneSelect({ alphabet = "1234567890", mode = "SwapWithActiveKeepFocus" }),
  },

  -- key-tables --
  -- resizes fonts
  {
    key = "f",
    mods = "LEADER",
    -- mods = mod.SUPER_REV,
    action = act.ActivateKeyTable({
      name = "resize_font",
      one_shot = false,
      timemout_miliseconds = 1000,
    }),
  },
  -- resize panes
  {
    key = "p",
    mods = "LEADER",
    action = act.ActivateKeyTable({
      name = "resize_pane",
      one_shot = false,
      timemout_miliseconds = 1000,
    }),
  },

  -- Reload configuration
  --   { key = 'r', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
  --   { key = 'r', mods = 'SUPER', action = act.Re
  --   { key = 'R', mods = 'CTRL', action = act.ReloadConfiguration },
  --   { key = 'R', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },loadConfiguration },
}

-- stylua: ignore
local key_tables = {
   resize_font = {
      { key = 'k',      action = act.IncreaseFontSize },
      { key = 'j',      action = act.DecreaseFontSize },
      { key = 'r',      action = act.ResetFontSize },
      { key = 'Escape', action = 'PopKeyTable' },
      { key = 'q',      action = 'PopKeyTable' },
   },
   resize_pane = {
      { key = 'k',      action = act.AdjustPaneSize({ 'Up', 1 }) },
      { key = 'j',      action = act.AdjustPaneSize({ 'Down', 1 }) },
      { key = 'h',      action = act.AdjustPaneSize({ 'Left', 1 }) },
      { key = 'l',      action = act.AdjustPaneSize({ 'Right', 1 }) },
      { key = 'Escape', action = 'PopKeyTable' },
      { key = 'q',      action = 'PopKeyTable' },
   },
}

local mouse_bindings = {
  -- Ctrl-click will open the link under the mouse cursor
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "CTRL",
    action = act.OpenLinkAtMouseCursor,
  },
  -- Disable the 'Down' event of CTRL-Click to avoid weird program behaviors
  {
    event = { Down = { streak = 1, button = "Left" } },
    mods = "CTRL",
    action = act.Nop,
  },
}

return {
  disable_default_key_bindings = true,
  leader = LEADER,
  keys = keys,
  key_tables = key_tables,
  mouse_bindings = mouse_bindings,
}

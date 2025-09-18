-- Fast and feature-rich surround actions. For text that includes
-- surrounding characters like brackets or quotes, this allows you
-- to select the text inside, change or modify the surrounding characters,
-- and more.
-- ref: https://www.lazyvim.org/extras/coding/mini-surround
return {
  "nvim-mini/mini.surround",
  opts = {
    mappings = {
      -- add = "gsa", -- Add surrounding in Normal and Visual modes
      -- delete = "gsd", -- Delete surrounding
      -- find = "gsf", -- Find surrounding (to the right)
      -- find_left = "gsF", -- Find surrounding (to the left)
      -- highlight = "gsh", -- Highlight surrounding
      -- replace = "gsr", -- Replace surrounding
      -- update_n_lines = "gsn", -- Update `n_lines`
      -- NOTE: Sometime, these keybinds are shifted around :)
      add = "gza", -- Add surrounding in Normal and Visual modes
      delete = "gzd", -- Delete surrounding
      -- find = "gzf", -- Find surrounding (to the right)
      -- find_left = "gzF", -- Find surrounding (to the left)
      highlight = "gzh", -- Highlight surrounding
      replace = "gzr", -- Replace surrounding
      update_n_lines = "gzn", -- Update `n_lines`
    },
  },
}

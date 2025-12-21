return {
  -- NOTE: https://www.lazyvim.org/plugins/editor
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    -- will be disabled when mini-diffs is enabled
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      signs_staged = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
    },
  },
  { -- change trouble config
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
  },
  { -- Highlight todo, notes, etc in comments
    "folke/todo-comments.nvim",
    event = "LazyFile",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = true },
  },
}

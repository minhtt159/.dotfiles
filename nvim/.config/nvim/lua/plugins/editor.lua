return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {},
          never_show = {
            ".git",
            ".DS_Store",
            "thumbs.db",
          },
        },
      },
    },
  },
  {
    -- NOTE: flash is disabled by leap
    "folke/flash.nvim",
    enabled = false,
  },
  { -- Useful plugin to show you pending keybinds.
    "folke/which-key.nvim",
    enabled = true,
  },
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

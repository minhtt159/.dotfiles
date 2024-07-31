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
    "folke/flash.nvim",
    -- NOTE: Disable flash because conflicted with surrounds
    enabled = false,
    keys = {
      -- disable the default flash keymap
      -- { "s", mode = { "n", "x", "o" }, false },
      -- or custom
      -- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      -- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  { -- Useful plugin to show you pending keybinds.
    "folke/which-key.nvim",
    enabled = true,
  },
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
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
  -- NOTE: It's gonna import telescope & fzf
}

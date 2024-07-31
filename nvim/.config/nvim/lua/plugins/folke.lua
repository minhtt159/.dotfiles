return {
  -- Highlight todo, notes, etc in comments
  {
    -- INFO: https://github.com/folke/todo-comments.nvim
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- opts will be merged with the parent spec
    opts = { signs = true },
  },
  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },
  {
    "folke/zen-mode.nvim",
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
    opts = {
      spec = {
        -- Document existing key chains
        { "<leader>c", mode = { "n" }, desc = "[C]ode" },
        { "<leader>d", mode = { "n" }, desc = "[D]ocument" },
        { "<leader>s", mode = { "n" }, desc = "[S]earch" },
        -- { "<leader>r", mode = { "n" }, desc = "[R]ename" },
        -- { "<leader>w", mode = { "n" }, desc = "[W]orkspace" },
      },
    },
  },
}

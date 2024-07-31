return {
  -- Highlight todo, notes, etc in comments
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
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
  -- { -- Useful plugin to show you pending keybinds.
  --   "folke/which-key.nvim",
  --   event = "VimEnter", -- Sets the loading event to 'VimEnter'
  --   opts = function(_, opts)
  --     if require("lazyvim.util").has("noice.nvim") then
  --       opts.defaults["<leader>sn"] = { name = "+noice" }
  --     end
  --   end,
  --   config = function() -- This is the function that runs, AFTER loading
  --     require("which-key").setup()
  --
  --     -- Document existing key chains
  --     require("which-key").register({
  --       ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
  --       ["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
  --       ["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
  --       ["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
  --       ["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
  --     })
  --   end,
  -- },
  {
    "folke/persistence.nvim",
    enabled = false,
  },
  -- Bufferline gives me a lot of trouble, so I'm disabling it for now
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "rcarriga/nvim-notify",
    enabled = true,
    -- opts = {
    --   background_colour = "#000000",
    -- },
  },
  {
    "stevearc/dressing.nvim",
    enabled = true,
  },
  {
    "folke/noice.nvim",
    enabled = true,
  },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   opts = {
  --     char = "▏",
  --   },
  -- },
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   event = "BufRead",
  --   config = true,
  -- },
}

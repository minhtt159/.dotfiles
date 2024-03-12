-- overwrite whatever extra from LazyVim
return {
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

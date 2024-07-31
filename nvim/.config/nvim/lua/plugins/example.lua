return {
  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
  },
  -- {
  --   -- Jinja syntax highlighting
  --   "HiPhish/jinja.vim",
  -- },
  -- "gc" to comment visual regions/lines
  {
    "numToStr/Comment.nvim",
    opts = {},
  },
  {
    "lucidph3nx/nvim-sops",
    event = { "BufEnter" },
    keys = {
      { "<leader>ef", vim.cmd.SopsEncrypt, desc = "[E]ncrypt [F]ile" },
      { "<leader>df", vim.cmd.SopsDecrypt, desc = "[D]ecrypt [F]ile" },
    },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
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
}

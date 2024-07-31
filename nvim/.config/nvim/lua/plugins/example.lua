return {
  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
  },
  -- "gc" to comment visual regions/lines
  -- {
  --   "numToStr/Comment.nvim",
  --   opts = {},
  -- },
  {
    "lucidph3nx/nvim-sops",
    event = { "BufEnter" },
    keys = {
      -- TODO: I'm gonna do this later
      -- { "<leader>sef", vim.cmd.SopsEncrypt, desc = "[S]ops [E]ncrypt [F]ile" },
      -- { "<leader>sdf", vim.cmd.SopsDecrypt, desc = "[S]ops [D]ecrypt [F]ile" },
    },
    opts = {
      enabled = true,
      debug = false,
      binPath = "sops", -- assumes its on $PATH
      defaults = { -- overriding any env vars as needed
        awsProfile = "AWS_PROFILE",
        ageKeyFile = "SOPS_AGE_KEY_FILE",
        gcpCredentialsPath = "GOOGLE_APPLICATION_CREDENTIALS",
      },
    },
  },
  {
    "folke/zen-mode.nvim",
  },
}

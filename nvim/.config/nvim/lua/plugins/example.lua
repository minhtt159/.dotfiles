return {
  -- add symbols-outline
  -- {
  --   "simrat39/symbols-outline.nvim",
  --   keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
  -- },
  {
    "folke/zen-mode.nvim",
    enabled = true,
  },
  {
    "lucidph3nx/nvim-sops",
    event = { "BufEnter" },
    keys = {
      { "<leader>see", vim.cmd.SopsEncrypt, desc = "[S]ops [E]ncrypt [F]ile" },
      { "<leader>sed", vim.cmd.SopsDecrypt, desc = "[S]ops [D]ecrypt [F]ile" },
    },
    opts = {
      enabled = true,
      debug = false,
      binPath = "sops", -- assumes its on $PATH
      defaults = { -- overriding any env vars as needed
        -- awsProfile = "AWS_PROFILE",
        -- ageKeyFile = "SOPS_AGE_KEY_FILE",
        -- gcpCredentialsPath = "GOOGLE_APPLICATION_CREDENTIALS",
      },
    },
  },
}

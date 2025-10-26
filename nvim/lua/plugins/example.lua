return {
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
        awsProfile = "", -- I'm not using Secrets Manager
        -- ageKeyFile = "SOPS_AGE_KEY_FILE",
        -- gcpCredentialsPath = "GOOGLE_APPLICATION_CREDENTIALS",
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        hidden = true, -- for hidden files
        ignored = true, -- for .gitignore files
      },
    },
  },
}

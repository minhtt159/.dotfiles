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
        -- awsProfile = "AWS_PROFILE",
        -- ageKeyFile = "SOPS_AGE_KEY_FILE",
        -- gcpCredentialsPath = "GOOGLE_APPLICATION_CREDENTIALS",
      },
    },
  },
  {
    "saghen/blink.cmp",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      completion = {
        menu = {
          border = "rounded",
        },
      },
      documentation = {
        border = "rounded",
      },
      signature = {
        window = {
          border = "rounded",
        },
      },
    },
  },
}

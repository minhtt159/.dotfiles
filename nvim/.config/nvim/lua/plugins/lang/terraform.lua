return {
  -- NOTE: most of the plugins are installed with
  -- lazyvim.plugins.extras.lang.terraform
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        terraformls = {},
        tflint = {},
      },
    },
  },
}

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ginko_ls = {},
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "ginko_ls",
      },
    },
  },
}

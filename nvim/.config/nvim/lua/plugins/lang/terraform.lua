-- local Util = require("lazyvim.util")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        terraformls = {},
        tflint = {},
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        terraform = { "terraform_validate" },
        tf = { "terraform_validate" },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        terraform = { "terraform_fmt" },
        tf = { "terraform_fmt" },
        ["terraform-vars"] = { "terraform_fmt" },
      },
    },
  },
  {
    "towolf/vim-helm",
  },
}

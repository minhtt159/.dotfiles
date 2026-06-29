return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- format-on-save is handled by LazyVim/conform (terraform_fmt)
        terraformls = {
          filetypes = { "terraform", "hcl" },
        },
      },
    },
  },
}

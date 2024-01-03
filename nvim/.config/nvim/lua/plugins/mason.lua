return {
  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        -- Shell
        "shellcheck",
        "shfmt",
        -- Python
        "ruff-lsp",
        -- DevOps
        "tfsec",
        "dockerfile-language-server",
        "docker-compose-language-service",
      },
      ui = {
        border = "rounded",
      },
    },
  },
}
return {
  -- NOTE: most of the plugins are installed with
  -- lazyvim.plugins.extras.lang.helm
  {
    "towolf/vim-helm",
    ft = "helm",
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "helm-ls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        helm_ls = {
          logLevel = "info",
          valuesFiles = {
            mainValuesFile = "values.yaml",
            lintOverlayValuesFile = "values.lint.yaml",
            additionalValuesFilesGlobPattern = "values*.yaml",
          },
        },
      },
    },
  },
}

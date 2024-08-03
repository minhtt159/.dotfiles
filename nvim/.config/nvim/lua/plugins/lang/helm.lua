return {
  -- NOTE: most of the plugins are installed with
  -- lazyvim.plugins.extras.lang.helm
  { "towolf/vim-helm", ft = "helm" },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "helm-ls",
      },
    },
  },
}

return {
  -- NOTE: most of the plugins are installed with
  -- lazyvim.plugins.extras.lang.helm
  { "towolf/vim-helm", ft = "helm" },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "helm-ls",
      })
    end,
  },
}

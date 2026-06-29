return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          -- yamlls reads schemas from settings.yaml.schemas (NOT config.*).
          -- LazyVim's yaml extra already wires SchemaStore; this adds a
          -- kubernetes glob on top.
          -- TODO: Adjust the globs to your manifest layout.
          settings = {
            yaml = {
              schemas = {
                kubernetes = { "*.k8s.yaml", "*/k8s/*.yaml", "*/manifests/*.yaml" },
              },
            },
          },
        },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "gitlab-ci-ls",
      },
    },
  },
}

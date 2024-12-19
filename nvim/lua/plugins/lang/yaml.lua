return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          enabled = true,
          diagnosticsLimit = 50,
          showDiagnosticsDirectly = false,
          path = "yaml-language-server",
          config = {
            schemas = {
              kubernetes = "globPattern",
            },
            completion = true,
            hover = true,
          },
        },
      },
    },
  },
}

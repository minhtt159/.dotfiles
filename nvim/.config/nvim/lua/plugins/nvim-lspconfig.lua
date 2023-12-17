local lspconfig = require("lspconfig")

return {
  {
    "neovim/nvim-lspconfig",
    -- TODO: add more language LSP config
    dependencies = {},
    ---@class PluginLspOpts
    opts = {
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        rust_analyser = function(_, opts)
          lspconfig.rust_analyser.setup({
            server = opts,
            root_dir = lspconfig.util.root_pattern("Cargo.toml"),
          })
        end,
        -- Specify * to use this function as a fallback for any server
        ["*"] = function(server, opts) end,
      },
    },
  },
}

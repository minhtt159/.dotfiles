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
        -- example to setup with typescript.nvim
        ruff_lsp = function(_, opts)
          require("lspconfig").ruff_lsp.setup({ server = opts })
          return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },
}

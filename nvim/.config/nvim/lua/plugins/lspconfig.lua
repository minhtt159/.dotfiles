return {
  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
      },
    },
  },

  -- add tsserver and setup with typescript.nvim instead of lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {},
    ---@class PluginLspOpts
    opts = {
      -- ---@type lspconfig.options
      -- servers = {
      --   -- tsserver will be automatically installed with mason and loaded with lspconfig
      --   tsserver = {},
      -- },
      -- -- you can do any additional lsp server setup here
      -- -- return true if you don't want this server to be setup with lspconfig
      -- ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        --   -- example to setup with typescript.nvim
        --   tsserver = function(_, opts)
        --     require("typescript").setup({ server = opts })
        --     return true
        --   end,
        -- Specify * to use this function as a fallback for any server
        ["*"] = function(server, opts) end,
      },
    },
  },
}


return {
  -- NOTE: most of the plugins are installed with lazyvim.plugins.extras.lang.go
  -- https://www.lazyvim.org/extras/lang/go
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          -- NOTE: eventually I will have a different JS.lua
          filetypes = { "templ", "astro", "javascript", "typescript", "react" },
          init_options = {
            userLanguages = {
              templ = "html",
            },
          },
        },
        htmx = {
          filetypes = { "html", "templ" },
        },
        html = {
          filetypes = { "html", "templ" },
        },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- https://templ.guide/developer-tools/ide-support#neovim--050
        "templ",
        "htmx-lsp", -- htmx
        "html-lsp", -- html
        "tailwindcss-language-server", -- tailwindcss
      },
    },
  },
}

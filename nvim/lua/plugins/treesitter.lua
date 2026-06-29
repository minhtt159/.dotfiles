return {
  {
    -- Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    -- Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- Essentials
        "bash",
        "vim",
        "json",
        "yaml",
        "lua",
        "query",
        "sql",
        -- Editor
        "comment",
        "markdown",
        "markdown_inline",
        -- Langs
        "c",
        "python",
        "regex",
        "rust",
        "dockerfile",
        -- Web bros
        "gotmpl",
        "templ",
        "html",
        "tsx",
        -- "javascript",
        "typescript",
      },
    },
  },
  {
  "folke/noice.nvim",
  opts = {
    cmdline = {
      format = {
        cmdline = { lang = "" },
        search_down = { lang = "" },
        search_up = { lang = "" },
        filter = { lang = "" },
        lua = { lang = "" },
      },
    },
  },
}
}

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
      ignore_install = { "tex", "latex" },
      -- Autoinstall languages that are not installed
      sync_install = false,
      auto_install = true,
    },
  },
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation#lazynvim
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        sync_install = false,
        auto_install = true,
        ensure_installed = {
          "bash",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "query",
          "regex",
          "tsx",
          "typescript",
          "vim",
          "yaml",
          "tsx",
          "typescript",
          "rust",
          "c",
          "dockerfile",
        },
        indent = {
          enable = true,
        },
        ignore_install = { "tex", "latex" },
        highlight = {
          enable = true,
          use_languagetree = true,
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
        -- do I want to add treesitter parser config
      })
    end,
  },
}

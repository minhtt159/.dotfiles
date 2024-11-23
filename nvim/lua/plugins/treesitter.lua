return {
  {
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    -- - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    -- - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    -- - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        -- Essentials
        "bash",
        "vim",
        "json",
        "yaml",
        "lua",
        "query",
        -- Editor
        "markdown",
        "markdown_inline",
        -- Langs
        "c",
        "python",
        "regex",
        "rust",
        "dockerfile",
        -- Web bros
        "html",
        "tsx",
        "typescript",
        "javascript",
        "typescript",
      },
      -- Autoinstall languages that are not installed
      sync_install = false,
      auto_install = true,
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
    },
  },
}

return {
  {
    -- NOTE: https://github.com/alexpasmantier/television.nvim
    "alexpasmantier/television.nvim",
    version = "*",
    build = ":TVInstallBinary",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      backend = {
        log_level = "warn",
      },
      ui = {
        -- Size of the television floating window (as a fraction of the screen)
        width = 0.85,
        height = 0.85,
        border = "rounded",
        -- Automatically hide preview panel on narrow screens
        preview_hidden_above_width = 100,
      },
      -- Channels available in the switcher (prefix+T remote control)
      channels = {
        "files",
        "git-repos",
        "git-branch",
        "git-log",
        "git-diff",
        "diagnostics",
        "lsp-references",
        "lsp-definitions",
        "lsp-symbols",
        "buffers",
        "command-history",
        "env",
      },
    },
    keys = {
      { "<leader>tv", "<cmd>Television<cr>",                desc = "Television (all channels)" },
      { "<leader>tf", "<cmd>Television files<cr>",          desc = "Television: Files" },
      { "<leader>tg", "<cmd>Television text-search<cr>",    desc = "Television: Text Search" },
      { "<leader>tb", "<cmd>Television buffers<cr>",        desc = "Television: Buffers" },
      { "<leader>tG", "<cmd>Television git-repos<cr>",      desc = "Television: Git Repos" },
      { "<leader>tB", "<cmd>Television git-branch<cr>",     desc = "Television: Git Branches" },
      { "<leader>tl", "<cmd>Television git-log<cr>",        desc = "Television: Git Log" },
      { "<leader>td", "<cmd>Television diagnostics<cr>",    desc = "Television: Diagnostics" },
      { "<leader>tr", "<cmd>Television lsp-references<cr>", desc = "Television: LSP References" },
      { "<leader>ts", "<cmd>Television lsp-symbols<cr>",    desc = "Television: LSP Symbols" },
    },
  },
}

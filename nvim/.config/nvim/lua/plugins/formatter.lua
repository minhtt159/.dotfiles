return {
  { -- Autoformat
    -- NOTE: Usually, the language will install this plugin
    -- but put it here just to be safe
    "stevearc/conform.nvim",
    event = "VeryLazy",
    opts = {
      default_format_opts = {
        notify_on_error = true,
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      },
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
  },
}

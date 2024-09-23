return { -- https://www.lazyvim.org/plugins/ui
  {
    -- INFO: Maybe I want to do it myself instead of using LazyVim defaults
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    -- keys = {
    --   { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
    --   { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    --   { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
    --   { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
    --   { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
    --   { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    --   { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    --   { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    --   { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    --   { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
    --   { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
    -- },
    opts = {
      options = {
        theme = "auto",
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        -- ignore_focus = {},
        -- always_divide_middle = true,
        -- globalstatus = false,
        -- refresh = {
        --   statusline = 1000,
        --   tabline = 1000,
        --   winbar = 1000,
        -- },
      },
    },
  },
}

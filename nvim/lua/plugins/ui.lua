return {
  -- NOTE: https://www.lazyvim.org/plugins/ui
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
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
  },
}

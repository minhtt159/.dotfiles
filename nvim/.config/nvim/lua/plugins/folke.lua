return {
  {
    "folke/trouble.nvim",
    -- enabled = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = { use_diagnostic_signs = true },
    config = function()
      local trouble = require("trouble")
      -- Lua
      vim.keymap.set("n", "<leader>xx", function() trouble.toggle() end, { desc = "Trouble list" })
      vim.keymap.set("n", "<leader>xw", function() trouble.toggle("workspace_diagnostics") end, { desc = "Trouble workspace diagnostic" })
      vim.keymap.set("n", "<leader>xd", function() trouble.toggle("document_diagnostics") end, { desc = "Trouble file diagnostic" })
      vim.keymap.set("n", "<leader>xq", function() trouble.toggle("quickfix") end, { desc = "Toggle quickfix items" })
      vim.keymap.set("n", "<leader>xl", function() trouble.toggle("loclist") end, { desc = "Items from the window's location list" })
      vim.keymap.set("n", "gR", function() trouble.toggle("lsp_references") end, { desc = "References from LSP client"})
      -- Overwrite LSP diagnostic
      -- vim.keymap.set("n", "[d", function() trouble.next({ skip_groups = true, jump = true }) end, { desc = "Jump to next diagnostic" })
      -- vim.keymap.set("n", "]d", function() trouble.previous({ skip_groups = true, jump = true }) end, { desc = "Jump to previous diagnostic" })
    end,
  },
  {
    "folke/flash.nvim",
    -- https://github.com/LazyVim/LazyVim/discussions/1891
    -- enabled = false,
    event = "VeryLazy",
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
    "folke/which-key.nvim",
    -- event = "VeryLazy"
    -- Lazy seems to add more keymap than I can understand, so keep it disabled for now
    enabled = false,
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
}

-- Might work, might not work, who knows
-- Freaking Primeagen
return {
  {
    "ThePrimeagen/harpoon",
    name = "harpoon",
    lazy = false,
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      vim.keymap.set("n", "<leader>hm", function()
        harpoon:list():append()
      end, { desc = "Show harpoon marks" })
      vim.keymap.set("n", "<leader>ha", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = "Mark file with harpoon" })
      vim.keymap.set("n", "<leader>hn", function()
        harpoon:list():next()
      end, { desc = "Go to next harpoon mark" })
      vim.keymap.set("n", "<leader>hp", function()
        harpoon:list():prev()
      end, { desc = "Go to previous harpoon mark" })
      vim.keymap.set("n", "<C-n>", function()
        harpoon:list():select(1)
      end, { desc = "File 1" })
      vim.keymap.set("n", "<C-m>", function()
        harpoon:list():select(2)
      end, { desc = "File 2" })
      vim.keymap.set("n", "<C-,>", function()
        harpoon:list():select(3)
      end, { desc = "File 3" })
      vim.keymap.set("n", "<C-.>", function()
        harpoon:list():select(4)
      end, { desc = "File 4" })
    end,
  },
}


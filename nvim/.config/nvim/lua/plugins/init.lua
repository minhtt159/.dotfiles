return {
  {
    "nvim-lua/plenary.nvim",
    priority = 1000
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "UndotreeToggle" })
    end,
  },
  {
		"j-hui/fidget.nvim",
    config = function()
      require("fidget").setup({})
    end
  },
}
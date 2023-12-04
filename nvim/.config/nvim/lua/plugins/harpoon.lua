-- Might work, might not work, who knows
-- Freaking Primeagen
return {
	"ThePrimeagen/harpoon",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = true,
	keys = {
		{ "<leader>ha", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },
		{ "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
		{ "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Go to next harpoon mark" },
		{ "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Go to previous harpoon mark" },
    { "<C-n>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "File 1" },
    { "<C-m>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "File 2" },
    { "<C-,>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "File 3" },
    { "<C-.>", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "File 4" },
	},
}
-- vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
-- vim.keymap.set("n", "<C-d>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
-- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<C-m>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<C-,>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<C-.>", function() harpoon:list():select(4) end)
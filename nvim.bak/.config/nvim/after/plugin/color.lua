function ColorMe(color)
	-- Set color scheme
	-- color = color or 'rose-pine'
  color = color or 'dark-decay'
	vim.cmd.colorscheme(color)
	
	-- Set Transparent Background
	vim.api.nvim_set_hl(0, "Normal", { bg = 'none' })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = 'none' })
end

-- Setup decay
local present, decay = pcall(require, 'decay')

if not present then
  error("Can't import decay, make sure you installed it! :v")
end

decay.setup({
  style = 'dark',
  nvim_tree = {
    contrast = true, -- or false to disable tree contrast
  },
})

-- Set the color
ColorMe()

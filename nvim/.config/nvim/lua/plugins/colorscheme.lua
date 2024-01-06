function ColorMe(color)
	-- Set color scheme
	color = color or 'rose-pine'
	vim.cmd.colorscheme(color)
	
	-- Set Transparent Background
	vim.api.nvim_set_hl(0, "Normal", { bg = 'none' })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = 'none' })
end

return {
  -- Color Schemes goes here
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
  {
    "decaycs/decay.nvim",
    name = "decay",
    opts = {
      style = "dark",
      nvim_tree = {
        contrast = true, -- or false to disable tree contrast
      },
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      term_colors = true,
      transparent_background = false,
      styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
      integrations = {
        cmp = true,
        treesitter = true,
        telescope = {
          enabled = true,
          -- style = "nvchad"
        },
        which_key = true,
        flash = true,
        harpoon = true,
        -- dropbar = {
        --   enabled = true,
        --   color_mode = true,
        -- },
      },
    },
    config = function()
      -- load the colorscheme
      ColorMe(catppuccin)
    end,
  },
  -- -- Configure LazyVim to load
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "catppuccin",
  --     -- colorscheme = "decay",
  --   },
  -- },
}


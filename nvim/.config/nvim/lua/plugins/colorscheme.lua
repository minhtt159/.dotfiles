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
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        dropbar = {
          enabled = true,
          color_mode = true,
        },
      },
    },
  },
  -- Configure LazyVim to load
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
      -- colorscheme = "decay",
    },
  },
}


return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
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
  { -- https://github.com/catppuccin/nvim?tab=readme-ov-file#configuration
    "catppuccin/nvim",
    priority = 1000,
    opts = {
      term_colors = true,
      transparent_background = true,
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
    },
  },
  { -- Set colorscheme to catppuccin
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
      -- transparent_background = true,
    },
  },
}

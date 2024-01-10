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
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    opts = function()
      return {}
    end,
    config = function()
      require("catppuccin").setup({
        term_colors = true,
        transparent_background = true,
        color_overrides = {
          mocha = {
            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
          },
        },
      })
    end,
  },
  -- This is not doing shit
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}

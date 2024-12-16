return {
  { -- https://github.com/catppuccin/nvim?tab=readme-ov-file#configuration
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = true,
    opts = {
      flavour = "mocha",
      term_colors = true,
      transparent_background = true,
      -- color_overrides = {
      --   mocha = {
      --     base = "#000000",
      --     mantle = "#000000",
      --     crust = "#000000",
      --   },
      -- },
    },
  },
  { -- Set colorscheme to catppuccin
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}

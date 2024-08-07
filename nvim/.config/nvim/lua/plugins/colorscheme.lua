return {
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = true,
  --   opts = {
  --     transparent = true,
  --     styles = {
  --       sidebars = "transparent",
  --       floats = "transparent",
  --     },
  --   },
  -- },
  -- {
  --   "decaycs/decay.nvim",
  --   lazy = false,
  --   opts = {
  --     style = "dark",
  --     -- enables italics in code keywords & comments.
  --     italics = {
  --       code = true,
  --       comments = true,
  --     },
  --     -- enables contrast when using nvim tree.
  --     nvim_tree = {
  --       contrast = true,
  --     },
  --   },
  -- },
  { -- https://github.com/catppuccin/nvim?tab=readme-ov-file#configuration
    "catppuccin/nvim",
    priority = 1000,
    lazy = true,
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
    },
  },
}

return {
  -- NOTE: https://www.lazyvim.org/plugins/ui
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
    },
  },
  {
    "snacks.nvim",
    opts = {
      picker = {
        sources = {
          -- each source defaults hidden/ignored to false, so set per-source
          files = { hidden = true, ignored = true }, -- show dotfiles + gitignored
          grep = { hidden = true, ignored = true },
          explorer = { hidden = true, ignored = true }, -- the sidebar tree
        },
      },
    },
  },
  {
    -- NOTE: I don't use this because neovim
    -- always is the first window in tmux
    "folke/persistence.nvim",
    enabled = false,
  },
}

return {
  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    enabled = false,
    opts = { use_diagnostic_signs = true },
  },
  {
    "folke/flash.nvim",
    -- https://github.com/LazyVim/LazyVim/discussions/1891
    enabled = false,
  }
}
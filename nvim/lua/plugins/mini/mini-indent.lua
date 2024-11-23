return {
  -- Active indent guide and indent text objects. When you're browsing
  -- code, this highlights the current level of indentation, and animates
  -- the highlighting.
  -- NOTE: Enabled with LazyVim, but keep opts here for customization
  -- https://www.lazyvim.org/extras/ui/mini-indentscope
  {
    "echasnovski/mini.indentscope",
    event = "LazyFile",
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "LazyFile",
    opts = {
      scope = { enabled = false },
    },
  },
}

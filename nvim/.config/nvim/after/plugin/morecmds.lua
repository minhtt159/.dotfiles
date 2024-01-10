function ColorMe(color)
  -- Set color scheme
  color = color or "catppuccin"
  vim.cmd.colorscheme(color)

  -- Set Transparent Background
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- So LazyVim will not trigger this to I'll do it myself
ColorMe()

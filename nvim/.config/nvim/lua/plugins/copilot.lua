-- Plugins for copilot
return {
  -- Deprecated by zbirenbaum/copilot.lua
  -- {
  --   "github/copilot.vim",
  -- },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
          -- default copilot disabled this types so I enable them
          markdown = true,
          help = true,
        },
        -- TODO: how about copilot panel?
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup()
    end
  }
}
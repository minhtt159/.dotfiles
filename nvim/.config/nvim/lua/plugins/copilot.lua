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
        -- suggestion = {
        --   keymap = {
        --     -- accept = "<C-CR>",
        --     accept = "<M-l>",
        --     accept_word = false,
        --     accept_line = false,
        --     -- I'm noob so I don't know what is `<M`
        --     next = "<C-]>",
        --     prev = "<C-[>",
        --     dismiss = "<C-\\>",
        --   },
        -- },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = "copilot.lua",
    config = function ()
      require("copilot_cmp").setup()
    end
  }
}
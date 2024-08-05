return {
  -- {
  --   --  Check out: https://github.com/echasnovski/mini.nvim
  --
  --   -- NOTE: 1. most of mini plugins are supported by LazyVim
  --   --  it will break if install mini.nvim default
  --
  --   -- NOTE: 2. if something break, I can enable mini again
  --
  --   -- Collection of various small independent plugins/modules
  --   "echasnovski/mini.nvim",
  --   version = "*",
  --   config = function()
  --     local statusline = require("mini.statusline")
  --     statusline.setup({ use_icons = true })
  --     -- You can configure sections in the statusline by overriding their
  --     -- default behavior. For example, here we set the section for
  --     -- cursor location to LINE:COLUMN
  --     ---@diagnostic disable-next-line: duplicate-set-field
  --     statusline.section_location = function()
  --       return "%2l:%-2v"
  --     end
  --   end,
  -- },
  { -- https://www.lazyvim.org/plugins/ui#miniicons
    "echasnovski/mini.icons",
    lazy = true,
    opts = {
      file = {
        [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
        ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
      },
      filetype = {
        dotenv = { glyph = "", hl = "MiniIconsYellow" },
      },
    },
  },
  { -- https://www.lazyvim.org/plugins/coding#miniai
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    "echasnovski/mini.ai",
    opts = {
      n_lines = 500,
    },
  },
  { -- https://www.lazyvim.org/plugins/coding#minipairs
    "echasnovski/mini.pairs",
    opts = {
      modes = { insert = true, command = true, terminal = false },
      -- skip autopair when next character is one of these
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      -- skip autopair when the cursor is inside these treesitter nodes
      skip_ts = { "string" },
      -- skip autopair when next character is closing pair
      -- and there are more closing pairs than opening pairs
      skip_unbalanced = true,
      -- better deal with markdown code blocks
      markdown = true,
    },
  },
  { -- https://www.lazyvim.org/extras/coding/mini-surround#minisurround
    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - gsaiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - gsd'   - [S]urround [D]elete [']quotes
    -- - gsr)'  - [S]urround [R]eplace [)] [']
    "echasnovski/mini.surround",
    recommends = true,
    keys = function(_, keys)
      -- Populate the keys based on the user's options
      local opts = LazyVim.opts("mini.surround")
      local mappings = {
        { opts.mappings.add, desc = "Add Surrounding", mode = { "n", "v" } },
        { opts.mappings.delete, desc = "Delete Surrounding" },
        { opts.mappings.find, desc = "Find Right Surrounding" },
        { opts.mappings.find_left, desc = "Find Left Surrounding" },
        { opts.mappings.highlight, desc = "Highlight Surrounding" },
        { opts.mappings.replace, desc = "Replace Surrounding" },
        { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
      }
      mappings = vim.tbl_filter(function(m)
        return m[1] and #m[1] > 0
      end, mappings)
      return vim.list_extend(mappings, keys)
    end,
    opts = {
      mappings = {
        add = "gsa", -- Add surrounding in Normal and Visual modes
        delete = "gsd", -- Delete surrounding
        find = "gsf", -- Find surrounding (to the right)
        find_left = "gsF", -- Find surrounding (to the left)
        highlight = "gsh", -- Highlight surrounding
        replace = "gsr", -- Replace surrounding
        update_n_lines = "gsn", -- Update `n_lines`
      },
    },
  },
  {
    "echasnovski/mini.diff",
    opts = {
      view = {
        signs = {
          add = "+",
          change = "~",
          delete = "_",
          topdelete = "‾",
          changedelete = "~",
        },
      },
    },
  },
}

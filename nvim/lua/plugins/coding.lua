return {
  -- INFO: only add some custom keymaps if needed
  -- https://www.lazyvim.org/plugins/coding#nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    keys = {
      -- mapping = cmp.mapping.preset.insert({
      --   ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      --   ["<C-f>"] = cmp.mapping.scroll_docs(4),
      --   ["<C-Space>"] = cmp.mapping.complete(),
      --   ["<CR>"] = LazyVim.cmp.confirm({ select = auto_select }),
      --   ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
      --   ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      --   ["<C-CR>"] = function(fallback)
      --     cmp.abort()
      --     fallback()
      -- end,
    },
    ---@module 'cmp'
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      -- See `:help cmp`
      local cmp = require("cmp")
      table.insert(opts.sources, { name = "emoji", group_index = 2 })

      local auto_select = false
      opts.preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None
      opts.completion = {
        completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
      }
      -- Windows stuffs
      opts.window = {
        completion = cmp.config.window.bordered({}),
        documentation = cmp.config.window.bordered({}),
      }
      -- Set view to follow cursor while typing
      opts.view = {
        entries = {
          name = "custom",
          select = "near_cursor",
        },
      }
    end,
  },
}

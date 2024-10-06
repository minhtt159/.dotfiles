return {
  {
    -- To get keymaps with Telescope
    --  - LayzVim: <leader>sk
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim" },
      {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
          require("lazyvim.util").on_load("telescope.nvim", function()
            require("telescope").load_extension("ui-select")
          end)
        end,
      },
      -- Useful for getting pretty icons, but requires a Nerd Font.
      { "nvim-tree/nvim-web-devicons" },
    },
    keys = {},
    opts = {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        -- mappings = {
        --   i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        -- },
      },
      -- NOTE: LazyVim default is better?
      -- pickers = {
      --   find_files = {
      --     -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
      --     find_command = { "rg", "--files", "--glob", "!**/.git/*", "-L" },
      --   },
      -- },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    },
  },
}

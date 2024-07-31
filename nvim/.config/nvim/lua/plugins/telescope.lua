return {
  {
    -- Two important keymaps to use while in telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- telescope picker. This is really useful to discover what Telescope can
    -- do as well as how to actually do it!

    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
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
      -- { "DaikyXendo/nvim-material-icon" },
    },
    keys = {
      -- add a keymap to browse plugin files
      {
        "<leader>fp",
        LazyVim.pick("find_files", { cwd = require("lazy.core.config").options.root }),
        desc = "Find Plugin File",
      },
      { "<leader>fc", LazyVim.pick.config_files(), desc = "Find Config File" },
      -- Live Grep - require ripgrep
      { "<leader>/", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
      -- { "<leader>fg", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
      -- Thanks ThePrimeagen
      {
        "<leader>fws",
        function()
          local word = vim.fn.expand("<cword>")
          require("telescope.builtin").grep_string({ search = word })
        end,
        desc = "Grep single word",
      },
      {
        "<leader>fWs",
        function()
          local word = vim.fn.expand("<cWORD>")
          require("telescope.builtin").grep_string({ search = word })
        end,
        desc = "Grep whole word",
      },
    },
    -- change some options
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
      -- TODO: LazyVim default is better?
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

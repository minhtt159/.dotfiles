local builtin = require("telescope.builtin")
local lazy_core = require("lazy.core.config")

return {
  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        opts = {
          extensions = {
            fzf = {
              fuzzy = true,                   -- false will only do exact matching
              override_generic_sorter = true, -- override the generic sorter
              override_file_sorter = true,    -- override the file sorter
              case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                                              -- the default case_mode is "smart_case"
            },
          },
        },
      },
    },
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() builtin.find_files({ cwd = lazy_core.options.root }) end,
        desc = "Find Plugin File",
      },
      -- Most of other keymap is already set by Lazy.nvim default
    },
    -- change some options
    opts = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--follow",       -- Follow symbolic links
          "--hidden",       -- Search for hidden files
          "--no-heading",   -- Don't group matches by each file
          "--with-filename",-- Print the file path with the matched lines
          "--line-number",  -- Show line numbers
          "--column",       -- Show column numbers
          "--smart-case",   -- Smart case search
        },
        pickers = {
          find_files = {
            hidden = true,  -- <leader>ff will always how hidden files
          },
        },
        initial_mode = "insert",
        -- prompt_prefix = " " .. icons.ui.Telescope .. " ",
        -- selection_caret = icons.ui.ChevronRight,
        scroll_strategy = "limit",
        results_title = false,
        layout_strategy = "horizontal",
        path_display = { "absolute" },
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        color_devicons = true,
        file_ignore_patterns = { ".git/", ".cache", "build/", "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip" },
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.85,
          height = 0.92,
          preview_cutoff = 120,
        },
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
      },
    },
  },
}


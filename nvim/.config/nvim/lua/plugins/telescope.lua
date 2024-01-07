return {
  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    name = "telescope",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    -- change some options
    opts = {
    },
    config = function()
      require("telescope").setup({
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                                            -- the default case_mode is "smart_case"
          },
        },
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
      })
      -- add a keymap to browse plugin files
      local builtin = require("telescope.builtin")
      -- stylua: ignore
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Fuzzy File" })
      vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find Git files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep File" })
      vim.keymap.set("n", "<leader>fs", function() 
        builtin.grep_string({ search = vim.fn.input("Grep >") })
      end, { desc = "Grep File" })
      vim.keymap.set("n", "<leader>fws", function() 
        local word = vim.fn.expand("<cword>")
        builtin.grep_string({ search = word })
      end, { desc = "Grep single word" })
      vim.keymap.set("n", "<leader>fWs", function() 
        local word = vim.fn.expand("<cWORD>")
        builtin.grep_string({ search = word })
      end, { desc = "Grep whole word" })
      -- vim.keymap.set("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = "Find Buffer"},
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Helps" })
      -- Load fzf plugin
      require('telescope').load_extension('fzf')
    end,
  },
}

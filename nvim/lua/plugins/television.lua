return {
  {
    -- NOTE: https://github.com/alexpasmantier/tv.nvim
    -- Thin Lua wrapper around the `tv` binary — tv must be in PATH
    "alexpasmantier/tv.nvim",
    event = "VeryLazy",
    config = function()
      local h = require("tv").handlers

      require("tv").setup({
        -- tv binary is assumed to always be available in PATH (installed via Homebrew)
        tv_binary = "tv",

        -- Default layout for channels that don't override it
        layout = "landscape",

        -- Floating window defaults
        window = {
          width = 0.85,
          height = 0.85,
          border = "rounded",
          title = " tv ",
          title_pos = "center",
        },

        -- Global keybinding to open the channel selector
        global_keybindings = {
          channels = "<leader>tv",
        },

        -- ~~~~~~~~~~~~~~~~~~~~~~ Channel Configuration ~~~~~~~~~~~~~~~~~~~~~~
        channels = {
          -- Files
          files = {
            keybinding = "<leader>tf",
            args = { "--no-remote", "--no-status-bar", "--preview-size", "70" },
            handlers = {
              ["<CR>"]  = h.open_as_files,
              ["<C-v>"] = h.open_in_vsplit,
              ["<C-x>"] = h.open_in_split,
              ["<C-q>"] = h.send_to_quickfix,
              ["<C-y>"] = h.copy_to_clipboard,
            },
          },

          -- Full-text search (ripgrep)
          text = {
            keybinding = "<leader>tg",
            args = { "--no-remote", "--no-status-bar", "--preview-size", "70" },
            handlers = {
              ["<CR>"]  = h.open_at_line,
              ["<C-v>"] = h.open_in_vsplit,
              ["<C-x>"] = h.open_in_split,
              ["<C-q>"] = h.send_to_quickfix,
            },
          },

          -- Git
          ["git-branch"] = {
            keybinding = "<leader>tB",
            handlers = {
              ["<CR>"] = h.execute_shell_command("git checkout {}"),
              ["<C-y>"] = h.copy_to_clipboard,
            },
          },
          ["git-log"] = {
            keybinding = "<leader>tl",
            handlers = {
              ["<CR>"] = h.open_in_scratch,
              ["<C-y>"] = h.copy_to_clipboard,
            },
          },
          ["git-diff"] = {
            keybinding = "<leader>td",
            handlers = {
              ["<CR>"] = h.open_at_line,
              ["<C-q>"] = h.send_to_quickfix,
            },
          },
          ["git-repos"] = {
            keybinding = "<leader>tG",
            handlers = {
              ["<CR>"] = h.execute_shell_command("nvim {}"),
              ["<C-y>"] = h.copy_to_clipboard,
            },
          },

          -- Zsh command history
          ["zsh-history"] = {
            keybinding = "<leader>th",
            handlers = {
              ["<CR>"]  = h.insert_on_new_line,
              ["<C-i>"] = h.insert_at_cursor,
              ["<C-y>"] = h.copy_to_clipboard,
            },
          },

          -- Environment variables
          env = {
            keybinding = "<leader>te",
            handlers = {
              ["<CR>"]  = h.insert_at_cursor,
              ["<C-y>"] = h.copy_to_clipboard,
            },
          },

          -- Diagnostics (lsp errors/warnings)
          diagnostics = {
            keybinding = "<leader>tD",
            handlers = {
              ["<CR>"]  = h.open_at_line,
              ["<C-q>"] = h.send_to_quickfix,
            },
          },
        },
      })
    end,
  },
}

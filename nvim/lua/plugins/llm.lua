return {
  {
    -- ref: https://github.com/olimorris/dotfiles/blob/main/.config/nvim/lua/plugins/coding.lua
    "olimorris/codecompanion.nvim",
    dependencies = {
      -- Plugins
      -- "nvim-lua/plenary.nvim",
      -- "nvim-treesitter/nvim-treesitter",
      "j-hui/fidget.nvim",
      -- Save and load conversation history
      "ravitemer/codecompanion-history.nvim",
      {
        "ravitemer/mcphub.nvim", -- Manage MCP servers
        -- cmd = "MCPHub",
        -- build = "npm install -g mcp-hub@latest",
        -- config = true,
      },
    },
    init = function()
      require("plugins.llm_plugins.llm_fidget").init({})
      -- vim.cmd([[cab cc CodeCompanion]])
      --require("plugins.custom.spinner"):init()
    end,
    keys = {
      {
        "<C-a>",
        "<cmd>CodeCompanionActions<CR>",
        desc = "Open the action palette",
        mode = { "n", "v" },
      },
      {
        "<Leader>a",
        "<cmd>CodeCompanionChat Toggle<CR>",
        desc = "Toggle a chat buffer",
        mode = { "n", "v" },
      },
      {
        "<LocalLeader>a",
        "<cmd>CodeCompanionChat Add<CR>",
        desc = "Add code to a chat buffer",
        mode = { "v" },
      },
    },
    opts = {
      extensions = {
        history = {
          enabled = true,
          opts = {
            keymap = "gh",
            auto_generate_title = true,
            continue_last_chat = false,
            delete_on_clearing_chat = false,
            picker = "snacks",
            enable_logging = false,
            dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
          },
        },
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
      strategies = {
        chat = {
          adapter = "custom",
          keymaps = {
            send = {
              modes = {
                i = { "<C-CR>", "<C-s>" },
              },
            },
            completion = {
              modes = {
                i = "<C-x>",
              },
            },
          },
          slash_commands = {
            ["buffer"] = {
              keymaps = {
                modes = {
                  i = "<C-b>",
                },
              },
            },
            ["help"] = {
              opts = {
                max_lines = 1000,
              },
            },
          },
          tools = {
            opts = {
              auto_submit_success = false,
              auto_submit_errors = false,
            },
          },
        },
        inline = {
          adapter = "custom",
          keymaps = {
            accept_change = {
              modes = { n = "ga" },
              description = "Accept the suggested change",
            },
            reject_change = {
              modes = { n = "gA" },
              description = "Reject the suggested change",
            },
          },
        },
        cmd = {
          adapter = "custom",
        },
      },
      display = {
        action_palette = {
          provider = "default",
        },
        chat = {
          -- show_references = true,
          -- show_header_separator = false,
          show_settings = true,
        },
        diff = {
          enabled = true,
          -- NOTE: Comeback when gitsign is supported
          provider = "default", -- default|mini_diff
        },
      },
      opts = {
        -- Set debug logging
        log_level = "DEBUG",
      },
      adapters = {
        custom = function()
          ---@class OpenAICompatible.Adapter: CodeCompanion.Adapter
          return require("codecompanion.adapters").extend("openai_compatible", {
            formatted_name = "My Custom",
            env = {
              url = "tictacwindows:1234",
              -- optional: if your endpoint is authenticated
              -- api_key = "OpenAI_API_KEY",
              -- optional: default value, override if different
              chat_url = "/v1/chat/completions",
              -- optional: attaches to the end of the URL to form the endpoint to retrieve models
              models_endpoint = "/v1/models",
            },
            schema = {
              model = {
                default = function()
                  return "qwen2.5-7b-instruct-1m"
                end,
              },
            },
          })
        end,
        opts = {
          show_defaults = false,
          stream = true,
        },
      },
    },
  },
  {
    "saghen/blink.cmp",
    dependencies = {
      "olimorris/codecompanion.nvim",
    },
    opts = {
      sources = {
        per_filetype = {
          codecompanion = { "codecompanion" },
        },
      },
    },
  },
}

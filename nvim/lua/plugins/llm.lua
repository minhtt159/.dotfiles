return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "j-hui/fidget.nvim",
      -- Add mcphub.nvim as a dependency
      "ravitemer/mcphub.nvim",
    },
    init = function()
      require("plugins.llm_plugins.llm_fidget").init({})
    end,
    opts = {
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_vars = true,
            make_slash_commands = true,
          },
        },
      },
      strategies = {
        chat = {
          adapter = "custom",
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
      opts = {
        -- Set debug logging
        log_level = "DEBUG",
      },
      adapters = {
        custom = function()
          ---@class OpenAICompatible.Adapter: CodeCompanion.Adapter
          return require("codecompanion.adapters").extend("openai_compatible", {
            formatted_name = "My Custom",
            url = "<internal-ip>/v1/chat/completions",
            env = {
              url = "<internal-ip>",
              -- api_key = "OLLAMA_API_KEY",
            },
            schema = {
              model = {
                default = "qwen3-4b",
              },
            },
          })
        end,
        opts = {
          show_defaults = false,
        },
      },
    },
  },
}

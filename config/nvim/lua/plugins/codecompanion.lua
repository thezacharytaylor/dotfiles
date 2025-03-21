return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup {
      strategies = {
        chat = {
          adapter = "mistral",
        },
        inline = {
          adapter = "mistral",
          keymaps = {
            accept_change = {
              modes = { n = "ga" },
              description = "Accept the suggested change",
            },
            reject_change = {
              modes = { n = "gr" },
              description = "Reject the suggested change",
            },
          },
        },
      },
      opts = {
        stream = true,
      },
      adapters = {
        mistral = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            name = "codestral",
            env = {
              url = "https://codestral.mistral.ai",
              api_key = "CODESTRAL_API_KEY",
              chat_url = "/v1/chat/completions",
            },
            handlers = {
              form_parameters = function(self, params, messages)
                -- codestral doesn't support these in the body
                params.stream_options = nil
                params.options = nil
                return params
              end,
            },
            schema = {
              model = {
                default = "codestral-latest",
              },
              temperature = {
                default = 0.2,
                mapping = "parameters", -- not supported in default parameters.options
              },
            },
          })
        end,
      },
    }
  end,
}

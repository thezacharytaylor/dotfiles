return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup {
      strategies = {
        cmd = {
          adapter = "codestral",
        },
        chat = {
          adapter = "codestral",
        },
        inline = {
          adapter = "codestral",
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
        codestral = function()
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
        mistral = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "https://api.mistral.ai",
              api_key = "MISTRAL_API_KEY",
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
                default = "mistral-large-latest",
              },
              choices = {
                "mistral-large-latest",
                "mistral-medium-latest",
                "mistral-small-latest",
              },
            },
          })
        end,
      },
    }
  end,
}

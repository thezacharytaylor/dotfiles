-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "yetone/avante.nvim",
  build = "make",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  opts = {
    mappings = {
      submit = {
        normal = "<CR>",
        insert = "<CR>",
      },
    },
    provider = "mistral_code", -- "mistral"
    cursor_applying_provider = "mistral_code",
    behaviour = {
      --- ... existing behaviours
      enable_cursor_planning_mode = true, -- enable cursor planning mode!
    },
    auto_suggestions_provider = "mistral_code",
    vendors = {
      mistral_code = {
        api_key_name = "CODESTRAL_API_KEY",
        endpoint = "https://codestral.mistral.ai/v1/",
        model = "codestral-latest",
        __inherited_from = "openai",
        -- max_completion_tokens = 32768, -- remember to increase this value, otherwise it will stop generating halfway
        -- timeout = 30000, -- Timeout in milliseconds
        -- temperature = 0,
        temperature = 0.7,
        max_tokens = 8192,
        stream = true,
        safe_prompt = false,
      },
      mistral = {
        api_key_name = "MISTRAL_API_KEY",
        endpoint = "https://api.mistral.ai/v1/",
        model = "mistral-large-latest",
        __inherited_from = "openai",
        max_completion_tokens = 32768, -- remember to increase this value, otherwise it will stop generating halfway
      },
    },
  },
}

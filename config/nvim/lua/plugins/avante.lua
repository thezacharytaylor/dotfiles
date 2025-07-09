-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

local prefix = "<Leader>a"
return {
  "yetone/avante.nvim",
  build = "make",
  -- event = "VeryLazy",
  event = "User AstroFile", -- load on file open because Avante manages it's own bindings
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
    -- {
    --   -- Make sure to set this up properly if you have lazy=true
    --   "MeanderingProgrammer/render-markdown.nvim",
    --   opts = {
    --     file_types = { "markdown", "Avante" },
    --   },
    --   ft = { "markdown", "Avante" },
    -- },
    { "AstroNvim/astrocore", opts = function(_, opts) opts.mappings.n[prefix] = { desc = " Avante" } end },
  },
  opts = {
    mappings = {
      suggestion = {
        accept = "<C-l>",
        next = "<C-]>",
        prev = "<C-[>",
        dismiss = "<C-x>",
      },
      submit = {
        normal = "<CR>",
        insert = "<CR>",
      },
    },
    -- rag_service = {
    --   enabled = false, -- Enables the RAG service
    --   host_mount = os.getenv "HOME", -- Host mount path for the rag service
    --   provider = "mistral_lg", -- The provider to use for RAG service (e.g. openai or ollama)
    --   llm_model = "mistral-large-latest", -- The LLM model to use for RAG service
    --   embed_model = "codestral-embed-2505", -- The embedding model to use for RAG service
    --   endpoint = "https://api.mistral.ai/v1/", -- The API endpoint for RAG service
    -- },
    provider = "mistral_code", -- "mistral"
    web_search_engine = {
      provider = "searxng",
    },
    cursor_applying_provider = "mistral_code",
    behaviour = {
      --- ... existing behaviours
      enable_cursor_planning_mode = true, -- enable cursor planning mode!
    },
    auto_suggestions_provider = "mistral_code",
    providers = {
      mistral_code = {
        api_key_name = "MISTRAL_API_KEY", -- Using mistral key until I can generate a codestral key
        endpoint = "https://api.mistral.ai/v1/",
        model = "codestral-latest",
        __inherited_from = "openai",
        -- max_completion_tokens = 32768, -- remember to increase this value, otherwise it will stop generating halfway
        -- but the above doesn't work w/ Mistral models and breaks them
        -- timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          temperature = 0.7,
          max_tokens = 60000,
          stream = true,
          safe_prompt = false,
        },
      },
      mistral_dev = {
        api_key_name = "MISTRAL_API_KEY",
        endpoint = "https://api.mistral.ai/v1/",
        model = "devstral-small-latest", -- devstral-small-2505
        __inherited_from = "openai",
        extra_request_body = {
          temperature = 0.7,
          max_tokens = 60000, -- remember to increase this value, otherwise it will stop generating halfway
          stream = true,
          safe_prompt = false,
        },
      },
      mistral_chat = {
        api_key_name = "MISTRAL_API_KEY",
        endpoint = "https://api.mistral.ai/v1/",
        model = "mistral-medium-latest", -- devstral-small-2505
        __inherited_from = "openai",
        extra_request_body = {
          temperature = 0.7,
          max_tokens = 60000, -- remember to increase this value, otherwise it will stop generating halfway
          -- stream = true,
          -- safe_prompt = false,
        },
      },
      mistral_lg = {
        api_key_name = "MISTRAL_API_KEY",
        endpoint = "https://api.mistral.ai/v1/",
        model = "mistral-large-latest", -- devstral-small-2505
        __inherited_from = "openai",
        extra_request_body = {
          temperature = 0.7,
          max_tokens = 60000, -- remember to increase this value, otherwise it will stop generating halfway
          stream = true,
          safe_prompt = false,
        },
      },
      mistral = {
        api_key_name = "MISTRAL_API_KEY",
        endpoint = "https://api.mistral.ai/v1/",
        model = "codestral-latest", -- devstral-small-2505
        __inherited_from = "openai",
        extra_request_body = {
          temperature = 0.7,
          max_tokens = 60000, -- remember to increase this value, otherwise it will stop generating halfway
          stream = true,
          safe_prompt = false,
        },
      },
    },
  },
  specs = { -- configure optional plugins
    { "AstroNvim/astroui", opts = { icons = { Avante = "" } } },
    {
      -- make sure `Avante` is added as a filetype
      "MeanderingProgrammer/render-markdown.nvim",
      optional = true,
      opts = function(_, opts)
        if not opts.file_types then opts.file_types = { "markdown" } end
        opts.file_types = require("astrocore").list_insert_unique(opts.file_types, { "Avante" })
      end,
    },
    {
      -- make sure `Avante` is added as a filetype
      "OXY2DEV/markview.nvim",
      optional = true,
      opts = function(_, opts)
        if not opts.filetypes then opts.filetypes = { "markdown", "quarto", "rmd" } end
        opts.filetypes = require("astrocore").list_insert_unique(opts.filetypes, { "Avante" })
      end,
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      optional = true,
      opts = {
        filesystem = {
          commands = {
            avante_add_files = function(state)
              local node = state.tree:get_node()
              local filepath = node:get_id()
              local relative_path = require("avante.utils").relative_path(filepath)

              local sidebar = require("avante").get()

              local open = sidebar:is_open()
              -- ensure avante sidebar is open
              if not open then
                require("avante.api").ask()
                sidebar = require("avante").get()
              end

              sidebar.file_selector:add_selected_file(relative_path)

              -- remove neo tree buffer
              if not open then sidebar.file_selector:remove_selected_file "neo-tree filesystem [1]" end
            end,
          },
        },
        window = {
          mappings = {
            ["oa"] = "avante_add_files",
          },
        },
      },
    },
  },
}

-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
-- Other themes: "ray-x/starry.nvim", "sts10/vim-pink-moon", "oxfist/night-owl.nvim"

------------------------
-- Plugins
------------------------
lvim.plugins = {
  {
    "neanias/everforest-nvim",
    name = "everforest",
    version = false,
    lazy = false,
    priority = 1000,
    -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup({
        -- Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
        -- Default is "medium".
        -- background = "hard",
        -- How much of the background should be transparent. Options are 0, 1 or 2.
        -- Default is 0.
        --
        -- 2 will have more UI components be transparent (e.g. status line
        -- background).
        transparent_background_level = 2,
        -- Whether italics should be used for keywords, builtin types and more.
        italics = true,
      })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        styles = {
          italic = true,
        },
      })
    end,
  },
  {
    "sainnhe/gruvbox-material",
    name = "gruvbox-material",
  },
  { "theacodes/witchhazel", name = "witchhazel" },
  { "Everblush/nvim", name = "everblush" },
  { "katawful/kat.nvim", name = "kat" },
  {
    "baliestri/aura-theme",
    lazy = false,
    priority = 1000,
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
      -- vim.cmd([[colorscheme aura-dark]])
    end,
  },
  { "EdenEast/nightfox.nvim" },
  {
    "oxfist/night-owl.nvim",
    name = "night-owl",
  },
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup() -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
        require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
      end, 100)
    end,
  },
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  {
    "felipec/vim-sanegx",
    event = "BufRead",
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require("neoscroll").setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil, -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
      })
    end,
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit",
          "gitrebase",
          "svn",
          "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "mrjones2014/nvim-ts-rainbow",
  },
  -- {
  --   "romgrk/nvim-treesitter-context",
  --   config = function()
  --     require("treesitter-context").setup({
  --       enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  --       throttle = true, -- Throttles plugin updates (may improve performance)
  --       max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  --       patterns = {
  --         -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
  --         -- For all filetypes
  --         -- Note that setting an entry here replaces all other patterns for this entry.
  --         -- By setting the 'default' entry below, you can control which nodes you want to
  --         -- appear in the context window
  --         default = {
  --           "class",
  --           "function",
  --           "method",
  --         },
  --       },
  --     })
  --   end,
  -- },
  {
    "ahmedkhalf/lsp-rooter.nvim",
    event = "BufRead",
    config = function()
      require("lsp-rooter").setup()
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "kenn7/vim-arsync",
    depends = { "prabirshrestha/async.vim" },
  },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  {
    "fei6409/log-highlight.nvim",
    config = function()
      require("log-highlight").setup({})
    end,
  },
  {
    "chipsenkbeil/distant.nvim",
    branch = "v0.3",
    config = function()
      require("distant").setup()
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    ft = { "rust" },
  },
  {
    "mechatroner/rainbow_csv",
  },
  {
    "sontungexpt/witch",
    priority = 1000,
    lazy = false,
  },
  {
    "comfysage/evergarden",
    lazy = false,
    priority = 1000,
    config = function()
      require("evergarden").setup({
        transparent_background = true,
        contrast_dark = "medium", -- 'hard'|'medium'|'soft'
        overrides = {}, -- add custom overrides
      })
    end,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    -- Add in any other configuration;
    --   event = foo,
    --   config = bar
    --   end,
  },
  {
    url = "https://codeberg.org/jthvai/lavender.nvim",
    branch = "stable", -- versioned tags + docs updates from main
    lazy = false,
    priority = 1000,
  },
  {
    "maxmx03/fluoromachine.nvim",
    config = function()
      local fm = require("fluoromachine")

      fm.setup({
        glow = false,
        theme = "fluoromachine",
      })

      -- vim.cmd.colorscheme("fluoromachine")
    end,
  },
  {
    "Mofiqul/dracula.nvim",
    config = function()
      require("dracula").setup({
        italic_comment = true,
      })
    end,
  },
  { "Yazeed1s/oh-lucy.nvim" },
  -- { dir = vim.env.HOME .. "/Sync/Assets/dracula-pro/themes/vim", name = "dracula-pro" },
}

------------------------
-- Settings
------------------------
-- catppuccin-x, latte, frappe, macchiato, mocha
-- see everforest insert for soft/medium/hard, adheres to light/dark setting below
-- rose-pine, rose-pine-moon, rose-pine-dawn
lvim.colorscheme = "everforest"
vim.opt.background = "dark"
vim.opt.relativenumber = true
lvim.builtin.treesitter.rainbow.enable = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.breakindent = true -- maintain indent when wrapping indented lines
vim.opt.listchars = {
  tab = "▸ ",
  trail = "·",
}
vim.opt.fillchars = { eob = " " } -- remove the ~ from end of buffer
-- lvim.builtin.lualine.options.theme = "palenight"
-- vim.filetype.add({ filename = { [".postcss"] = "css" } })
vim.filetype.add({
  extension = {
    postcss = "css",
    toml = "sh",
  },
  filename = {
    [".eslintrc"] = "json",
    [".prettierrc"] = "json",
    [".babelrc"] = "json",
    [".stylelintrc"] = "json",
  },
  pattern = {
    [".*config/git/config"] = "gitconfig",
    [".env.*"] = "sh",
    ["*.ssh_config"] = "sshconfig",
  },
})

------------------------
-- Mappings
------------------------
lvim.keys.insert_mode["jk"] = "<ESC>"
lvim.keys.insert_mode["jj"] = "<ESC>"

------------------------
-- Treesitter
------------------------
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "css",
  "diff",
  "dockerfile",
  "gitattributes",
  "gitcommit",
  "gitignore",
  "html",
  "javascript",
  "jsdoc",
  "json",
  "jsonc",
  "lua",
  "markdown",
  "markdown_inline",
  "php",
  "rust",
  "scss",
  -- "tree-sitter-ssh-config",
  "toml",
  "typescript",
  "tsx",
  "vim",
  "vimdoc",
  "yaml",
}

lvim.lsp.installer.setup.ensure_installed = {
  "lua_ls",
  "html",
  "intelephense",
  "cssls",
  "tsserver",
  "tailwindcss",
  "rust_analyzer",
}

-- ------------------------
-- Formatting
-- ------------------------
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "phpcsfixer", args = { "--rules=@PSR12" }, filetypes = { "php" } },
  { command = "blade-formatter", filetypes = { "blade.php" } },
  { command = "stylua", filetypes = { "lua" } },
  {
    command = "prettierd",
    args = { "--single-quote=true" },
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "css",
      "scss",
      "postcss",
      "pcss",
      "less",
      "html",
      "json",
      "jsonc",
      "yaml",
      "markdown",
      "markdown.mdx",
      "graphql",
      "handlebars",
      "liquid",
    },
  },
})

lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = {
  "*.css",
  "*.scss",
  "*.pcss",
  "*.postcss",
  "*.html",
  "*.json",
  "*.js",
  "*.lua",
  -- "*.php",
}

------------------------
-- Linting
------------------------
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  { command = "phpcs", args = { "--rules=PSR12" }, filetypes = { "php" } },
  { command = "selene", filetypes = { "lua" } },
  { command = "eslint_d", filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" } },
})

------------------------
-- LSP
------------------------
local lsp_manager = require("lvim.lsp.manager")
lsp_manager.setup("intelephense")
-- lsp_manager.setup("rust_analyzer")

require("lvim.lsp.manager").setup("cssls", {
  settings = {
    css = { validate = true, lint = {
      unknownAtRules = "ignore",
    } },
    scss = { validate = true, lint = {
      unknownAtRules = "ignore",
    } },
    less = { validate = true, lint = {
      unknownAtRules = "ignore",
    } },
    pcss = { validate = true, lint = {
      unknownAtRules = "ignore",
    } },
    postcss = { validate = true, lint = {
      unknownAtRules = "ignore",
    } },
  },
})

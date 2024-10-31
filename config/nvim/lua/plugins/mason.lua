if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      -- add more things to the ensure_installed table protecting against community packs modifying it
      ensure_installed = {
        "bashls",
        "html",
        "jsonls",
        "lua_ls",
        "markdown_oxide",
        "phpactor",
        "theme_check",
        "stylelint_lsp",
        "tailwindcss",
        "ts_ls",
        "vuels",
        -- add more arguments for adding more language servers
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      -- add more things to the ensure_installed table protecting against community packs modifying it
      ensure_installed = {
        "blade-formatter",
        "editorconfig-checker",
        "htmlhint",
        "jsonlint",
        "markdownlint",
        "php-cs-fixer",
        "prettierd",
        "selene",
        "stylua",
        "ts-standard",
        "xmlformatter",
        "yamlfmt",
        -- add more arguments for adding more null-ls sources
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      -- add more things to the ensure_installed table protecting against community packs modifying it
      ensure_installed = {
        "php-debug-adapter",
        -- add more arguments for adding more debuggers
      },
    },
  },
}

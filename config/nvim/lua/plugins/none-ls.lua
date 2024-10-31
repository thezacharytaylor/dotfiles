-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  main = "null-ls",
  opts = function(_, opts)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- Set up diagnostics
      null_ls.builtins.diagnostics.editorconfig_checker,
      null_ls.builtins.diagnostics.markdownlint,
      null_ls.builtins.diagnostics.selene,
      -- Set a formatter
      null_ls.builtins.formatting.prettierd.with {
        filetypes = {
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "css",
          "postcss",
          "scss",
          "json",
          "html",
          "markdown",
          "vue",
        },
      },
      null_ls.builtins.formatting.phpcsfixer.with {
        filetypes = { "php" },
        disabled_filetypes = { "blade" },
      },
      null_ls.builtins.formatting.blade_formatter.with {
        filetypes = { "blade" },
        extra_args = {
          "--indentSize=2",
          "--noMultipleEmptyLines=true",
          "--sortHtmlAttributes=code-guide",
          "--wrapAttributes=force-expand-multiline",
        },
      },
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.markdownlint,
      null_ls.builtins.formatting.yamlfmt,
    })
  end,
}

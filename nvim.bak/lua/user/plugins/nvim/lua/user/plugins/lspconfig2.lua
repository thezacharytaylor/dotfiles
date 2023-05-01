local lspconfig = require('lspconfig')
local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename \${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=\${INPUT}",
  formatStdin = true
}
local prettier = {
  formatCommand = "prettierd \${INPUT}",
  formatStdin = true
}
local phpcbf = {
  formatCommand = "phpcbf \${INPUT}",
  formatStdin = true
}

lspconfig.efm.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = true
    client.resolved_capabilities.goto_definition = false
  end,
  root_dir = lspconfig.util.root_pattern(".git", "composer.json", "composer.lock", "package.json", "package-lock.json"),
  filetypes = {"javascript", "typescript", "php"},
  settings = {
    languages = {
      javascript = {eslint, prettier},
      typescript = {eslint, prettier},
      php = {phpcbf}
    }
  }
}

vim.api.nvim_set_keymap('n', '<leader>j', ':Format', '<cmd>lua vim.lsp.buf.formatting()<CR>', {silent = true})

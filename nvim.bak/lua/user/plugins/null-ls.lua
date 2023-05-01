require('null-ls').setup({
  sources = {
    require('null-ls').builtins.code_actions.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
    require('null-ls').builtins.code_actions.gitsigns,
    require('null-ls').builtins.code_actions.proselint,
    require('null-ls').builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
    require('null-ls').builtins.diagnostics.proselint,
    require('null-ls').builtins.diagnostics.gitlint,
    require('null-ls').builtins.diagnostics.luacheck.with({
      extra_args = { '--config', vim.fn.stdpath('config') .. '/.luacheckrc' },
    }),
    -- require("null-ls").builtins.diagnostics.phpstan,
    require('null-ls').builtins.diagnostics.solhint,
    require('null-ls').builtins.diagnostics.trail_space.with({ disabled_filetypes = { 'NvimTree' } }),
    require('null-ls').builtins.formatting.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
    require('null-ls').builtins.formatting.prettierd,
    require('null-ls').builtins.formatting.phpcsfixer,
    require('null-ls').builtins.formatting.jq,
    require('null-ls').builtins.formatting.rustywind,
    require('null-ls').builtins.formatting.stylua,
  },
})

-- require('mason-null-ls').setup({ automatic_installation = true })

-- -- vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { buffer = bufnr })
-- vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
-- vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
-- vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
-- vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
-- vim.keymap.set('n', 'gi', ':Telescope lsp_implementation<CR>')
-- -- vim.keymap.set(bufnr, 'n', '<C-K>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { buffer = bufnr })
-- vim.keymap.set('n', '<leader>D', '<cmd>lua vim.diagnostic.open_float()<CR>')
-- vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
-- -- vim.keymap.set(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { buffer = bufnr })
-- vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')

-- vim.api.nvim_create_user_command('Format', vim.lsp.buf.formatting, {})

-- -- Diagnostic configuration
-- vim.diagnostic.config({
--   -- underline = true,
--   virtual_text = false --{
--     -- prefix = '',
--     -- spacing = 2,
--   ,--},
--   float = {
--     source = 'always',
--   },
--   -- signs = {
--   --   severity_limit = 'Warning',
--   -- },
--   -- update_in_insert = false,
--   -- severity_sort = true,
-- })

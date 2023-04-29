require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })
local util = require('lspconfig.util')

-- vim.api.nvim_create_user_command('Format', vim.lsp.buf.formatting_seq_sync, {})

vim.keymap.set('n', '<leader>ca', ':CodeActionMenu<CR>')
vim.keymap.set('v', '<leader>ca', ':CodeActionMenu<CR>')
vim.keymap.set('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')

-- vim.lsp.set_log_level("debug")

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    source = true,
    focus = false,
    format = function(diagnostic)
      if diagnostic.user_data ~= nil and diagnostic.user_data.lsp.code ~= nil then
        return string.format('%s: %s', diagnostic.user_data.lsp.code, diagnostic.message)
      end
      return diagnostic.message
    end,
  },
})

local on_attach = function(_, bufnr)
  vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

  -- vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { buffer = bufnr })
  -- vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { buffer = bufnr })
  -- vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { buffer = bufnr })
  -- vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { buffer = bufnr })
  -- vim.keymap.set(bufnr, 'n', '<C-K>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { buffer = bufnr })
  -- vim.keymap.set('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { buffer = bufnr })
  -- vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { buffer = bufnr })
  -- vim.keymap.set(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { buffer = bufnr })
  -- vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>', { buffer = bufnr })

  -- vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { buffer = bufnr })
  -- vim.keymap.set('v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', { buffer = bufnr })
  -- vim.keymap.set('n', '<leader>ca', ':Telescope lsp_code_actions<CR>', { buffer = bufnr })
  -- vim.keymap.set('v', '<leader>ca', ':Telescope lsp_range_code_actions<CR>', { buffer = bufnr })
  -- vim.keymap.set('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', { buffer = bufnr })
  -- vim.keymap.set('n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], { buffer = bufnr })
end

-- nvim-cmp supports additional completion capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local function get_typescript_server_path(root_dir)
  local project_root = util.find_node_modules_ancestor(root_dir)

  local local_tsserverlib = project_root ~= nil and
      util.path.join(project_root, 'node_modules', 'typescript', 'lib', 'tsserverlibrary.js')
  local global_tsserverlib =
  '/Users/zacharytaylor/.nvm/versions/node/v18.15.0/lib/node_modules/typescript/lib/tsserverlibrary.js'

  if local_tsserverlib and util.path.exists(local_tsserverlib) then
    return local_tsserverlib
  else
    return global_tsserverlib
  end
end

require('lspconfig').bashls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- require('lspconfig').dockerls.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })

require('lspconfig').emmet_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require('lspconfig').html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require('lspconfig').intelephense.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
  capabilities = capabilities,
})

-- require'lspconfig'.phpactor.setup{
--   cmd = { '/home/jess/.local/share/nvim/site/pack/packer/opt/phpactor/bin/phpactor', 'language-server' },
--   on_attach = on_attach,
--   capabilities = capabilities,
--   init_options = {
--     ["language_server_phpstan.enabled"] = false,
--     ["language_server_psalm.enabled"] = false,
--   }
-- }

require('lspconfig').jsonls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
})

require('lspconfig').solang.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'solang', '--language-server', '--target', 'ewasm', '--importpath', 'node_modules' },
})

require('lspconfig').sqlls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- local runtime_path = vim.split(package.path, ';')
-- table.insert(runtime_path, 'lua/?.lua')
-- table.insert(runtime_path, 'lua/?/init.lua')
require('lspconfig').lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  -- cmd = { '/opt/lua-language-server/bin/lua-language-server', '-E', '/opt/lua-language-server/bin/main.lua' },
  -- cmd = { '/opt/lua-language-server/bin/lua-language-server' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        -- path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        -- ['undefined-global'] = false,
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      telemetry = { enable = false },
    },
  },
})

require('lspconfig').tailwindcss.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- require('lspconfig').volar.setup({
--   on_attach = function(client, bufnr)
--     on_attach(client, bufnr)
--     client.server_capabilities.documentFormattingProvider = false
--     client.server_capabilities.documentRangeFormattingProvider = false
--   end,
--   on_new_config = function(new_config, new_root_dir)
--     new_config.init_options.typescript.serverPath = get_typescript_server_path(new_root_dir)
--   end,
--   capabilities = capabilities,
--   -- Enable "Take Over Mode" where volar will provide all TS LSP services
--   -- This drastically improves the responsiveness of diagnostic updates on change
--   filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
-- })

vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

-- suppress error messages from lang servers
-- vim.notify = function(msg, log_level, _)
--   if msg:match 'exit code' then
--     return
--   end
--   if log_level == vim.log.levels.ERROR then
--     vim.api.nvim_err_writeln(msg)
--   else
--     vim.api.nvim_echo({ { msg } }, true, {})
--   end
-- end- end

-- require('user.plugins.null-ls')

require('null-ls').setup({
     -- debug = true,
  sources = {
    -- Use phpcsfixer for PHP files
    -- {
    --   method = require('null-ls').methods.FORMATTING,
    --   filetypes = { 'php' },
    --   generator = function()
    --     return {
    --       command = 'phpcbf',
    --       args = { '-q', '-s', '-' },
    --       to_stdin = true,
    --     }
    --   end
    -- },
    -- -- Use prettierd for JavaScript and TypeScript files
    -- {
    --   method = require('null-ls').methods.FORMATTING,
    --   filetypes = { 'javascript', 'typescript' },
    --   generator = function()
    --     return {
    --       command = 'prettierd',
    --       args = { '--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
    --       to_stdin = true,
    --     }
    --   end
    -- },
    require('null-ls').builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
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
    on_attach = function(client, bufnr)
    if client.resolved_capabilities.document_formatting then
      local function format()
        vim.lsp.buf.format({
          bufnr = bufnr,
          async = true,
        })
      end

      vim.keymap.set('n', '<Leader>f', format, { buffer = bufnr, desc = '[lsp] format' })
    end
  end,
  },
})

require('mason-null-ls').setup({ automatic_installation = true })

-- vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { buffer = bufnr })
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', 'gi', ':Telescope lsp_implementation<CR>')
-- vim.keymap.set(bufnr, 'n', '<C-K>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { buffer = bufnr })
vim.keymap.set('n', '<leader>D', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
-- vim.keymap.set(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { buffer = bufnr })
vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')

-- Create a command `:Format` local to the LSP buffer
-- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
--   vim.lsp.buf.format()
-- end, { desc = 'Format current buffer with LSP' })


-- vim.api.nvim_buf_create_user_command('Format', function(_)
--   vim.lsp.buf.format()
-- end, { desc = 'Format current buffer with LSP' })

-- vim.api.nvim_create_user_command('Format', 'vim.lsp.buf.formatting()', {})
-- vim.api.nvim_command('command! Format lua require("null-ls").code_action({source="formatting"})')
  -- vim.api.nvim_command('autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)')
-- vim.api.nvim_create_user_command("Format", function()
--   local bufnr = vim.api.nvim_get_current_buf()
--   local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
--   local formatted_lines = require("lua-formatter").format(lines)
--   vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, formatted_lines)
-- end, {nargs = 0})

local format_is_enabled = true
vim.api.nvim_create_user_command('KickstartFormatToggle', function()
  format_is_enabled = not format_is_enabled
  print('Setting autoformatting to: ' .. tostring(format_is_enabled))
end, {})

-- Create an augroup that is used for managing our formatting autocmds.
--      We need one augroup per client to make sure that multiple clients
--      can attach to the same buffer without interfering with each other.
--local _augroups = {}
--local get_augroup = function(client)
--  if not _augroups[client.id] then
--    local group_name = 'kickstart-lsp-format-' .. client.name
--    local id = vim.api.nvim_create_augroup(group_name, { clear = true })
--    _augroups[client.id] = id
--  end

--  return _augroups[client.id]
--end

---- Whenever an LSP attaches to a buffer, we will run this function.
----
---- See `:help LspAttach` for more information about this autocmd event.
--vim.api.nvim_create_autocmd('LspAttach', {
--  group = vim.api.nvim_create_augroup('kickstart-lsp-attach-format', { clear = true }),
--  -- This is where we attach the autoformatting for reasonable clients
--  callback = function(args)
--    local client_id = args.data.client_id
--    local client = vim.lsp.get_client_by_id(client_id)
--    local bufnr = args.buf

--    -- Only attach to clients that support document formatting
--    if not client.server_capabilities.documentFormattingProvider then
--      return
--    end

--    -- Tsserver usually works poorly. Sorry you work with bad languages
--    -- You can remove this line if you know what you're doing :)
--    if client.name == 'tsserver' then
--      return
--    end

--    -- Create an autocmd that will run *before* we save the buffer.
--    --  Run the formatting command for the LSP that has just attached.
--    vim.api.nvim_create_autocmd('BufWritePre', {
--      group = get_augroup(client),
--      buffer = bufnr,
--      callback = function()
--        if not format_is_enabled then
--          return
--        end

--        vim.lsp.buf.format {
--          async = false,
--          filter = function(c)
--            return c.id == client.id
--          end,
--        }
--      end,
--    })
--  end,
--})

-- Diagnostic configuration
vim.diagnostic.config({
  -- underline = true,
  virtual_text = false --{
  -- prefix = '',
  -- spacing = 2,
  , --},
  float = {
    source = 'always',
  },
  -- signs = {
  --   severity_limit = 'Warning',
  -- },
  -- update_in_insert = false,
  -- severity_sort = true,
})

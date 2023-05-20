return {{
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-nvim-lsp-signature-help', 'hrsh7th/cmp-buffer',
                    'hrsh7th/cmp-path', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip', 'onsails/lspkind-nvim'},
    config = function()
        -- Set completeopt to have a better completion experience
        vim.o.completeopt = 'menuone,longest,preview'
        local has_words_before = function()
            local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
        end
        -- local luasnip = require('luasnip')
        -- local cmp = require('cmp')
        -- local lspkind = require('lspkind')

        require('cmp').setup({
            experimental = {
                ghost_text = false
            },
            formatting = {
                format = require('lspkind').cmp_format({
                    with_text = true,
                    menu = {
                        nvim_lsp = '[LSP]',
                        nvim_lua = '[Lua]',
                        buffer = '[BUF]'
                    }
                })
            },
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end
            },
            mapping = {
                ['<C-p>'] = require('cmp').mapping.select_prev_item(),
                ['<C-n>'] = require('cmp').mapping.select_next_item(),
                ['<C-d>'] = require('cmp').mapping.scroll_docs(-4),
                ['<C-f>'] = require('cmp').mapping.scroll_docs(4),
                ['<C-Space>'] = require('cmp').mapping.complete(),
                ['<C-e>'] = require('cmp').mapping.close(),
                -- ['<CR>'] = require('cmp').mapping.confirm {
                --   behavior = require('cmp').ConfirmBehavior.Replace,
                --   select = false,
                -- },
                ['<CR>'] = require('cmp').mapping(function(fallback)
                    if not require('cmp').confirm(option) then
                        fallback()
                    end
                    -- .confirm {
                    -- behavior = require('cmp').ConfirmBehavior.Replace,
                    -- select = false,
                end, {'i', 's'}),
                ['<M-Tab>'] = require('cmp').mapping(function(fallback)
                    if require('luasnip').jumpable(1) then
                        require('luasnip').jump(1)
                    elseif require('cmp').visible() then
                        require('cmp').select_next_item()
                    elseif has_words_before() then
                        require('cmp').complete()
                    else
                        fallback()
                    end

                    -- if require('cmp').visible() then
                    --   require('cmp').select_next_item()
                    -- elseif require('luasnip')expand_or_jumpable() then
                    --   require('luasnip')expand_or_jump()
                    -- elseif has_words_before() then
                    --   require('cmp').complete()
                    -- else
                    --   fallback()
                    -- end
                end, {'i', 's'}),
                ['<S-Tab>'] = require('cmp').mapping(function(fallback)
                    if require('luasnip').jumpable(-1) then
                        require('luasnip').jump(-1)
                    elseif require('cmp').visible() then
                        require('cmp').select_prev_item()
                    else
                        fallback()
                    end

                    -- if require('cmp').visible() then
                    --   require('cmp').select_prev_item()
                    -- elseif require('luasnip')jumpable(-1) then
                    --   require('luasnip')jump(-1)
                    -- else
                    --   fallback()
                    -- end
                end, {'i', 's'})
            },
            sources = {{
                name = 'nvim_lsp'
            }, {
                name = 'nvim_lsp_signature_help'
            }, {
                name = 'nvim_lua'
            }, {
                name = 'luasnip'
            }, {
                name = 'path'
            }, {
                name = 'buffer'
            } -- { name = 'fuzzy_path' },
            }
        })
    end
}}

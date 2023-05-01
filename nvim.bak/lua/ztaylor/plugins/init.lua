-- local keymaps = require('pynappo.keymaps')
return {{
    -- 'ellisonleao/gruvbox.nvim',
    'eddyekofo94/gruvbox-flat.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        -- Hide the characters in FloatBorder
        vim.api.nvim_set_hl(0, 'FloatBorder', {
            fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
            bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background
        })

        -- Make the StatusLineNonText background the same as StatusLine
        vim.api.nvim_set_hl(0, 'StatusLineNonText', {
            fg = vim.api.nvim_get_hl_by_name('NonText', true).background,
            bg = vim.api.nvim_get_hl_by_name('StatusLine', true).foreground
        })

        -- Hide the characters in CursorLineBg
        vim.api.nvim_set_hl(0, 'CursorLineBg', {
            fg = vim.api.nvim_get_hl_by_name('CursorLine', true).foreground,
            bg = vim.api.nvim_get_hl_by_name('CursorLine', true).foreground
        })

        -- if vim.g.vscode then
        -- else
        vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', {
            fg = '#30323E'
        })
        -- vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#2F313C' })
        -- end
        vim.cmd([[colorscheme gruvbox-flat]])
    end
}, {
    'airblade/vim-rooter',
    init = function()
        vim.g.rooter_manual_only = 1
    end,
    config = function()
        vim.cmd('Rooter')
    end
}, {'farmergreg/vim-lastplace'}, {'christoomey/vim-tmux-navigator'}, {'tpope/vim-commentary'}, {'tpope/vim-repeat'},
        {'tpope/vim-surround'}, {'tpope/vim-eunuch'}, -- Adds :Rename, :SudoWrite
{'tpope/vim-unimpaired'}, -- Adds [b and other handy mappings
{'tpope/vim-sleuth'}, -- Indent autodetection with editorconfig support
{'jessarcher/vim-heritage'}, -- Automatically create parent dirs when saving
{'nelstrom/vim-visual-star-search'}, {'github/copilot.vim'}, -- {'sheerun/vim-polyglot'}, -- {
--   'tpope/vim-projectionist',
--   requires = 'tpope/vim-dispatch',
--   config = function()
--     require('ztaylor.plugins.projectionist')
--   end,
-- },
{
    'tommcdo/vim-lion',
    config = function()
        vim.g.lion_squeeze_spaces = 1
    end
}, {
    'whatyouhide/vim-textobj-xmlattr',
    dependencies = 'kana/vim-textobj-user'
}, {
    'sickill/vim-pasta',
    config = function()
        vim.g.pasta_disabled_filetypes = {'fugitive'}
    end
}, {
    'famiu/bufdelete.nvim',
    config = function()
        vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
    end
}, -- {
--     'lukas-reineke/indent-blankline.nvim',
--     config = function()
--         require('ztaylor.plugins.indent-blankline')
--     end
-- },
{
    'AndrewRadev/splitjoin.vim',
    config = function()
        vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
        vim.g.splitjoin_trailing_comma = 1
        vim.g.splitjoin_php_method_chain_full = 1
    end
}, {
    'windwp/nvim-autopairs',
    config = function()
        require('nvim-autopairs').setup()
    end
}, -- {
--     'kyazdani42/nvim-tree.lua',
--     dependencies = {{'nvim-tree/nvim-web-devicons'}},
--     config = function()
--         require('ztaylor.plugins.nvim-tree')
--         vim.cmd([[
--       highlight NvimTreeIndentMarker guifg=#30323E
--       augroup NvimTreeHighlights
--         autocmd ColorScheme * highlight NvimTreeIndentMarker guifg=#30323E
--       augroup end
--     ]])
--         vim.keymap.set('n', '<leader>n', ':NvimTreeFindFileToggle<CR>')
--     end
-- },
{
    'karb94/neoscroll.nvim',
    config = function()
        require('neoscroll').setup()
        require('ztaylor.plugins.neoscroll')
    end
}, -- {
--   'vim-test/vim-test',
--   config = function()
--     require('ztaylor.vim-test')
--   end,
-- },
{
    'voldikss/vim-floaterm',
    config = function()
        vim.keymap.set('n', '<F1>', ':FloatermToggle scratch<CR>')
        vim.keymap.set('t', '<F1>', '<C-\\><C-n>:FloatermToggle scratch<CR>')

        vim.g.floaterm_gitcommit = 'floaterm'
        vim.g.floaterm_autoinsert = 1
        vim.g.floaterm_width = 0.8
        vim.g.floaterm_height = 0.8
        vim.g.floaterm_wintitle = 0

        vim.cmd([[
      highlight link Floaterm CursorLine
      " highlight link FloatermBorder CursorLineBg
    ]])
    end
}, -- {
--     'nvim-treesitter/nvim-treesitter',
--     build = ':TSUpdate',
--     dependencies = {'nvim-treesitter/playground', 'nvim-treesitter/nvim-treesitter-textobjects',
--                     'JoosepAlviste/nvim-ts-context-commentstring'},
--     config = function()
--         require('ztaylor.plugins.treesitter')
--     end
-- },
{
    'tpope/vim-fugitive',
    dependencies = 'tpope/vim-rhubarb',
    cmd = 'G'
}, -- {
--     'lewis6991/gitsigns.nvim',
--     dependencies = 'nvim-lua/plenary.nvim',
--     config = function()
--         require('gitsigns').setup({
--             sign_priority = 20,
--             on_attach = function(bufnr)
--                 vim.keymap.set('n', ']h', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {
--                     expr = true,
--                     buffer = bufnr
--                 })
--                 vim.keymap.set('n', '[h', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {
--                     expr = true,
--                     buffer = bufnr
--                 })
--             end
--         })
--     end
-- },
{
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu'
}, {
    'luukvbaal/stabilize.nvim',
    config = function()
        require('stabilize').setup()
    end
}, {
    'danymat/neogen',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
        require('neogen').setup({})
    end
}, {
    'j-hui/fidget.nvim',
    config = function()
        require('fidget').setup {
            align = {
                bottom = false
            }
        }
    end
}, {
    'hood/popui.nvim',
    dependencies = 'RishabhRD/popfix',
    config = function()
        vim.ui.select = require('popui.ui-overrider')
        vim.ui.input = require('popui.input-overrider')
    end
}, {
    'antoinemadec/FixCursorHold.nvim',
    config = function()
        vim.g.cursorhold_updatetime = 100
    end
}}

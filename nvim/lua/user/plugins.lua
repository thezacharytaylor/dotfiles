-- Install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Initialize packer
require('packer').init({
  compile_path = vim.fn.stdpath('data') .. '/site/plugin/packer_compiled.lua',
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'solid' })
    end,
  },
})

-- Install plugins
local use = require('packer').use

use('wbthomason/packer.nvim') -- Let packer manage itself

use({
  'airblade/vim-rooter',
  setup = function()
    vim.g.rooter_manual_only = 1
  end,
  config = function()
    vim.cmd('Rooter')
  end,
})

use('farmergreg/vim-lastplace')

if vim.g.vscode then
else
use('christoomey/vim-tmux-navigator')
use('tpope/vim-commentary')
use('tpope/vim-repeat')
use('tpope/vim-surround')
use('tpope/vim-eunuch')        -- Adds :Rename, :SudoWrite
use('tpope/vim-unimpaired')    -- Adds [b and other handy mappings
use('tpope/vim-sleuth')        -- Indent autodetection with editorconfig support
use('jessarcher/vim-heritage') -- Automatically create parent dirs when saving
use('nelstrom/vim-visual-star-search')

use({
  'tpope/vim-projectionist',
  requires = 'tpope/vim-dispatch',
  config = function()
    require('user.plugins.projectionist')
  end,
})

use({
  'tommcdo/vim-lion',
  config = function()
    require('user.plugins.lion')
  end,
})

use({
  'whatyouhide/vim-textobj-xmlattr',
  requires = 'kana/vim-textobj-user',
})

use({
  'sickill/vim-pasta',
  config = function()
    require('user.plugins.pasta')
  end,
})

use({
  'famiu/bufdelete.nvim',
  config = function()
    vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
  end,
})

use({
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require('user.plugins.indent-blankline')
  end,
})
end

use({
  'AndrewRadev/splitjoin.vim',
  config = function()
    require('user.plugins.splitjoin')
  end,
})

if vim.g.vscode then
else
use({
  'windwp/nvim-autopairs',
  config = function()
    require('nvim-autopairs').setup()
  end,
})

use({
  'akinsho/bufferline.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  after = 'gruvbox.nvim',
  config = function()
    require('user.plugins.bufferline')
  end,
})

use({
  'nvim-lualine/lualine.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('user.plugins.lualine')
  end,
})

use({
  'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('user.plugins.nvim-tree')
  end,
})
end

use({
  'karb94/neoscroll.nvim',
  config = function()
    require('user.plugins.neoscroll')
  end,
})

if vim.g.vscode then
else
use({
  'vim-test/vim-test',
  config = function()
    require('user.plugins.vim-test')
  end,
})

use({
  'voldikss/vim-floaterm',
  config = function()
    require('user.plugins.floaterm')
  end,
})

use({
  'nvim-telescope/telescope.nvim',
  requires = {
    { 'nvim-lua/plenary.nvim' },
    { 'kyazdani42/nvim-web-devicons' },
    { 'nvim-telescope/telescope-fzf-native.nvim',    run = 'make' },
    { 'nvim-telescope/telescope-live-grep-args.nvim' },
  },
  config = function()
    require('user.plugins.telescope')
  end,
})

use({
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  requires = {
    'nvim-treesitter/playground',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  config = function()
    require('user.plugins.treesitter')
  end,
})

-- Cool git stuff
use({
  'tpope/vim-fugitive',
  requires = 'tpope/vim-rhubarb',
  cmd = 'G',
})

use({
  'lewis6991/gitsigns.nvim',
  requires = 'nvim-lua/plenary.nvim',
  config = function()
    require('gitsigns').setup({
      sign_priority = 20,
      on_attach = function(bufnr)
        vim.keymap.set('n', ']h', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true, buffer = bufnr })
        vim.keymap.set('n', '[h', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true, buffer = bufnr })
      end,
    })
  end,
})

use({
  'neovim/nvim-lspconfig',
  requires = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'b0o/schemastore.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'jay-babu/mason-null-ls.nvim',
  },
  config = function()
    require('user.plugins.lspconfig')
  end,
})

use({
  'weilbith/nvim-code-action-menu',
  cmd = 'CodeActionMenu',
})
end

-- use({
--   'jose-elias-alvarez/null-ls.nvim',
--   config = function()
--     require('user.plugins.null-ls')
--   end,
-- })

use {
  'j-hui/fidget.nvim',
  config = function()
    require('fidget').setup {
      align = {
        bottom = false
      }
    }
  end,
}

use({
  'L3MON4D3/LuaSnip',
  config = function()
    require('user.plugins.luasnip')
  end,
})

if vim.g.vscode then
else
use({
  'hrsh7th/nvim-cmp',
  requires = {
    -- 'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-buffer',
    -- 'hrsh7th/cmp-nvim-lua',
    -- 'jessarcher/cmp-path',
    'hrsh7th/cmp-path',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind-nvim',
  },
  config = function()
    require('user/plugins/cmp')
  end,
})
end

if vim.g.vscode then
else
use({
  'phpactor/phpactor',
  branch = 'master',
  ft = 'php',
  run = 'composer install --no-dev -o',
  config = function()
    require('user.plugins.phpactor')
  end,
})
end

-- Experimental
if vim.g.vscode then
else
use({
  'luukvbaal/stabilize.nvim',
  config = function()
    require('stabilize').setup()
  end,
})

use({
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('user.plugins.dashboard')
  end,
  requires = { 'nvim-tree/nvim-web-devicons' }
})

use({
  'danymat/neogen',
  config = function()
    require('neogen').setup({})
  end,
  requires = 'nvim-treesitter/nvim-treesitter',
})

use({
  'sheerun/vim-polyglot',
})

-- Rename in a popup window
use({
  'hood/popui.nvim',
  requires = 'RishabhRD/popfix',
  config = function()
    vim.ui.select = require('popui.ui-overrider')
    vim.ui.input = require('popui.input-overrider')
  end,
})

use({
  'folke/trouble.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('trouble').setup()
  end,
})

use({
  'antoinemadec/FixCursorHold.nvim',
  config = function()
    vim.g.cursorhold_updatetime = 100
  end,
})
end

-- Copilot
use('github/copilot.vim')

-- Themes
-- use('sainnhe/gruvbox-material')
use({
  'ellisonleao/gruvbox.nvim',
  config = function()
    -- Hide the characters in FloatBorder
    vim.api.nvim_set_hl(0, 'FloatBorder', {
      fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
      bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
    })

    -- Make the StatusLineNonText background the same as StatusLine
    vim.api.nvim_set_hl(0, 'StatusLineNonText', {
      fg = vim.api.nvim_get_hl_by_name('NonText', true).background,
      bg = vim.api.nvim_get_hl_by_name('StatusLine', true).foreground,
    })

    -- Hide the characters in CursorLineBg
    vim.api.nvim_set_hl(0, 'CursorLineBg', {
      fg = vim.api.nvim_get_hl_by_name('CursorLine', true).foreground,
      bg = vim.api.nvim_get_hl_by_name('CursorLine', true).foreground,
    })

   if vim.g.vscode then
   else
    vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = '#30323E' })
    -- vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#2F313C' })
   end
  end,
})
-- use({
--   'jessarcher/onedark.nvim',
--   config = function()
--     vim.cmd('colorscheme onedark')

--     -- Hide the characters in FloatBorder
--     vim.api.nvim_set_hl(0, 'FloatBorder', {
--       fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
--       bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
--     })

--     -- Make the StatusLineNonText background the same as StatusLine
--     vim.api.nvim_set_hl(0, 'StatusLineNonText', {
--       fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
--       bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
--     })

--     -- Hide the characters in CursorLineBg
--     vim.api.nvim_set_hl(0, 'CursorLineBg', {
--       fg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
--       bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
--     })

--     vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = '#30323E' })
--     vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#2F313C' })
--   end,
-- })

-- use({
--   'sainnhe/gruvbox-material',
--   config = function()
--     vim.cmd('colorscheme onedark')

--     -- Hide the characters in FloatBorder
--     vim.api.nvim_set_hl(0, 'FloatBorder', {
--       fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
--       bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
--     })

--     -- Make the StatusLineNonText background the same as StatusLine
--     vim.api.nvim_set_hl(0, 'StatusLineNonText', {
--       fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
--       bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
--     })

--     -- Hide the characters in CursorLineBg
--     vim.api.nvim_set_hl(0, 'CursorLineBg', {
--       fg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
--       bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
--     })

--     --vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = '#30323E' })
--     --vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#2F313C' })
--   end,
-- })

-- Automatically install plugins on first run
if packer_bootstrap then
  require('packer').sync()
end

-- Automatically regenerate compiled loader file on save
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])

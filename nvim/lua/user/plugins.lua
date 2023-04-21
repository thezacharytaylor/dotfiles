-- Install packer
local ensure_packer = function ()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Initialize packer
require('packer').init({
  compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
  -- display = {
  --   open_fn = function()
  --     return require('packer.util').float({ border = 'solid' })
  --   end,
  -- },
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
use('christoomey/vim-tmux-navigator')
use('farmergreg/vim-lastplace')
use('tpope/vim-commentary')
use('tpope/vim-repeat')
use('tpope/vim-surround')
use('tpope/vim-eunuch') -- Adds :Rename, :SudoWrite
use('tpope/vim-unimpaired') -- Adds [b and other handy mappings
use('tpope/vim-sleuth') -- Indent autodetection with editorconfig support
use('jessarcher/vim-heritage') -- Automatically create parent dirs when saving
use('nelstrom/vim-visual-star-search')

-- use({
--   'tpope/vim-projectionist',
--   requires = 'tpope/vim-dispatch',
--   config = function()
--     require('user.plugins.projectionist')
--   end,
-- })

-- use({
--   'tommcdo/vim-lion',
--   config = function()
--     require('user.plugins.lion')
--   end,
-- })

use({
  'whatyouhide/vim-textobj-xmlattr',
  requires = 'kana/vim-textobj-user',
})

-- use({
--   'sickill/vim-pasta',
--   config = function()
--     require('user.plugins.pasta')
--   end,
-- })

use({
  'famiu/bufdelete.nvim',
  config = function()
    vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
  end,
})

-- use({
--   'lukas-reineke/indent-blankline.nvim',
--   config = function()
--     require('user.plugins.indent-blankline')
--   end,
-- })

-- use({
--   'AndrewRadev/splitjoin.vim',
--   config = function()
--     require('user.plugins.splitjoin')
--   end,
-- })

use({
  'windwp/nvim-autopairs',
  config = function()
    require('nvim-autopairs').setup()
  end,
})

-- use({
--   'akinsho/bufferline.nvim',
--   requires = 'kyazdani42/nvim-web-devicons',
--   after = 'gruvbox.nvim',
--   config = function()
--     require('user.plugins.bufferline')
--   end,
-- })

-- use({
--   'nvim-lualine/lualine.nvim',
--   requires = 'kyazdani42/nvim-web-devicons',
--   config = function()
--     require('user.plugins.lualine')
--   end,
-- })

-- use({
--   'kyazdani42/nvim-tree.lua',
--   requires = 'kyazdani42/nvim-web-devicons',
--   config = function()
--     require('user.plugins.nvim-tree')
--   end,
-- })

-- use({
--   'karb94/neoscroll.nvim',
--   config = function()
--     require('user.plugins.neoscroll')
--   end,
-- })

-- Copilot
use('github/copilot.vim')

-- Themes
use('sainnhe/gruvbox-material')
use {'ellisonleao/gruvbox.nvim'}
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

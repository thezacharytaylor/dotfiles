-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.title = true
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.breakindent = true -- maintain indent when wrapping indented lines
vim.opt.listchars = {
  tab = "▸ ",
  trail = "·",
}
vim.opt.fillchars:append({
  eob = " ",
}) -- remove the ~ from end of buffer
vim.opt.mouse = "a" -- enable mouse for all modes
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 12
vim.opt.sidescrolloff = 12
vim.opt.clipboard = "unnamedplus" -- Use Linux system clipboard
vim.opt.confirm = true -- ask for confirmation instead of erroring
vim.opt.undofile = true -- persistent undo
vim.opt.backup = true -- automatically save a backup file
vim.opt.backupdir:remove(".") -- keep backups out of the current directory
vim.opt.shortmess:append({
  I = true,
}) -- disable the splash screen
vim.opt.wildmode = "longest:full,full" -- complete the longest common match, and allow tabbing the results to fully complete them
vim.opt.showmode = false
vim.opt.updatetime = 4001 -- Set updatime to 1ms longer than the default to prevent polyglot from changing it
vim.opt.redrawtime = 10000 -- Allow more time for loading syntax on large files
vim.g.gruvbox_flat_style = "dark" -- Go harder on the theme, helpful for lighter environments

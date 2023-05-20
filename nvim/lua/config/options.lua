-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.title = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.breakindent = true -- maintain indent when wrapping indented lines
vim.opt.listchars = {
    tab = "▸ ",
    trail = "·"
}
vim.opt.fillchars:append({
    eob = " "
}) -- remove the ~ from end of buffer
vim.opt.mouse = "a" -- enable mouse for all modes
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.clipboard = "unnamedplus" -- Use Linux system clipboard
vim.opt.confirm = true -- ask for confirmation instead of erroring
vim.opt.undofile = true -- persistent undo
vim.opt.backup = true -- automatically save a backup file
vim.opt.backupdir:remove(".") -- keep backups out of the current directory
vim.opt.shortmess:append({
    I = true
}) -- disable the splash screen
vim.opt.wildmode = "longest:full,full" -- complete the longest common match, and allow tabbing the results to fully complete them
vim.opt.showmode = false
vim.opt.updatetime = 4001 -- Set updatime to 1ms longer than the default to prevent polyglot from changing it
vim.opt.redrawtime = 10000 -- Allow more time for loading syntax on large files

if not vim.g.vscode then
    vim.opt.number = true
    vim.g.gruvbox_flat_style = "dark" -- Go harder on the theme, helpful for lighter environments
    vim.g.gruvbox_material_background = "hard" -- hard, medium, soft
    vim.g.gruvbox_material_better_performance = 1
    vim.g.gruvbox_material_foreground = "material" -- material, mix, original
    vim.g.everforest_background = "hard"
    vim.g.everforest_better_performance = 1
    vim.g.edge_style = "aura" -- aura, neon, default
    -- vin.g.edge_dim_foreground = 1 -- 0 is default use with Arua style
    vim.g.edge_better_performance = 1
    vim.g.sonokai_style = "shusia" -- andromeda, atlantis, shusia, maia, espresso, default
    vim.g.sonokai_better_performance = 1
    vim.opt.scrolloff = 12
    vim.opt.sidescrolloff = 12
    vim.opt.termguicolors = true
end

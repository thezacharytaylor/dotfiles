-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  require("config.lazy")
end

if not vim.g.vscode then
  vim.opt.relativenumber = true
end

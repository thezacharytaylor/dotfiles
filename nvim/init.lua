-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  require("config.lazy")
end

if not vim.g.vscode then
  vim.opt.relativenumber = true
  vim.opt.wrap = true
  vim.opt.breakindent = true -- maintain indent when wrapping indented lines
  vim.opt.listchars = {
    tab = "▸ ",
    trail = "·",
  }
  vim.opt.fillchars = { eob = " " } -- remove the ~ from end of buffer
end

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
--
-- Set some options
vim.opt.spell = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.breakindent = true -- maintain indent when wrapping indented lines
vim.opt.linebreak = true -- wrap at word boundaries
vim.opt.list = true -- enable the below listchars
vim.opt.listchars = { tab = "▸ ", trail = "·", nbsp = "␣" }
vim.opt.fillchars:append { eob = " " } -- remove the ~ from end of buffer
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    postcss = "css",
    toml = "sh",
  },
  filename = {
    [".eslintrc"] = "json",
    [".prettierrc"] = "json",
    [".babelrc"] = "json",
    [".stylelintrc"] = "json",
  },
  pattern = {
    [".*config/git/config"] = "gitconfig",
    [".env.*"] = "sh",
    ["*.ssh_config"] = "sshconfig",
  },
}

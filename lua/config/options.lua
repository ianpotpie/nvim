-- set the colorscheme
vim.cmd.colorscheme("catppuccin")

-- set formatting behavior
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- set data-saving behavior
vim.opt.undofile = true
vim.opt.clipboard = "unnamedplus"

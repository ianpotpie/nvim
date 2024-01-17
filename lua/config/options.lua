-- set the colorscheme
vim.cmd([[colorscheme onedark]])

-- set formatting behavior
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.clipboard = 'unnamedplus'

-- vim.cmd([[set number]])
-- vim.cmd([[set nowrap]])
-- vim.cmd([[set linebreak]])
-- vim.cmd([[set tabstop=2]])
-- vim.cmd([[set shiftwidth=2]])

print("config and packages finished loading")

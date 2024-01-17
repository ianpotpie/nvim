require("config.mappings")
require("config.lazy")

-- set the colorscheme
vim.cmd([[colorscheme onedark]])

-- set formatting behavior
vim.cmd([[set number]])
vim.cmd([[set nowrap]])
vim.cmd([[set linebreak]])
vim.cmd([[set tabstop=2]])
vim.cmd([[set shiftwidth=2]])

print("config and packages finished loading")

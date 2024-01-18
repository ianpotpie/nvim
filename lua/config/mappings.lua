-- setting the leader key
vim.g.mapleader = ' '

-- general keymapping
vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('n', '<leader>term', ':term<CR>i')
vim.keymap.set('n', '<leader>wrap', ':set wrap!<CR>')
vim.keymap.set('n', '<leader>spell', ':set spell!<CR>')
vim.keymap.set('n', '<leader>relative', ':set relativenumber!<CR>')

-- keymappings for telescope
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', {})
vim.keymap.set('n', '<leader>grep', ':Telescope live_grep<CR>', {})
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', {})
vim.keymap.set('n', '<leader>help', ':Telescope help_tags<CR>', {})
vim.keymap.set('n', '<leader>regs', ':Telescope registers<CR>', {})

-- keymappings for nvim-tree
vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>tf', ':NvimTreeFindFile<CR>')
vim.keymap.set('n', '<leader>tc', ':NvimTreeCollapse<CR>') 
vim.keymap.set('n', '<leader>tk', ':NvimTreeCollapseKeepBuffers<CR>')


local map = vim.keymap.set

-- setting the leader key
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- general keymapping
map('i', 'jk', '<ESC>')
map('n', '<leader>term', ':term<CR>i')
map('n', '<leader>wrap', ':set wrap!<CR>')
map('n', '<leader>spell', ':set spell!<CR>')
map('n', '<leader>relative', ':set relativenumber!<CR>')

-- keymappings for telescope
map('n', '<leader>ff', ':Telescope find_files<CR>', {})
map('n', '<leader>grep', ':Telescope live_grep<CR>', {})
map('n', '<leader>fb', ':Telescope buffers<CR>', {})
map('n', '<leader>help', ':Telescope help_tags<CR>', {})
map('n', '<leader>regs', ':Telescope registers<CR>', {})

-- keymappings for nvim-tree
map('n', '<leader>tt', ':NvimTreeToggle<CR>')
map('n', '<leader>tf', ':NvimTreeFindFile<CR>')
map('n', '<leader>tc', ':NvimTreeCollapse<CR>')
map('n', '<leader>tk', ':NvimTreeCollapseKeepBuffers<CR>')

-- quickly close the terminal
map('t', '<ESC>', '<C-\\><C-N>:q<CR>')

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
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Escape to clear highlights
map("n", "<ESC>", ":noh<CR>")

-- general keymapping
map("i", "jk", "<ESC>")
map("n", "<leader>term", ":term<CR>i")
map("n", "<leader>wrap", ":set wrap!<CR>")
map("n", "<leader>spell", ":set spell!<CR>")
map("n", "<leader>relative", ":set relativenumber!<CR>")

-- quickly exit insert mode in the terminal
map("t", "<ESC>", "<C-\\><C-N>")

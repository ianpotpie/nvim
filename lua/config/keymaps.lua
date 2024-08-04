local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- setting the leader key
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Resize with arrows
opts.desc = "Increase window width"
map("n", "<C-Up>", ":resize +2<CR>", opts)

opts.desc = "Decrease window width"
map("n", "<C-Down>", ":resize -2<CR>", opts)

opts.desc = "Decrease window height"
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)

opts.desc = "Increase window height"
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
opts.desc = "Switch to next buffer"
map("n", "<S-l>", ":bnext<CR>", opts)

opts.desc = "Switch to prev buffer"
map("n", "<S-h>", ":bprevious<CR>", opts)

-- Remap for dealing with word wrap
opts.desc = "Move up a line (within wrap)"
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

opts.desc = "Move down a line (within wrap)"
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Escape to clear highlights
opts.desc = "Pass escape key and remove highlights"
map("n", "<ESC>", ":noh<CR>", opts)

-- general keymapping
opts.desc = "Open terminal"
map("n", "<leader>tm", ":term<CR>i", opts)

opts.desc = "Toggle line wrap"
map("n", "<leader>wp", ":set wrap!<CR>", opts)

opts.desc = "Toggle the vim builtin spell-checker"
map("n", "<leader>sp", ":set spell!<CR>", opts)

opts.desc = "Toggle relative line numbering"
map("n", "<leader>rl", ":set relativenumber!<CR>", opts)

opts.desc = "Delete the buffer while keeping the window open"
map("n", "<leader>bd", ":bnext<CR>:bdelete #<CR>", opts)

-- quickly exit insert mode in the terminal
opts.desc = "Exit the terminal with <ESC>"
map("t", "<ESC>", "<ESC><C-\\><C-N>", opts)

-- Copilot keymapping
opts.desc = "Toggle Copilot Auto-Trigger"
map("n", "<leader>cp", ":lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)

local map = vim.keymap.set

-- setting the leader key
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Resize windows with arrows
map("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height", silent = true })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height", silent = true })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width", silent = true })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width", silent = true })

-- Navigate windows
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window", silent = true })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window", silent = true })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window", silent = true })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window", silent = true })

-- Other window commands
map("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically", silent = true })
map("n", "<leader>ws", "<C-w>s", { desc = "Split window horizontally", silent = true })
map("n", "<leader>we", "<C-w>=", { desc = "Make split windows equal width & height", silent = true })
map("n", "<leader>wx", ":close<CR>", { desc = "Close current split window", silent = true })

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", { desc = "Switch to next buffer", silent = true })
map("n", "<S-h>", ":bprevious<CR>", { desc = "Switch to prev buffer", silent = true })

-- Vertical navigation in line wrap
map(
	{ "n", "v" },
	"k",
	"v:count == 0 ? 'gk' : 'k'",
	{ desc = "Move up a line (within wrap)", silent = true, expr = true }
)
map(
	{ "n", "v" },
	"j",
	"v:count == 0 ? 'gj' : 'j'",
	{ desc = "Move down a line (within wrap)", silent = true, expr = true }
)

-- Escape to clear highlights
map("n", "<ESC>", ":noh<CR>", { desc = "Pass escape key and remove highlights", silent = true })

-- general keymapping
map("n", "<leader>tm", ":term<CR>i", { desc = "Open terminal", silent = true })
map("n", "<leader>wp", ":set wrap!<CR>", { desc = "Toggle line wrap", silent = true })
map("n", "<leader>sp", ":set spell!<CR>", { desc = "Toggle the vim builtin spell-checker", silent = true })
map("n", "<leader>rl", ":set relativenumber!<CR>", { desc = "Toggle relative line numbering", silent = true })
map(
	"n",
	"<leader>bd",
	":bnext<CR>:bdelete! #<CR>",
	{ desc = "Delete the buffer while keeping the window open", silent = true }
)

-- quickly exit insert mode in the terminal
map("t", "<ESC>", "<ESC><C-\\><C-N>", { desc = "Exit the terminal with <ESC>", silent = true })

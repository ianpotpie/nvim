return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup()

		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- set termguicolors to enable highlight groups
		vim.opt.termguicolors = true

		-- custom key mappings
		local keymap = vim.keymap
		keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>")
		keymap.set("n", "<leader>tf", ":NvimTreeFindFile<CR>")
		keymap.set("n", "<leader>tc", ":NvimTreeCollapse<CR>")
		keymap.set("n", "<leader>tk", ":NvimTreeCollapseKeepBuffers<CR>")
	end,
}

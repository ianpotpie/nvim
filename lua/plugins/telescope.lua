return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'BurntSushi/ripgrep',
		'sharkdp/fd',
		'nvim-tree/nvim-web-devicons'
	},
	config = function()
		local telescope = require('telescope')
		local builtin = require('telescope.builtin')

		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		vim.keymap.set('n', '<leader>fr', builtin.registers, {})

		telescope.setup {
			defaults = {
				mappings = {
					-- add mapping just for telescope here
				},
			},
			pickers = {
				find_files = {
					hidden = false,
					theme = "dropdown"
				},
				live_grep = {
					hidden = false,
					theme = "dropdown"
				}
			},
			extensions = {
				-- Your extensions configuration here
			},
		}
	end
}

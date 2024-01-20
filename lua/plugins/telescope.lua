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
		local actions = require('telescope.actions')

		telescope.setup{
			defaults = {
				mappings = {
					i = {
						["<esc>"] = actions.close
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					theme = "dropdown",
					cwd = vim.fn.getcwd(), -- This sets the working directory to the current directory
				},
			},
			extensions = {
				-- Your extensions configuration here
			},
		}
	end
}


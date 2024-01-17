return {
  'L3MON4D3/LuaSnip',
  dependencies = {
		'rafamadriz/friendly-snippets'
	},
	config = function()
		local luasnip = require('luasnip')

		luasnip.config.set_config({
			history = true,
			updateevents = 'TextChanged, TextChangedI'
		})

		require("luasnip.loaders.from_vscode").load()
	end
}

return {
	"L3MON4D3/LuaSnip",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local luasnip = require("luasnip")

		luasnip.config.set_config({
			history = true,
			region_check_events = "InsertEnter",
			delete_check_events = "TextChanged, InsertLeave",
			update_events = "TextChanged, TextChangedI",
		})

		require("luasnip.loaders.from_vscode").load()
	end,
}

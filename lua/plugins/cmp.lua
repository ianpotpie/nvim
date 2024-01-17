return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-nvim-lua',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'neovim/nvim-lspconfig',
		"L3MON4D3/LuaSnip",
		'saadparwaiz1/cmp_luasnip'
	},
	config = function()
		local cmp = require('cmp')

		-- Global setup.
		cmp.setup({
			snippet = {
				expand = function(args)
					-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
					require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					-- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
					-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
				end,
			},
			window = {
				-- completion = cmp.config.window.bordered(),
				-- documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				['<C-d>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				-- { name = 'nvim_lsp' },
				-- { name = 'vsnip' }, -- For vsnip users.
				{ name = 'luasnip' }, -- For luasnip users.
				-- { name = 'snippy' }, -- For snippy users.
				-- { name = 'ultisnips' }, -- For ultisnips users.
				{ name = 'nvim_lua' },
				{ name = 'path'},
				{ name = 'nvim_lsp'},
				{ name = 'buffer' },
			})
		})

		-- `/` cmdline setup.
		cmp.setup.cmdline('/', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = 'buffer' }
			}
		})


		-- `:` cmdline setup.
		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = 'path' },
				{ name = 'cmdline' }
			})
		})

		-- Setup lspconfig.
		-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
		-- require('lspconfig')[%YOUR_LSP_SERVER%].setup {
		-- 	capabilities = capabilities
		-- }
	end
}

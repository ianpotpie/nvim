return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"WhoIsSethDaniel/mason-tool-installer.nvim"
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				}
			}
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"tsserver",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"pylsp"
			},
			automatic_installation = true
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua",   -- lua formatter
				"isort",    -- python formatter
				"black",    -- python formatter
				"pylint",   -- python linter
				"eslint_d", -- js linter
			}
		})

		mason_lspconfig.tsserver.setup({})
		mason_lspconfig.pylsp.setup({})
		mason_lspconfig.lua_ls.setup({
			on_init = function(client)
				local path = client.workspace_folders[1].name
				if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
					client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
						Lua = {
							runtime = {
								-- Tell the language server which version of Lua you're using
								-- (most likely LuaJIT in the case of Neovim)
								version = 'LuaJIT'
							},
							-- Make the server aware of Neovim runtime files
							workspace = {
								checkThirdParty = false,
								library = {
									vim.env.VIMRUNTIME
									-- "${3rd}/luv/library"
									-- "${3rd}/busted/library",
								}
								-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
								-- library = vim.api.nvim_get_runtime_file("", true)
							}
						}
					})

					client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
				end
				return true
			end
		})


		-- Global mappings.
		-- See `:help vim.diagnostic.*` for documentation on any of the below functions
		vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
		vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
		vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
		vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('UserLspConfig', {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
				vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
				vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
				vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set('n', '<space>wl', function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)
				vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
				vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
				vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
				vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
				vim.keymap.set('n', '<space>f', function()
					vim.lsp.buf.format { async = true }
				end, opts)
			end,
		})
	end
}

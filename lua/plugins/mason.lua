local map = vim.keymap.set

return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")
		local lspconfig = require("lspconfig")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"tsserver", -- typescript/javascript lsp
				"html", -- html lsp
				"cssls", -- css lsp
				"lua_ls", -- lua lsp
				"pyright", -- python lsp
				"emmet_ls", -- emmet lsp
				"ocamllsp", -- ocaml lsp
			},
			automatic_installation = true,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter for sorting imports
				"black", -- python formatter for formatting code
				"pylint", -- python linter for code quality
				"eslint_d", -- js linter for code quality
			},
		})

		lspconfig["texlab"].setup({})
		lspconfig["tsserver"].setup({})
		lspconfig["html"].setup({})
		lspconfig["cssls"].setup({})
		lspconfig["pyright"].setup({})
		lspconfig["ocamllsp"].setup({})

		-- Global mappings.
		-- See `:help vim.diagnostic.*` for documentation on any of the below functions
		map("n", "<space>e", vim.diagnostic.open_float, { desc = "Open diagnostic float", silent = true })
		map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic", silent = true })
		map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic", silent = true })
		map("n", "<space>q", vim.diagnostic.setloclist, { desc = "Set loclist", silent = true })

		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", buffer = ev.buf })
				map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", buffer = ev.buf })
				map("n", "K", vim.lsp.buf.hover, { desc = "Show hover doc", buffer = ev.buf })
				map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation", buffer = ev.buf })
				map("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Show signature help", buffer = ev.buf })
				map(
					"n",
					"<space>wa",
					vim.lsp.buf.add_workspace_folder,
					{ desc = "Add workspace folder", buffer = ev.buf }
				)
				map(
					"n",
					"<leader>wr",
					vim.lsp.buf.remove_workspace_folder,
					{ desc = "Remove workspace folder", buffer = ev.buf }
				)
				map("n", "<space>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, { desc = "List workspace folders", buffer = ev.buf })
				map("n", "<space>D", vim.lsp.buf.type_definition, { desc = "Go to type definition", buffer = ev.buf })
				map("n", "<space>rn", vim.lsp.buf.rename, { desc = "Rename", buffer = ev.buf })
				map({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { desc = "Code action", buffer = ev.buf })
				map("n", "gr", vim.lsp.buf.references, { desc = "Go to references", buffer = ev.buf })
				map("n", "<space>f", function()
					vim.lsp.buf.format({ async = true })
				end, { desc = "Format", buffer = ev.buf })
			end,
		})
	end,
}

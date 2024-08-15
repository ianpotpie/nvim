return {
	"zbirenbaum/copilot.lua",
	cmd = {
		"Copilot",
	},
	event = {
		"InsertEnter",
	},
	config = function()
		require("copilot").setup({})

		-- Copilot keymapping
		local map = vim.keymap.set
		local opts = {
			noremap = true,
			silent = true,
		}
		opts.desc = "Toggle Copilot Auto-Trigger"
		map("n", "<leader>cp", ":lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)
	end,
}

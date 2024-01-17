return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function()
	
	--key remappings
	vim.keymap.set('n', '<leader>mp', '<Plug>MarkdownPreview', { silent = true })
	vim.keymap.set('n', '<leader>ms', '<Plug>MarkdownPreviewStop', { silent = true })
	vim.keymap.set('n', '<leader>mt', '<Plug>MarkdownPreviewToggle', { silent = true })
    end
}


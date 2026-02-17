return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	-- This runs 'npm install' inside the plugin's folder to build it manually
	build = "cd app && npm install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	config = function()
		vim.keymap.set("n", "<leader>pv", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Toggle Markdown Preview" })
	end,
}

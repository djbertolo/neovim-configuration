return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate", -- Automatically update parsers when the plugin updates
	config = function()
		require("nvim-treesitter.config").setup({
			-- A list of parser names, or "all" (but "all" is slow)
			ensure_installed = { 
				"c",
				"cpp",
				"lua", 
				"vim", 
				"vimdoc", 
				"query", 
				"go", 
				"markdown", 
				"markdown_inline", -- Needed for highlighting inside markdown links/code blocks
				"latex" -- Note: Treesitter parser for LaTeX. We will add VimTeX later for compilation.
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			auto_install = true,

			highlight = {
				enable = true, -- Check this is set to true

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for VimTeX)
				additional_vim_regex_highlighting = { "markdown" },
			},
		})
	end,
}

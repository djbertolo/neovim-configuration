return {
	"olimorris/onedarkpro.nvim",
	priority = 1000, -- Ensure it loads first
	config = function()
		require("onedarkpro").setup({
			options = {
				transparency = false, -- Set to true if you want your terminal background to show through
				cursorline = true,    -- Highlight the line your cursor is on
			},
		})
		vim.cmd("colorscheme onedark")
	end,
}

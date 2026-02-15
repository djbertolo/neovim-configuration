return {
	"olimorris/onedarkpro.nvim",
	priority = 1000,
	config = function()
		require("onedarkpro").setup({
			options = {
				transparency = false,
				cursorline = true,
			},
			colors = {
				-- This overrides the default background across the entire theme
				onelight = { bg = "#1d1e1f" }, -- Overrides for light mode if used
				onedark = { bg = "#1d1e1f" }, -- Overrides for dark mode
			},
			highlights = {
				-- Ensures floating windows and sidebars match perfectly
				NormalFloat = { bg = "#1d1e1f" },
				FloatBorder = { fg = "#3e4452", bg = "#1d1e1f" },
			},
		})
		vim.api.nvim_set_hl(0, "LineNr", { fg = "#4b5263" }) -- Subtle grey for inactive numbers
		vim.cmd("colorscheme onedark")
	end,
}

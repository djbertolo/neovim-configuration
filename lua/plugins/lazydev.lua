return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		priority = 100, -- Load this early
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}

return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the help section for more options
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}

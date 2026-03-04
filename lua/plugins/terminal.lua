return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			-- Sets the default size of the terminal (not used for float but good for splits)
			size = 20,
			-- Keybinding to open the terminal (defaulting to Ctrl+\)
			open_mapping = [[<c-\>]],
			hide_numbers = true, -- hide the number column in terminal buffers
			shade_terminals = true,
			start_in_insert = true,
			insert_mappings = true, -- whether or not the open mapping applies in insert mode
			persist_size = true,
			-- Set the default appearance to 'float'
			direction = "float",
			close_on_exit = true, -- close the terminal window when the process exits
			shell = vim.o.shell,
			-- Customize the floating window look
			float_opts = {
				border = "curved", -- 'single' | 'double' | 'shadow' | 'curved'
				winblend = 3,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})

		-- Function to easily map terminal escapes (Esc to exit terminal mode)
		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
		end

		-- Automatically set these keymaps whenever a terminal is opened
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}

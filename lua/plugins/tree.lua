return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	}, -- Optional: for file icons
	config = function()
		-- 1. Disable netrw (strongly recommended by nvim-tree)
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- 2. Setup the plugin with some "sensible defaults"
		require("nvim-tree").setup(
			{
				sort = {
					sorter = "case_sensitive",
				},

				view = {
					width = 30,
				},

				renderer = {
					group_empty = true,
				},

				filters = {
					dotfiles = true, -- Hide .git, .config, etc. (Toggle with 'H')
				}
			}
		)

		-- 3. Keybinding: <leader>e to toggle the tree
		-- This sets 'Space + e' to open/close the sidebar
		vim.keymap.set(
			{
				"n",
				"v",
			},
			"<Leader>e",
			":NvimTreeToggle<CR>",
			{
				desc = "Toggle File Explorer"
			}
		)
	end
}

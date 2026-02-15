return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		-- Mason setup
		require("mason").setup()

		require("mason-lspconfig").setup({
			ensure_installed = { "clangd", "gopls", "lua_ls", "texlab" },
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,

				-- Targeted fix for lua_ls
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						settings = {
							Lua = {
								diagnostics = {
									-- Explicitly add 'vim' to globals
									globals = { "vim" },
								},
								workspace = {
									-- Make server aware of Neovim runtime files
									library = vim.api.nvim_get_runtime_file("", true),
									checkThirdParty = false,
								},
							},
						},
					})
				end,
			},
		})

		-- Global Keymaps
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
			end,
		})
	end,
}

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				go = { "gofmt" },
				-- specific javascript/typescript formatters if you need them later:
				-- javascript = { "prettier" },
			},
			format_on_save = {
				lsp_fallback = true, -- If no formatter is found, use the LSP (clangd/gopls)
				async = false,       -- Block saving until formatting is done (safer)
				timeout_ms = 500,    -- Give up if it takes too long
			},
		})

		-- Optional: Keybind to manually format with <leader>mp
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}

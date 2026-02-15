return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- Connects to LSP
		"hrsh7th/cmp-buffer",   -- Suggests words in current file
		"hrsh7th/cmp-path",     -- Suggests file paths
		"L3MON4D3/LuaSnip",     -- Snippet engine (required)
		"saadparwaiz1/cmp_luasnip", -- Connects snippets to cmp
		"rafamadriz/friendly-snippets", -- A huge collection of snippets
		"onsails/lspkind.nvim", -- Adds icons (like [Function], [Variable])
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered({
					max_height = 5;
				}),
				documentation = cmp.config.window.bordered({
					max_height = 10;
				}),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- Manually trigger menu
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enter to confirm
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- Prioritize LSP suggestions
				{ name = "luasnip" },  -- Snippets
			}, {
				{ name = "buffer" },   -- Words from the file
				{ name = "path" },     -- File paths
			}),
		})
	end,
}

return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		-- 1. Setup Preview
		vim.g.vimtex_view_method = "general"
		vim.g.vimtex_view_general_viewer = "open"
		vim.g.vimtex_view_general_options = "-g @pdf"
		vim.g.vimtex_view_automatic = 1

		-- 2. DISABLE Continuous Mode to stop the loop
		-- This makes it so VimTeX compiles once per save
		vim.g.vimtex_compiler_latexmk = {
			continuous = 0,
			options = {
				"-shell-escape",
				"-verbose",
				"-file-line-error",
				"-synctex=1",
				"-interaction=nonstopmode",
			},
		}

		-- 3. The Clean & Refresh Logic
		vim.api.nvim_create_autocmd("User", {
			pattern = "VimtexEventCompileSuccess",
			callback = function()
				-- Refresh Preview
				os.execute("open -g " .. vim.fn.expand("%:r") .. ".pdf")
				-- Clean auxiliary files
				vim.cmd("VimtexClean")
			end,
		})

		-- 4. Automatically Compile on Save
		-- Since we turned off continuous mode, we trigger it manually on save
		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = "*.tex",
			command = "VimtexCompile",
		})
	end,
}

-- Enable line numbers
vim.opt.number = true

-- Enable relative line numbers
vim.opt.relativenumber = true

-- Tabs & Indentation
vim.opt.tabstop = 4		-- 4 spaces for tabs
vim.opt.shiftwidth = 4		-- 4 spaces for ident width
vim.opt.expandtab = false	-- Don't use spaces instead of tabs
vim.opt.autoindent = true	-- Copy indent from current line when starting new one

-- Search settings
vim.opt.ignorecase = true 	-- Case insensitive search
vim.opt.smartcase = true	-- ... unless you type a capital letter

-- Appearance
vim.opt.termguicolors = true	-- Enable 24-bit RGB colors
vim.opt.signcolumn = "yes"	-- Always show the sign column (prevents text shifting)

-- Clipboard
-- Syncs Neovim clipboard with Mac's system clipboard (cmd+c / cmd+v)
vim.opt.clipboard = "unnamedplus"

-- Split windows behavior
vim.opt.splitright = true	-- Vertical splits will automatically be to the right
vim.opt.splitbelow = true	-- Horizontal splits will automatically be below

-- Scrolling
vim.opt.scrolloff = 8		-- Keep 8 lines above and below the cursor when scrolling
				-- (keeps content centered)

-- Undo
vim.opt.undofile = true		-- Save undo history to a file
				-- (Able to undo changes after closing a file)

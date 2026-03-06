-- Enable line numbers
vim.opt.number = true

-- Enable relative line numbers
vim.opt.relativenumber = true

-- Tabs & Indentation
vim.opt.tabstop = 4 -- 4 spaces for tabs
vim.opt.shiftwidth = 4 -- 4 spaces for ident width
vim.opt.expandtab = false -- Don't use spaces instead of tabs
vim.opt.autoindent = true -- Copy indent from current line when starting new one

-- Word Wrapping (Markdown/TeX Fix)
vim.opt.wrap = true -- Enable soft wrap
vim.opt.linebreak = true -- Don't break words in the middle
vim.opt.breakindent = true -- Indented lines keep their indentation

-- Search settings
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- ... unless you type a capital letter

-- Appearance
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.signcolumn = "yes" -- Always show the sign column (prevents text shifting)

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Split windows behavior
vim.opt.splitright = true -- Vertical splits will automatically be to the right
vim.opt.splitbelow = true -- Horizontal splits will automatically be below

-- Scrolling
vim.opt.scrolloff = 8 -- Keep 8 lines above and below the cursor when scrolling

-- Undo
vim.opt.undofile = true -- Save undo history to a file

-- 1. Set Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.vimtex_clean_enabled = 1
vim.g.vimtex_clean_verify = 0 -- Don't ask for permission, just delete

-- 2. Load Options (Settings)
require("options")

-- 3. Load Plugins (Lazy)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

-- Initialize Lazy
require("lazy").setup("plugins")

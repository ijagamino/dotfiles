-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("config")
require("remap")
require("lazy").setup({
	spec = {
		{ import = "plugins.editor" },
		{ import = "plugins.lsp" },
		{ import = "plugins.lint" },
		{ import = "plugins.dap" },
		{ import = "plugins.formatting" },
		{ import = "plugins.html" },
		{ import = "plugins.laravel" },
		{ import = "plugins.markdown" },
	},
	install = { colorscheme = { "catppuccin" } },
	ui = {
		border = "rounded",
	},
})

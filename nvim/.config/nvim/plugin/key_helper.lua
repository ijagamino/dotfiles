vim.pack.add({
	"https://github.com/folke/which-key.nvim",
})

require("which-key").setup({
	win = {
		width = { min = 40, max = 0 },
		col = -1,
		border = "single",
	},
})

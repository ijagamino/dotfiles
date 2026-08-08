vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",
})

require("lualine").setup({
	sections = {
		lualine_b = { "branch" },
		lualine_c = { "diff", "diagnostics", "filename" },
		lualine_x = { "grapple", "lsp_status" },
	},
})

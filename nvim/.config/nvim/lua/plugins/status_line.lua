return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		sections = {
			lualine_b = { "branch" },
			lualine_c = { "diff", "diagnostics", "filename" },
			lualine_x = { "grapple", "lsp_status" },
		},
	},
}

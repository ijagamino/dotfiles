return {
	"stevearc/aerial.nvim",
	branch = "nvim-0.11",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	cmd = {
		"AerialOpen",
	},
	opts = {
		layout = {
			default_direction = "prefer_left",
			min_width = 20,
		},
		on_attach = function(bufnr)
			vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
			vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
		end,
	},
	keys = {
		{ "<leader>ta", "<cmd>AerialToggle!<CR>" },
	},
}

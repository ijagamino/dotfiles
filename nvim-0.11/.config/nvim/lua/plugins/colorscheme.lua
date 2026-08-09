return {
	"WTFox/luna.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function(_, opts)
		require("luna").setup(opts)
		vim.cmd.colorscheme("luna")
	end,
}

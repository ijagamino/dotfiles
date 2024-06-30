return {
	"windwp/nvim-ts-autotag",
	dependencies = { "nvim-treesitter/nvim-treesitter" },

	lazy = true,
	event = { "BufReadPre", "BufNewFile" },

	opts = {},

	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			autotag = {
				enable = true,
			},
		})
	end,
}

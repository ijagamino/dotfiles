return {
	"folke/trouble.nvim",
	opts = {},
	cmd = "Trouble",
	keys = {
		{
			"<leader>x",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "[Trouble] Diagnostics",
		},
		{
			"<leader>X",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "[Trouble] Buffer diagnostics",
		},
	},
}

return {
	"mikavilpas/yazi.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	},
	keys = {
		"<C-e>",
		"<cmd>Yazi<cr>",
		desc = "Open yazi at the current file",
		mode = { "n", "v" },
	},
}

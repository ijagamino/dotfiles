return {
	"mikavilpas/yazi.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	},
	keys = {
		"<C-p>",
		function()
			vim.cmd("Yazi")
		end,
		desc = "[Yazi] File manager",
		mode = { "n", "v" },
	},
}

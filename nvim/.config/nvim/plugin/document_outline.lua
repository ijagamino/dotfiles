vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/stevearc/aerial.nvim",
})

require("aerial").setup({
	on_attach = function(bufnr)
		vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
		vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
	end,

	layout = {
		default_direction = "prefer_left",
		min_width = 20,
	},
})

vim.keymap.set("n", "<leader>ta", "<cmd>AerialToggle!<CR>")

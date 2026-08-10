return {
	"folke/edgy.nvim",
	event = "VeryLazy",
	opts = {
		animate = { enabled = false },
		left = {
			{
				title = "Outline",
				ft = "aerial",
				pinned = true,
				open = function()
					vim.cmd("AerialOpen!")
				end,
			},
		},
	},
	init = function()
		vim.opt.laststatus = 3
		vim.opt.splitkeep = "screen"

		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				vim.schedule(function()
					require("edgy").open()
				end)
			end,
		})
	end,
}

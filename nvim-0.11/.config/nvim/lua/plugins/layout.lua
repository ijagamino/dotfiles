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
					local main_win = vim.api.nvim_get_current_win()

					vim.cmd("AerialOpen")

					vim.api.nvim_set_current_win(main_win)
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

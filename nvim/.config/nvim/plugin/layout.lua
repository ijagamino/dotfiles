vim.pack.add({
	"https://github.com/folke/edgy.nvim",
})

vim.opt.laststatus = 3
vim.opt.splitkeep = "screen"

require("edgy").setup({
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
})

local group = vim.api.nvim_create_augroup("Layout", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		-- This opens all pinned views in your edgebars (like Aerial)
		require("edgy").open()
	end,
	group = group,
})

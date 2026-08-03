return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.pairs").setup({})
		require("mini.cursorword").setup({})

		local win_config = function()
			local has_statusline = vim.o.laststatus > 0
			local pad = vim.o.cmdheight + (has_statusline and 1 or 0)
			return { anchor = "SE", col = vim.o.columns, row = vim.o.lines - pad }
		end

		require("mini.notify").setup({
			window = { config = win_config },
		})
	end,
}

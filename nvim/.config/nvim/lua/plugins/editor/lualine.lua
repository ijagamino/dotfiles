return {
	-- Set lualine as statusline
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	-- See `:help lualine.txt`
	config = function()
		local lualine = require("lualine")
		-- local noice = require("noice")

		lualine.setup({
			options = {
				icons_enabled = true,
			},
		})
	end,
}

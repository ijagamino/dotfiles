return {
	"laytan/tailwind-sorter.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
	},
	build = "cd formatter && npm ci && npm run build",

	config = function()
		local tailwind_sorter = require("tailwind-sorter")
		tailwind_sorter.setup({
			on_save_enabled = false, -- If `true`, automatically enables on save sorting.
		})
	end,
}

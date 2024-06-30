return {
	"nvim-treesitter/nvim-treesitter-refactor",
	dependencies = { "nvim-treesitter/nvim-treesitter" },

	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			refactor = {
				smart_rename = {
					enable = true,
					-- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
					keymaps = {
						smart_rename = "<leader>rr",
					},
				},
				navigation = {
					enable = true,
					-- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
					keymaps = {
						goto_definition = "gnd",
						list_definitions = "gnD",
						list_definitions_toc = "gO",
						goto_next_usage = "<a-*>",
						goto_previous_usage = "<a-#>",
					},
				},
			},
		})
	end,
}

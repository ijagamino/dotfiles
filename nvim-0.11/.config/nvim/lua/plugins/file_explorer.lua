return {
	"stevearc/oil.nvim",
	---@module 'oil'
	-- Optional dependencies
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	---@type oil.SetupOpts
	opts = {},
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
	keys = {
		{
			"<C-e>",
			function()
				vim.cmd("Oil")
			end,
			desc = "[Oil] File explorer",
		},
	},
}

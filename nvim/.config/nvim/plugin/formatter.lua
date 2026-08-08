vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})

local conform = require("conform")
local formatter = require("registries.formatter")

conform.setup({
	formatters_by_ft = formatter.formatters_by_ft,
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

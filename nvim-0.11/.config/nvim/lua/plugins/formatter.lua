return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = {
		-- Define your formatters
		formatters_by_ft = require("registries.formatter").formatters_by_ft,
		default_format_opts = {
			lsp_format = "fallback",
		},
		-- Set up format-on-save
		format_on_save = { timeout_ms = 500 },
		-- Customize formatters
		formatters = {
			shfmt = {
				append_args = { "-i", "2" },
			},
		},
	},
}

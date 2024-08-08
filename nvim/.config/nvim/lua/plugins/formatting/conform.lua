return {
	"stevearc/conform.nvim",

	lazy = true,
	event = {
		"BufReadPre",
		"BufNewFile",
	},

	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				-- Conform will run multiple formatters sequentially
				-- Use a sub-list to run only the first available formatter
				-- Use the "*" filetype to run formatters on all filetypes.
				-- Use the "_" filetype to run formatters on filetypes that don't
				-- have other formatters configured.
				css = { { "prettierd", "prettier" } },
				html = { { "prettierd", "prettier" } },
				javascript = { { "prettierd", "prettier" } },
				lua = { "stylua" },
				php = { "pint" },
				blade = { "blade-formatter" },
				python = { "isort", "black" },
				vue = { { "prettierd", "prettier" } },
				-- ["*"] = { "codespell" },
				["_"] = { "codespell", "trim_whitespace" },
			},
			format_on_save = {
				-- I recommend these options. See :help conform.format for details.
				lsp_fallback = true,
				timeout_ms = 500,
			},
			-- If this is set, Conform will run the formatter asynchronously after save.
			-- It will pass the table to conform.format().
			-- This can also be a function that returns the table.
			format_after_save = {
				lsp_fallback = true,
				timeout_ms = 500,
			},
		})
	end,
}

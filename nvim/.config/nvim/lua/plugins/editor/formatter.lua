return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
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
			-- ["_"] = { "codespell", "trim_whitespace" },
		},
		format_on_save = function(bufnr)
			-- Disable "format_on_save lsp_fallback" for languages that don't
			-- have a well standardized coding style. You can add additional
			-- languages here or re-enable it for the disabled ones.
			local disable_filetypes = { c = true, cpp = true }
			if disable_filetypes[vim.bo[bufnr].filetype] then
				return nil
			else
				return {
					timeout_ms = 500,
					lsp_format = "fallback",
				}
			end
		end,
	},
}

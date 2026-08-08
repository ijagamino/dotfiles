local formatter = require("registries.formatter")

vim.lsp.config("vtsls", {
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
	},
})

vim.lsp.enable("vtsls")

vim.lsp.enable("vue_ls")

formatter.formatters_by_ft.vue = { "prettierd", "prettier" }

local linter = require("registries.linter")
local formatter = require("registries.formatter")

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

vim.lsp.enable("lua_ls")

linter.linters_by_ft.lua = { "selene" }
formatter.formatters_by_ft.lua = { "stylua" }

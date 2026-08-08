local linter = require("registries.linter")
local formatter = require("registries.formatter")

vim.lsp.enable("vtsls")

for _, ft in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
	linter.linters_by_ft[ft] = { "eslint_d" }
	formatter.formatters_by_ft[ft] = { "prettierd", "prettier" }
end

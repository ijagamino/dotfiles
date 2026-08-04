local linter = require("registries.linter")
local formatter = require("registries.formatter")

vim.lsp.enable("intelephense")

linter.linters_by_ft.php = { "phpstan" }
formatter.formatters_by_ft.php = { "pint" }

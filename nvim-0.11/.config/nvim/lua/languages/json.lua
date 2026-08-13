local formatter = require("registries.formatter")

vim.lsp.enable("jsonls")

formatter.formatters_by_ft.json = { "prettierd", "prettier" }

local formatter = require("registries.formatter")

vim.lsp.enable("cssls")

formatter.formatters_by_ft.css = { "prettierd", "prettier", stop_after_first = true }

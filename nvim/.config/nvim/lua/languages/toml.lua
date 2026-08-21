local formatter = require("registries.formatter")

vim.lsp.enable("tombi")

formatter.formatters_by_ft.toml = { "prettierd", "prettier", stop_after_first = true }

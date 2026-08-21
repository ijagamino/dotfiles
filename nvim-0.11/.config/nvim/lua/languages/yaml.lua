local formatter = require("registries.formatter")

vim.lsp.enable("yamlls")

formatter.formatters_by_ft.yaml = { "prettierd", "prettier", stop_after_first = true }

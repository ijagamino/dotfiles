local linter = require("registries.linter")

vim.lsp.enable("marksman")

linter.linters_by_ft.markdown = { "markdownlint" }

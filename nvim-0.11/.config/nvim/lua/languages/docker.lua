local formatter = require("registries.formatter")

vim.lsp.enable("docker_language_server")

formatter.formatters_by_ft.dockerfile = { "dockerfmt" }

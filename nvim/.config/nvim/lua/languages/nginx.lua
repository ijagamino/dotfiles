local formatter = require("registries.formatter")

vim.lsp.enable("nginx_language_server")

formatter.formatters_by_ft.nginx = { "nginx-config-formatter" }

vim.lsp.config("shopify", {
	cmd = { "shopify", "theme", "language-server" },
	filetypes = { "liquid" },
})

vim.lsp.enable("shopify")

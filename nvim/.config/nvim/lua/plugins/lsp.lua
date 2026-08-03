return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.diagnostic.config({ virtual_text = true })

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		vim.lsp.config("vtsls", {
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
			},
		})

		vim.lsp.config("shopify", {
			cmd = { "shopify", "theme", "language-server" },
			filetypes = { "liquid" },
		})

		vim.lsp.enable("lua_ls", "vtsls", "vuels", "intelephense", "jdtls", "shopify")
	end,
}

return {
	"neovim/nvim-lspconfig",
	lazy = false,
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

		local servers = {
			"lua_ls",
			"vtsls",
			"vue_ls",
			"intelephense",
			"jdtls",
			"shopify",
		}

		for _, server in ipairs(servers) do
			vim.lsp.enable(server)
		end
	end,
}

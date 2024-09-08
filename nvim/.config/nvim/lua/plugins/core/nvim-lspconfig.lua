return {
	-- LSP Configuration & Plugins
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",

		-- Useful status updates for LSP
		-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
		{
			"j-hui/fidget.nvim",
			opts = {
				notification = {
					window = {
						winblend = 0,
						-- border = "rounded",
					},
				},
			},
		},

		-- Additional lua configuration, makes nvim stuff amazing!
		"folke/neodev.nvim",
	},

	config = function()
		-- [[ Configure LSP ]]
		local telescope_builtin = require("telescope.builtin")
		local mason_lspconfig = require("mason-lspconfig")
		local mason = require("mason")

		--  This function gets run when an LSP connects to a particular buffer.
		local on_attach = function(_, bufnr)
			-- NOTE: Remember that lua is a real programming language, and as such it is possible
			-- to define small helper and utility functions so you don't have to repeat yourself
			-- many times.

			-- In this case, we create a function that lets us more easily define mappings specific
			-- for LSP related items. It sets the mode, buffer and description for us each time.
			local nmap = function(keys, func, desc)
				if desc then
					desc = "LSP: " .. desc
				end

				vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
			end

			nmap("<leader>rn", vim.lsp.buf.rename, "[r]e[n]ame")
			nmap("<leader>ca", function()
				vim.lsp.buf.code_action({ context = { only = { "quickfix", "refactor", "source" } } })
			end, "Code [a]ction")

			nmap("gd", telescope_builtin.lsp_definitions, "Go to [d]efinition")
			nmap("gr", telescope_builtin.lsp_references, "Go to [r]eferences")
			nmap("gI", telescope_builtin.lsp_implementations, "Go to [I]mplementation")
			nmap("<leader>lt", telescope_builtin.lsp_type_definitions, "[t]ype definition")
			nmap("<leader>ld", telescope_builtin.lsp_document_symbols, "[d]ocument symbols")
			nmap("<leader>lw", telescope_builtin.lsp_dynamic_workspace_symbols, "[w]orkspace symbols")

			-- See `:help K` for why this keymap
			nmap("K", vim.lsp.buf.hover, "Hover Documentation")
			nmap("<C-i>", vim.lsp.buf.signature_help, "Signature Documentation")

			-- Lesser used LSP functionality
			nmap("gD", vim.lsp.buf.declaration, "Go to [D]eclaration")
			nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "Workspace [a]dd folder")
			nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "Workspace [r]emove folder")
			nmap("<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, "Workspace [l]ist Folders")

			-- Create a command `:Format` local to the LSP buffer
			vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
				vim.lsp.buf.format()
			end, { desc = "Format current buffer with LSP" })
		end

		-- mason-lspconfig requires that these setup functions are called in this order
		-- before setting up the servers.
		mason.setup({
			ui = {
				border = "rounded",
			},
		})
		mason_lspconfig.setup()

		-- Enable the following language servers
		--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
		--
		--  Add any additional override configuration in the following tables. They will be passed to
		--  the `settings` field of the server config. You must look up that documentation yourself.
		--
		--  If you want to override the default filetypes that your language server will attach to you can
		--  define the property 'filetypes' to the map in question.
		local servers = {
			cssls = {},
			emmet_language_server = {
				filetypes = {
					"blade",
					"css",
					"eruby",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
					"svelte",
					"pug",
					"php",
					"typescriptreact",
					"vue",
				},
			},
			html = {},
			intelephense = {
				filetypes = {
					"php",
					"blade",
				},
				settings = {
					intelephense = {
						filetypes = {
							"php",
							"blade",
						},
						files = {
							associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
							maxSize = 5000000,
						},
					},
				},
			},
			marksman = {},
			pyright = {},
			tailwindcss = {},
			tsserver = {},
			volar = {},
			lua_ls = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
					-- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
					diagnostics = {
						disable = { "missing-fields" },
						globals = { "vim" },
					},
				},
			},
		}

		-- Setup neovim lua configuration
		require("neodev").setup()

		-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		-- Ensure the servers above are installed

		mason_lspconfig.setup({
			ensure_installed = vim.tbl_keys(servers),
		})

		mason_lspconfig.setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = servers[server_name],
					filetypes = (servers[server_name] or {}).filetypes,
				})
			end,
		})
	end,
}

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		-- local opts = { buffer = event.buf, silent = true }
		local function map(mode, lhs, rhs, opts)
			opts = opts or {}
			opts.buffer = event.buf
			opts.silent = true

			vim.keymap.set(mode, lhs, rhs, opts)
		end

		map("n", "gR", "<cmd>FzfLua lsp_references<CR>", { desc = "Show LSP references" }) -- show definition, references
		map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" }) -- go to declaration
		map("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", { desc = "Show LSP definition" }) -- show lsp definition
		map("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", { desc = "Show LSP implementations" }) -- show lsp implementations
		map("n", "gt", "<cmd>FzfLua lsp_typedefs<CR>", { desc = "Show LSP type definitions" }) -- show lsp type definitions
		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions" }) -- see available code actions, in visual mode will apply to selection
		map("n", "<leader>x", "<cmd>FzfLua diagnostics_document<CR>", { desc = "Diagnostics - file" }) -- show  diagnostics for file
		map("n", "<leader>X", "<cmd>FzfLua diagnostics_workspace<CR>", { desc = "Diagnostics - workspace" }) -- show  diagnostics for file
		map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" }) -- show diagnostics for line
		map("n", "[d", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, { desc = "Go to previous diagnostic" }) -- jump to previous diagnostic in buffer
		map("n", "]d", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, { desc = "Go to next diagnostic" }) -- jump to next diagnostic in buffer
		map("n", "K", vim.lsp.buf.hover, { desc = "Show documentation for what is under cursor" }) -- show documentation for what is under cursor
		-- map("n", "<leader>rs", ":LspRestart<CR>",  "Restart LSP") -- mapping to restart lsp if necessary
	end,
})

vim.diagnostic.config({
	virtual_text = true,
	float = {
		source = true,
	},
})

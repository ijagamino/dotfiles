return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		vim.diagnostic.config({
			virtual_text = true,
			float = {
				source = true,
			},
		})
	end,
}

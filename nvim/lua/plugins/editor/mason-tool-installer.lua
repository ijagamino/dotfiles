return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",

	config = function()
		local installer = require("mason-tool-installer")

		installer.setup({
			ensure_installed = {
				-- Linters
				"codespell",
				"eslint_d",
				"htmlhint",
				"markuplint",
				"pylint",
				"selene",
				"stylelint",
				"vale",
				-- Formatters
				"black",
				"isort",
				"pint",
				"prettier",
				"prettierd",
				"stylua",
			},
		})
	end,
}

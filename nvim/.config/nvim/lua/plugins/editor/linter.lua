return {
	"mfussenegger/nvim-lint",

	event = {
		"BufReadPre",
		"BufNewFile",
	},

	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			-- lua = { "selene", "codespell" },
			javascript = { "eslint_d", "codespell" },
			typescript = { "eslint_d", "codespell" },
			-- php = { "php" },
			-- blade = { "tlint" },
			-- html = { "markuplint" },
			markdown = { "markdownlint" },
			css = { "stylelint", "codespell" },
			vue = { "eslint_d", "codespell" },
			text = { "vale", "codespell" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				if vim.bo.modifiable then
				lint.try_lint()
				end
			end,
		})

		vim.keymap.set("n", "<leader>L", function()
			lint.try_lint()
		end, { desc = "[L]int for current file" })
	end,
}

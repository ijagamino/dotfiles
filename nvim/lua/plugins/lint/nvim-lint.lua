return {
	"mfussenegger/nvim-lint",

	lazy = true,
	event = {
		"BufReadPre",
		"BufNewFile",
	},

	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			lua = { "selene", "codespell" },
			javascript = { "eslint_d", "codespell" },
			typescript = { "eslint_d", "codespell" },
			php = { "php" },
			-- blade = { "tlint" },
			-- html = { "markuplint" },
			css = { "stylelint", "codespell" },
			text = { "vale", "codespell" },
		}

		-- local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			-- group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>L", function()
			lint.try_lint()
		end, { desc = "[L]int for current file" })
	end,
}

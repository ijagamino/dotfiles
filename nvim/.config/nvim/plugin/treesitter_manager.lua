vim.pack.add({
	"https://github.com/romus204/tree-sitter-manager.nvim",
})

local tsm = require("tree-sitter-manager")

tsm.setup({
	auto_install = true,
})

vim.keymap.set("n", "<leader>ut", tsm.open, { desc = "[TS] Manager" })

vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
})

require("oil").setup({})

vim.keymap.set({ "n" }, "<C-e>", function()
	vim.cmd("Oil")
end, { desc = "[Oil] File explorer" })

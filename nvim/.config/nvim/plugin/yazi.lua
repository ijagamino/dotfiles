vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/mikavilpas/yazi.nvim",
})

require("yazi").setup({})

vim.keymap.set({ "n", "v" }, "<C-e>", "<cmd>Yazi<cr>", { desc = "[Yazi] Open" })

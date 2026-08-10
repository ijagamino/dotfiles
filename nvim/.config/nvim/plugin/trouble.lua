vim.pack.add({
	"https://github.com/folke/trouble.nvim",
})

require("trouble").setup({})

local maps = {
	{
		keys = "x",
		action = "<cmd>Trouble diagnostics toggle<cr>",
		desc = "Diagnostics (Trouble)",
	},
	{
		keys = "X",
		action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
		desc = "Buffer diagnostics (Trouble)",
	},
}

for _, map in ipairs(maps) do
	vim.keymap.set("n", "<leader>" .. map.keys, map.action, { desc = "[Trouble] " .. map.desc })
end

vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/stevearc/oil.nvim",
})

function Get_oil_winbar()
	local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
	local dir = require("oil").get_current_dir(bufnr)
	if dir then
		return vim.fn.fnamemodify(dir, ":~")
	else
		-- If there is no current directory (e.g. over ssh), just show the buffer name
		return vim.api.nvim_buf_get_name(0)
	end
end

require("oil").setup({
	win_options = {
		winbar = "%!v:lua.Get_oil_winbar()",
	},
	keymaps = {
		["<C-q>"] = {
			"actions.send_to_qflist",
			mode = "x",
			desc = "Send selected files to quickfix list",
		},
	},
})

vim.keymap.set({ "n" }, "<C-e>", function()
	vim.cmd("Oil")
end, { desc = "[Oil] File explorer" })

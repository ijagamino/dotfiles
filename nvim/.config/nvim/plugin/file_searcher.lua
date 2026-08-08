vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/ibhagwan/fzf-lua",
})

local fzf = require("fzf-lua")

fzf.setup({
	keymap = {
		fzf = {
			true,
			["ctrl-q"] = "select-all+accept",
		},
	},
})

local maps = {
	{ keys = "sf", action = fzf.files, desc = "Search Files" },
	{ keys = "sq", action = fzf.quickfix, desc = "" },
	{ keys = "st", action = fzf.treesitter, desc = "" },
	{ keys = "se", action = fzf.lsp_declarations, desc = "" },
	{ keys = "ss", action = fzf.lsp_document_symbols, desc = "" },
	{ keys = "sl", action = fzf.lsp_finder, desc = "" },
	{ keys = "sg", action = fzf.live_grep_native, desc = "Live grep" },
	{ keys = "sh", action = fzf.helptags, desc = "Help tags" },
	{ keys = "sk", action = fzf.keymaps, desc = "Keymaps" },

	{ keys = "gs", action = fzf.git_status, desc = "Git status" },
	{ keys = "gf", action = fzf.git_bcommits, desc = "Git file history" },
	{ keys = "Gd", action = fzf.git_diff, desc = "Git diff" },
	{ keys = "Gh", action = fzf.git_hunks, desc = "Git hunks" },
	{ keys = "uc", action = fzf.colorschemes, desc = "Colorschemes" },
	{ keys = "uC", action = fzf.awesome_colorschemes, desc = "Awesome colorschemes" },
	{ keys = "su", action = fzf.undotree, desc = "History undo tree" },
}

for _, map in ipairs(maps) do
	vim.keymap.set("n", "<leader>" .. map.keys, map.action, { desc = "[Fzf] " .. map.desc })
end

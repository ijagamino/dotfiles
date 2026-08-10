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
	{ keys = "sw", action = fzf.grep_cword, desc = "Search word" },
	{ keys = "sq", action = fzf.quickfix, desc = "Quickfix" },
	{ keys = "st", action = fzf.treesitter, desc = "Treesitter" },
	{ keys = "se", action = fzf.lsp_declarations, desc = "LSP declarations" },
	{ keys = "ss", action = fzf.lsp_document_symbols, desc = "LSP document symbols" },
	{ keys = "sl", action = fzf.lsp_finder, desc = "LSP finder" },
	{ keys = "sg", action = fzf.live_grep_native, desc = "Live grep" },
	{ keys = "sh", action = fzf.helptags, desc = "Help tags" },
	{ keys = "sk", action = fzf.keymaps, desc = "Keymaps" },

	{ keys = "gs", action = fzf.git_status, desc = "Git status" },
	{ keys = "gf", action = fzf.git_bcommits, desc = "Git file history" },
	{ keys = "gc", action = fzf.git_commits, desc = "Git commits" },
	{ keys = "gb", action = fzf.git_blame, desc = "Git blame" },
	{ keys = "uc", action = fzf.colorschemes, desc = "Colorschemes" },
	{ keys = "uC", action = fzf.awesome_colorschemes, desc = "Awesome colorschemes" },
	{ keys = "su", action = fzf.undotree, desc = "History undo tree" },
}

for _, map in ipairs(maps) do
	vim.keymap.set("n", "<leader>" .. map.keys, map.action, { desc = "[Fzf] " .. map.desc })
end

local maps = {
	{ keys = "sf", action = "files", desc = "Search Files" },
	{ keys = "sq", action = "quickfix", desc = "" },
	{ keys = "st", action = "treesitter", desc = "" },
	{ keys = "se", action = "lsp_declarations", desc = "" },
	{ keys = "ss", action = "lsp_document_symbols", desc = "" },
	{ keys = "sl", action = "lsp_finder", desc = "" },
	{ keys = "sg", action = "live_grep_native", desc = "Live grep" },
	{ keys = "sh", action = "helptags", desc = "Help tags" },
	{ keys = "sk", action = "keymaps", desc = "Keymaps" },

	{ keys = "gs", action = "git_status", desc = "Git status" },
	{ keys = "gf", action = "git_bcommits", desc = "Git file history" },
	{ keys = "Gd", action = "git_diff", desc = "Git diff" },
	{ keys = "Gh", action = "git_hunks", desc = "Git hunks" },
	{ keys = "uc", action = "colorschemes", desc = "Colorschemes" },
	{ keys = "uC", action = "awesome_colorschemes", desc = "Awesome colorschemes" },
	{ keys = "su", action = "undotree", desc = "History undo tree" },
}

local keys = vim.tbl_map(function(map)
	return {
		"<leader>" .. map.keys,
		function()
			local fzf = require("fzf-lua")
			fzf[map.action]()
		end,
		desc = "[FZF] " .. map.desc,
	}
end, maps)

return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "nvim-mini/mini.icons" },
	---@module "fzf-lua"
	---@type fzf-lua.Config|{}
	---@diagnostic disable: missing-fields
	opts = {
		keymap = {
			fzf = {
				true,
				["ctrl-q"] = "select-all+accept",
			},
		},
	},
	keys = keys,
}

return {
	"folke/which-key.nvim",

	config = function()
		local which_key = require("which-key")

		which_key.setup({
			window = {
				border = "rounded", -- none, single, double, shadow
				position = "bottom", -- bottom, top
				margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
				padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
				zindex = 1000, -- positive value to position WhichKey above other floating windows.
			},
			layout = {
				height = { min = 4, max = 25 }, -- min and max height of the columns
				width = { min = 20, max = 50 }, -- min and max width of the columns
				spacing = 3, -- spacing between columns
			},
		})
		-- document existing key chains
		which_key.register({
			["<leader>c"] = { name = "[c]ode", _ = "which_key_ignore" },
			["<leader>d"] = { name = "[d]ebugging", _ = "which_key_ignore" },
			["<leader>g"] = { name = "[g]it", _ = "which_key_ignore" },
			["<leader>h"] = { name = "Git [h]unk", _ = "which_key_ignore" },
			["<leader>r"] = { name = "[r]ename", _ = "which_key_ignore" },
			["<leader>s"] = { name = "[s]earch", _ = "which_key_ignore" },
			["<leader>t"] = { name = "[t]oggle", _ = "which_key_ignore" },
			["<leader>w"] = { name = "[w]orkspace", _ = "which_key_ignore" },
			["<leader>n"] = { name = "Swap [n]ext", _ = "which_key_ignore" },
			["<leader>p"] = { name = "Swap [p]revious", _ = "which_key_ignore" },
			["<leader>o"] = { name = "[o]pen project", _ = "which_key_ignore" },
			["<leader>l"] = { name = "[l]SP", _ = "which_key_ignore" },
		})
		-- register which-key VISUAL mode
		-- required for visual <leader>hs (hunk stage) to work
		which_key.register({
			["<leader>"] = { name = "VISUAL <leader>" },
			["<leader>h"] = { "Git [H]unk" },
		}, { mode = "v" })
	end,
}

return {
	"folke/which-key.nvim",

	config = function()
		local which_key = require("which-key")

		which_key.setup({
			win = {
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
		which_key.add({
			{ "<leader>c", group = "[c]ode" },
			{ "<leader>c_", hidden = true },
			{ "<leader>d", group = "[d]ebugging" },
			{ "<leader>d_", hidden = true },
			{ "<leader>g", group = "[g]it" },
			{ "<leader>g_", hidden = true },
			{ "<leader>h", group = "Git [h]unk" },
			{ "<leader>h_", hidden = true },
			{ "<leader>r", group = "[r]ename" },
			{ "<leader>r_", hidden = true },
			{ "<leader>s", group = "[s]earch" },
			{ "<leader>s_", hidden = true },
			{ "<leader>t", group = "[t]oggle" },
			{ "<leader>t_", hidden = true },
			{ "<leader>w", group = "[w]orkspace" },
			{ "<leader>w_", hidden = true },
			{ "<leader>n", group = "Swap [n]ext" },
			{ "<leader>n_", hidden = true },
			{ "<leader>p", group = "Swap [p]revious" },
			{ "<leader>p_", hidden = true },
			{ "<leader>o", group = "[o]pen project" },
			{ "<leader>o_", hidden = true },
			{ "<leader>l", group = "[l]SP" },
			{ "<leader>l_", hidden = true },
		})
		-- register which-key VISUAL mode
		-- required for visual <leader>hs (hunk stage) to work
		which_key.add({
			{ "<leader>", group = "VISUAL <leader>", mode = "v" },
			{ "<leader>h", desc = "Git [H]unk", mode = "v" },
		})
	end,
}

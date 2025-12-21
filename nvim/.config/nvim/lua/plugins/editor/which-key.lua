return {
	"folke/which-key.nvim",

	event = "VimEnter",

	opts = {
		win = {
			border = "single", -- none, single, double, shadow
			-- position = "bottom", -- bottom, top
			-- margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
			-- padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
			zindex = 1000, -- positive value to position WhichKey above other floating windows.
		},
		layout = {
			height = { min = 4, max = 25 }, -- min and max height of the columns
			width = { min = 20, max = 50 }, -- min and max width of the columns
			spacing = 3, -- spacing between columns
		},
		--      -- delay between pressing a key and opening which-key (milliseconds)
		-- this setting is independent of vim.o.timeoutlen
		delay = 0,
		icons = {
			-- set icon mappings to true if you have a Nerd Font
			mappings = vim.g.have_nerd_font,
			-- If you are using a Nerd Font: set icons.keys to an empty table which will use the
			-- default which-key.nvim defined Nerd Font icons, otherwise define a string table
			keys = vim.g.have_nerd_font and {} or {
				Up = "<Up> ",
				Down = "<Down> ",
				Left = "<Left> ",
				Right = "<Right> ",
				C = "<C-…> ",
				M = "<M-…> ",
				D = "<D-…> ",
				S = "<S-…> ",
				CR = "<CR> ",
				Esc = "<Esc> ",
				ScrollWheelDown = "<ScrollWheelDown> ",
				ScrollWheelUp = "<ScrollWheelUp> ",
				NL = "<NL> ",
				BS = "<BS> ",
				Space = "<Space> ",
				Tab = "<Tab> ",
				F1 = "<F1>",
				F2 = "<F2>",
				F3 = "<F3>",
				F4 = "<F4>",
				F5 = "<F5>",
				F6 = "<F6>",
				F7 = "<F7>",
				F8 = "<F8>",
				F9 = "<F9>",
				F10 = "<F10>",
				F11 = "<F11>",
				F12 = "<F12>",
			},
		},
	},

	spec = {
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
		{ "<leader>", group = "VISUAL <leader>", mode = "v" },
		{ "<leader>h", desc = "Git [H]unk", mode = "v" },
	},
}

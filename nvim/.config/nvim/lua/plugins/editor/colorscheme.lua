return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,

	lazy = false,

	config = function()
		local catppuccin = require("catppuccin")

		catppuccin.setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			transparent_background = true, -- disables setting the background color.
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.2, -- percentage of the shade to apply to the inactive window
			},
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = false, -- Force no underline
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},
			color_overrides = {},
			custom_highlights = {},
			integrations = {
				aerial = true,
				alpha = true,
				cmp = true,
				-- dap = true,
				-- dap_ui = true,
				fidget = true,
				gitsigns = true,
				harpoon = true,
				headlines = true,
				illuminate = {
					enabled = true,
					lsp = true,
				},
				indent_blankline = {
					enabled = true,
					colored_indent_levels = true,
				},
				neotree = true,
				nvimtree = true,
				treesitter = true,
				treesitter_context = true,
				telescope = true,
				which_key = true,
			},
		})

		-- setup must be called before loading
		vim.cmd.colorscheme("catppuccin")
		vim.api.nvim_set_hl(0, "LineNr", { fg = "#ced7f2" })
	end,
}

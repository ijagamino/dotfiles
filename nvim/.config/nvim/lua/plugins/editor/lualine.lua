return {
	-- Set lualine as statusline
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	-- See `:help lualine.txt`
	config = function()
		local lualine = require("lualine")
		-- local noice = require("noice")

		lualine.setup({
			options = {
				icons_enabled = true,
				-- globalstatus = true,
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							return str:sub(1, 1)
						end,
					},
				},
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "filetype" },
				lualine_y = {},
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "filetype " },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}

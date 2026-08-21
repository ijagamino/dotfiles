vim.pack.add({
	"https://github.com/catgoose/nvim-colorizer.lua",
})

require("colorizer").setup({
	options = {
		parsers = {
			rgb = {
				enable = true,
			},
			hsl = {
				enable = true,
			},
			oklch = {
				enable = true,
			},
			css_color = {
				enable = true,
			},
			tailwind = {
				enable = true,
			},
			sass = {
				enable = true,
			},
			css_var_rgb = {
				enable = true,
			},
			css_var = {
				enable = true,
			},
		},
	},
})

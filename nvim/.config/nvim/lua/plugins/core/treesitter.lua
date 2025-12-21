return {
	-- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		-- Add languages to be installed here that you want installed for treesitter
		ensure_installed = {
			"bash",
			"c",
			"diff",
			"html",
			"http",
			"ini",
			"javascript",
			"json",
			"jsonc",
			"latex",
			"lua",
			"luadoc",
			"make",
			"markdown",
			"markdown_inline",
			"php",
			"phpdoc",
			"python",
			"regex",
			"rust",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		},

		-- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
		auto_install = true,
		-- Install languages synchronously (only applied to `ensure_installed`)
		-- sync_install = false,
		-- List of parsers to ignore installing
		-- ignore_install = {},
		-- You can specify additional Treesitter modules here: -- For example: -- playground = {--enable = true,-- },
		-- modules = {},
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = { "ruby" },
		},
		indent = {
			enable = true,
			disable = { "ruby" },
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-s>",
				node_incremental = "<C-s>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
	},
}

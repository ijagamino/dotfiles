return {
	"coffebar/neovim-project",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"Shatur/neovim-session-manager",
	},

	lazy = false,
	priority = 100,

	opts = {
		projects = {
			-- Files in telescope are listed in order below
			"~/AppData/Local/nvim",
			"~/OneDrive/Udemy/*/*",
			"~/OneDrive/University/*year*/*/*/*",
			"~/Projects/*",
			"C:/laragon/www/*",
		},
	},

	init = function()
		-- Enable saving the state of plugins in the session
		vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
		vim.keymap.set("n", "<leader>od", ":Telescope neovim-project discover<CR>", { desc = "[d]iscover projects" })
		vim.keymap.set("n", "<leader>or", ":Telescope neovim-project history<CR>", { desc = "[r]ecent projects" })
	end,
}

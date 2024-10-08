return {
	"Shatur/neovim-session-manager",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	opts = {
		vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			callback = function()
				for _, buf in ipairs(vim.api.nvim_list_bufs()) do
					-- Don't save while there's any 'nofile' buffer open.
					if vim.api.nvim_get_option_value("buftype", { buf = buf }) == "nofile" then
						return
					end
				end
				require("session_manager").save_current_session()
			end,
		}),
	},

	config = function()
		local session_manager = require("session_manager")

		session_manager.setup({})
	end,
}

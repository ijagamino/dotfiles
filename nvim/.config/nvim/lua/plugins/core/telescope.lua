return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- Fuzzy Finder Algorithm which requires local dependencies to be built.
		-- Only load if `make` is available. Make sure you have the system
		-- requirements installed.
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			-- NOTE: If you are having trouble with this installation,
			--       refer to the README for telescope-fzf-native for more instructions.
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},

	event = "VimEnter",

	config = function()
		-- [[ Configure Telescope ]]
		-- See `:help telescope` and `:help telescope.setup()`
		local telescope = require("telescope")
		local telescope_builtin = require("telescope.builtin")

		telescope.setup({
			-- defaults = {
			-- 	mappings = {
			-- 		i = {
			-- 			["<C-u>"] = false,
			-- 			["<C-d>"] = false,
			-- 		},
			-- 	},
			-- },
			extensions = {
				-- fzf = {
				-- 	fuzzy = true,
				-- 	override_generic_sorter = true,
				-- 	override_file_sorter = true,
				-- 	case_mode = "smart_case",
				-- },
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		-- Enable telescope fzf native, if installed
		pcall(telescope.load_extension, "fzf")
		pcall(telescope.load_extension, "ui-select")

		local function telescope_live_grep_open_files()
			telescope_builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end

		local function fzf_current_buffer()
			-- You can pass additional configuration to telescope to change theme, layout, etc.
			telescope_builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end

		-- See `:help telescope.builtin`
		vim.keymap.set("n", "<leader>sh", telescope_builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", telescope_builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>sf", telescope_builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>ss", telescope_builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		vim.keymap.set("n", "<leader>sw", telescope_builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sg", telescope_builtin.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sd", telescope_builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", telescope_builtin.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader>st", telescope_builtin.treesitter, { desc = "[S]earch [T]reesitter" })
		vim.keymap.set("n", "<leader>s.", telescope_builtin.oldfiles, { desc = "[S]earch [.] recent files" })
		vim.keymap.set("n", "<leader>s<space>", telescope_builtin.buffers, { desc = "[S]earch [ ] existing buffers" })
		vim.keymap.set("n", "<leader>sn", function()
			telescope_builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })
		vim.keymap.set("n", "<leader>/", fzf_current_buffer, { desc = "[/] Fuzzily search in current buffer" })
		vim.keymap.set("n", "<leader>s/", telescope_live_grep_open_files, { desc = "[S]earch [/] in open files" })
		-- vim.keymap.set(
		-- 	"n",
		-- 	"<leader>sn",
		-- 	telescope.extensions.notify.notify,
		-- 	{ desc = "Search [n]otification history" }
		-- )
	end,
}

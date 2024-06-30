return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
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
	},

	config = function()
		-- [[ Configure Telescope ]]
		-- See `:help telescope` and `:help telescope.setup()`
		local telescope = require("telescope")
		local telescope_builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-u>"] = false,
						["<C-d>"] = false,
					},
				},
			},
			extension = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})

		-- Enable telescope fzf native, if installed
		pcall(telescope.load_extension, "fzf")

		-- Telescope live_grep in git root
		-- Function to find the git root directory based on the current buffer's path
		local function find_git_root()
			-- Use the current buffer's path as the starting point for the git search
			local current_file = vim.api.nvim_buf_get_name(0)
			local current_dir
			local cwd = vim.fn.getcwd()
			-- If the buffer is not associated with a file, return nil
			if current_file == "" then
				current_dir = cwd
			else
				-- Extract the directory from the current file's path
				current_dir = vim.fn.fnamemodify(current_file, ":h")
			end

			-- Find the Git root directory from the current file's path
			local git_root =
				vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
			if vim.v.shell_error ~= 0 then
				print("Not a git repository. Searching on current working directory")
				return cwd
			end
			return git_root
		end

		-- Custom live_grep function to search in git root
		local function live_grep_git_root()
			local git_root = find_git_root()
			if git_root then
				telescope_builtin.live_grep({
					search_dirs = { git_root },
				})
			end
		end
		vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})

		local function telescope_live_grep_open_files()
			telescope_builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end

		local function fzf_current_buffer()
			-- You can pass additional configuration to telescope to change theme, layout, etc.
			telescope_builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 0,
				previewer = false,
			}))
		end

		-- See `:help telescope.builtin`
		vim.keymap.set("n", "<leader>?", telescope_builtin.oldfiles, { desc = "Find recently opened files" })
		vim.keymap.set("n", "<leader>s<space>", telescope_builtin.buffers, { desc = "Find existing buffers" })
		vim.keymap.set("n", "<leader>/", fzf_current_buffer, { desc = "[/] Fuzzily search in current buffer" })
		vim.keymap.set("n", "<leader>s/", telescope_live_grep_open_files, { desc = "Search in open files" })
		vim.keymap.set("n", "<leader>ss", telescope_builtin.builtin, { desc = "Search [s]elect Telescope" })
		vim.keymap.set("n", "<leader>sa", telescope_builtin.git_files, { desc = "Search git files" })
		vim.keymap.set("n", "<leader>sf", telescope_builtin.find_files, { desc = "Search [f]iles" })
		vim.keymap.set("n", "<leader>sh", telescope_builtin.help_tags, { desc = "Search [h]elp" })
		vim.keymap.set("n", "<leader>sw", telescope_builtin.grep_string, { desc = "Search current [w]ord" })
		vim.keymap.set("n", "<leader>sg", telescope_builtin.live_grep, { desc = "Search by [g]rep" })
		vim.keymap.set("n", "<leader>sG", ":LiveGrepGitRoot<cr>", { desc = "Search by [G]rep on Git Root" })
		vim.keymap.set("n", "<leader>sd", telescope_builtin.diagnostics, { desc = "Search [d]iagnostics" })
		vim.keymap.set("n", "<leader>sr", telescope_builtin.resume, { desc = "Search [r]esume" })
		vim.keymap.set("n", "<leader>st", telescope_builtin.treesitter, { desc = "Search [t]reesitter" })
		-- vim.keymap.set(
		-- 	"n",
		-- 	"<leader>sn",
		-- 	telescope.extensions.notify.notify,
		-- 	{ desc = "Search [n]otification history" }
		-- )
	end,
}

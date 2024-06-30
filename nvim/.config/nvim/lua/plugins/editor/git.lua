return {
	-- Git related plugins
	-- Adds git related signs to the gutter, as well as utilities for managing changes
	"lewis6991/gitsigns.nvim",
	dependencies = {
		"tpope/vim-fugitive",
		"tpope/vim-rhubarb",
	},

	event = {
		"BufReadPre",
		"BufNewFile",
	},

	config = function()
		local gitsigns = require("gitsigns")
		gitsigns.setup({
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map({ "n", "v" }, "]h", function()
					if vim.wo.diff then
						return "]h"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, desc = "Jump to next [h]unk" })

				map({ "n", "v" }, "[h", function()
					if vim.wo.diff then
						return "[h"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, desc = "Jump to previous [h]unk" })

				-- Actions
				-- visual mode
				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "stage git hunk" })
				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "reset git hunk" })
				-- normal mode
				map("n", "<leader>hs", gs.stage_hunk, { desc = "[s]tage hunk" })
				map("n", "<leader>hr", gs.reset_hunk, { desc = "[r]eset hunk" })
				map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "[u]ndo stage hunk" })
				map("n", "<leader>hS", gs.stage_buffer, { desc = " [S]tage buffer" })
				map("n", "<leader>hR", gs.reset_buffer, { desc = " [R]eset buffer" })
				map("n", "<leader>hp", gs.preview_hunk, { desc = "[p]review hunk" })
				map("n", "<leader>hb", function()
					gs.blame_line({ full = false })
				end, { desc = "[b]lame line" })
				map("n", "<leader>hd", gs.diffthis, { desc = "[d]iff against index" })
				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end, { desc = "[D]iff against last commit" })

				-- Toggles
				map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle [b]lame line" })
				map("n", "<leader>td", gs.toggle_deleted, { desc = "Toggle show [d]eleted" })

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select git hunk" })
			end,
		})

		vim.keymap.set("n", "<leader>gs", ":G<CR>", { desc = "Git [s]tatus" })
		vim.keymap.set("n", "<leader>gl", ":G log<CR>", { desc = "Git [l]og" })
		vim.keymap.set("n", "<leader>gb", ":G blame<CR>", { desc = "Git [b]lame" })
		vim.keymap.set("n", "<leader>gp", ":G push<CR>", { desc = "Git [p]ush" })
		vim.keymap.set("n", "<leader>gP", ":G pull --rebase<CR>", { desc = "Git [P]ull Rebase" })
		vim.keymap.set("n", "<leader>gd", ":Gcd<CR>", { desc = "Git [d]irectory" })
	end,
}

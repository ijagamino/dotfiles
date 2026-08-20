vim.pack.add({
	"https://github.com/folke/sidekick.nvim",
})

require("sidekick").setup({})

local maps = {
	{
		keys = "<tab>",
		action = function()
			-- if there is a next edit, jump to it, otherwise apply it if any
			if not require("sidekick").nes_jump_or_apply() then
				return "<Tab>" -- fallback to normal tab
			end
		end,
		expr = true,
		desc = "Goto/Apply Next Edit Suggestion",
	},
	{
		keys = "<C-.>",
		action = function()
			require("sidekick.cli").focus()
		end,
		desc = "Focus",
		mode = { "n", "t", "i", "x" },
	},
	{
		keys = "<leader>qa",
		action = function()
			require("sidekick.cli").toggle()
		end,
		desc = "Toggle CLI",
	},
	{
		keys = "<leader>qs",
		action = function()
			require("sidekick.cli").select()
		end,
		-- Or to select only installed tools:
		-- require("sidekick.cli").select({ filter = { installed = true } })
		desc = "Select CLI",
	},
	{
		keys = "<leader>qd",
		action = function()
			require("sidekick.cli").close()
		end,
		desc = "Detach a CLI Session",
	},
	{
		keys = "<leader>qt",
		action = function()
			require("sidekick.cli").send({ msg = "{this}" })
		end,
		mode = { "x", "n" },
		desc = "Send This",
	},
	{
		keys = "<leader>qf",
		action = function()
			require("sidekick.cli").send({ msg = "{file}" })
		end,
		desc = "Send File",
	},
	{
		keys = "<leader>qv",
		action = function()
			require("sidekick.cli").send({ msg = "{selection}" })
		end,
		mode = { "x" },
		desc = "Send Visual Selection",
	},
	{
		keys = "<leader>qp",
		action = function()
			require("sidekick.cli").prompt()
		end,
		mode = { "n", "x" },
		desc = "Select Prompt",
	},
	-- Example of a keybinding to open Claude directly
	{
		keys = "<leader>qc",
		action = function()
			require("sidekick.cli").toggle({ name = "claude", focus = true })
		end,
		desc = "Toggle Claude",
	},
}

for _, map in ipairs(maps) do
	local mode = map.mode or "n"
	vim.keymap.set(mode, map.keys, map.action, { desc = "[Sidekick] " .. map.desc })
end

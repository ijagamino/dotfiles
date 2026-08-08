local wezterm = require("wezterm")
local sessionizer = wezterm.plugin.require("https://github.com/mikkasendke/sessionizer.wezterm")

local M = {}

function M.setup(opts)
	opts = opts or {}
	local config = opts.config

	local schema = {
		sessionizer.DefaultWorkspace({}),

		sessionizer.FdSearch(wezterm.home_dir .. "/personal"),
		sessionizer.FdSearch(wezterm.home_dir .. "/work"),
		sessionizer.FdSearch(wezterm.home_dir .. "/dotfiles"),

		processing = sessionizer.for_each_entry(function(entry)
			entry.label = entry.label:gsub(wezterm.home_dir, "~")
		end),
	}

	table.insert(config.keys, {
		mods = "LEADER",
		key = "f",
		action = sessionizer.show(schema),
	})
end

return M

local wezterm = require("wezterm")
local domains = wezterm.plugin.require("https://github.com/DavidRR-F/quick_domains.wezterm")

local M = {}

function M.setup(opts)
	opts = opts or {}
	local config = opts.config

	domains.apply_to_config(config, {
		keys = {
			attach = {
				mods = "LEADER",
				key = "s",
			},
		},
	})
end

return M

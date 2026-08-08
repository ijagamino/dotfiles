local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "pwsh" }
end

require("config.keybinds").setup({ config = config })
require("config.display").setup({ config = config })
require("plugins.sessionizer").setup({ config = config })
require("plugins.quick_domains").setup({ config = config })

return config

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

local act = wezterm.action

-- This is where you actually apply your config choices
-- Conditional based on OS
-- Uses powershell on windows
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "powershell.exe" }
end

-- Wezterm window configuration
config.window_decorations = "RESIZE"
config.enable_tab_bar = false

-- Wezterm font configuration
config.font = wezterm.font("JetBrains Mono")
config.font_size = 16

-- Color scheme configuration
config.color_scheme = "Catppuccin Mocha"

-- Keybinding configuration
config.keys = {
	-- Pane control
	{
		key = "w",
		mods = "ALT",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "o",
		mods = "ALT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "v",
		mods = "ALT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	-- Pane movement
	{
		key = "j",
		mods = "ALT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "k",
		mods = "ALT",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "h",
		mods = "ALT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "ALT",
		action = act.ActivatePaneDirection("Right"),
	},
}
-- and finally, return the configuration to wezterm
return config

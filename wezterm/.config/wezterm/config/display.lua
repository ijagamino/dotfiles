local wezterm = require("wezterm")
local M = {}

function M.setup(opts)
	opts = opts or {}
	local config = opts.config

	config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
	config.color_scheme = "luna"
	config.font_size = 14.0
	config.enable_tab_bar = true
	config.use_fancy_tab_bar = false

	local function tab_title(tab_info)
		local title = tab_info.tab_title
		-- if the tab title is explicitly set, take that
		if title and #title > 0 then
			return title
		end
		-- Otherwise, use the title from the active pane in that tab
		return tab_info.active_pane.title
	end

	wezterm.on("format-tab-title", function(tab, _, _, _, _, max_width)
		-- Determine the surrounding characters based on tab state
		local start_char = tab.is_active and " [" or " ("
		local end_char = tab.is_active and "] " or ") "

		-- Construct the title with the dynamic wrapping characters
		local title = start_char .. tab.tab_index + 1 .. end_char .. tab_title(tab)
		title = wezterm.truncate_right(title, max_width)

		return {
			{ Text = title },
		}
	end)

	wezterm.on("update-status", function(window)
		-- Get current date and time
		local date = wezterm.strftime("%Y-%m-%d")
		local time = wezterm.strftime("%H:%M")
		local host = wezterm.hostname()
		local workspace = window:active_workspace()

		window:set_left_status(wezterm.format({
			{ Background = { Color = "#1c1c1c" } },
			{ Foreground = { Color = "#e4e4e8" } },
			{ Text = " " .. workspace .. " " },
		}))

		-- Set right status with custom colors
		window:set_right_status(wezterm.format({
			{ Foreground = { Color = "#9eb38e" } },
			{ Text = host },
			{ Foreground = { Color = "#e4e4e8" } },
			{ Text = " " .. time },
			{ Foreground = { Color = "#75a1c7" } },
			{ Text = " " .. date .. " " },
		}))
	end)

	return {}
end

return M

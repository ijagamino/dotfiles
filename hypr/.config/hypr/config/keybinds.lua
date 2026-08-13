local M = {}

function M.setup(opts)
	opts = opts or {}
	local main_mod = opts.mainmod or "SUPER"
	local terminal = opts.terminal or "kitty"
	local file_manager = opts.file_manager or "dolphin"
	local menu = opts.menu or "hyprlauncher"

	-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
	hl.bind(main_mod .. " + RETURN", hl.dsp.exec_cmd(terminal))
	hl.bind(main_mod .. "+ SHIFT + Q", hl.dsp.window.close())
	hl.bind(
		main_mod .. " + SHIFT + E",
		hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
	)
	hl.bind(main_mod .. " + f", hl.dsp.window.fullscreen({action = "toggle"}))
	hl.bind(main_mod .. " + e", hl.dsp.exec_cmd(file_manager))
	hl.bind(main_mod .. " + v", hl.dsp.window.float({ action = "toggle" }))
	hl.bind(main_mod .. " + d", hl.dsp.exec_cmd(menu))
	hl.bind(main_mod .. " + p", hl.dsp.window.pseudo())
	hl.bind(main_mod .. " + t", hl.dsp.layout("togglesplit")) -- dwindle only

	-- Move focus with mainMod + arrow keys
	hl.bind(main_mod .. " + h", hl.dsp.focus({ direction = "left" }))
	hl.bind(main_mod .. " + l", hl.dsp.focus({ direction = "right" }))
	hl.bind(main_mod .. " + j", hl.dsp.focus({ direction = "up" }))
	hl.bind(main_mod .. " + k", hl.dsp.focus({ direction = "down" }))

	-- Switch workspaces with mainMod + [0-9]
	-- Move active window to a workspace with mainMod + SHIFT + [0-9]
	for i = 1, 10 do
		local key = i % 10 -- 10 maps to key 0
		hl.bind(main_mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
		hl.bind(main_mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
	end

	-- Example special workspace (scratchpad)
	hl.bind(main_mod .. " + S", hl.dsp.workspace.toggle_special("magic"))
	hl.bind(main_mod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

	-- Scroll through existing workspaces with mainMod + scroll
	hl.bind(main_mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
	hl.bind(main_mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

	-- Move/resize windows with mainMod + LMB/RMB and dragging
	hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
	hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

	-- Laptop multimedia keys for volume and LCD brightness
	hl.bind(
		"XF86AudioRaiseVolume",
		hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
		{ locked = true, repeating = true }
	)
	hl.bind(
		"XF86AudioLowerVolume",
		hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
		{ locked = true, repeating = true }
	)
	hl.bind(
		"XF86AudioMute",
		hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
		{ locked = true, repeating = true }
	)
	hl.bind(
		"XF86AudioMicMute",
		hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
		{ locked = true, repeating = true }
	)
	hl.bind(
		"XF86MonBrightnessUp",
		hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
		{ locked = true, repeating = true }
	)
	hl.bind(
		"XF86MonBrightnessDown",
		hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
		{ locked = true, repeating = true }
	)

	-- Requires playerctl
	hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
	hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
	hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
	hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
end

return M

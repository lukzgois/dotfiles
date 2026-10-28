hl.bind("SUPER + return", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind(
	"SUPER + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit")
)
hl.bind("SUPER + E", hl.dsp.exec_cmd("thunar"))
hl.bind("SUPER + V", hl.dsp.window.float())
hl.bind("SUPER + D", hl.dsp.exec_cmd("~/.config/rofi/launchers/type-4/launcher.sh"))
hl.bind("SUPER + N", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind("SUPER + P", hl.dsp.exec_cmd("hyprshot -m output -o /home/palmas/Pictures/Screenshots"))
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
hl.bind("SUPER + CTRL + P", hl.dsp.exec_cmd("hyprshot -m window -o ~/Pictures/Screenshots"))
hl.bind("SUPER + ALT + P", hl.dsp.exec_cmd("hyprpicker -a, "))
hl.bind("SUPER + B", hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))
hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))

hl.bind("SUPER + f", hl.dsp.window.fullscreen({ action = "toggle" }))

hl.bind("SUPER + r", hl.dsp.layout("colresize +conf"))
hl.bind("SUPER + h", hl.dsp.layout("focus left"))
hl.bind("SUPER + l", hl.dsp.layout("focus right"))
hl.bind("SUPER + CTRL + l", hl.dsp.layout("swapcol r"))
hl.bind("SUPER + CTRL + h", hl.dsp.layout("swapcol l"))

local ws_map = {
	["1"] = "1",
	["2"] = "2",
	["3"] = "3",
	["4"] = "4",
	["5"] = "5",
	["6"] = "6",
	["7"] = "7",
	["8"] = "8",
	["9"] = "9",
	["0"] = "10",
}

-- Focus workspaces
for key, ws in pairs(ws_map) do
	hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = ws }))
end

-- Move windows to workspaces
for key, ws in pairs(ws_map) do
	hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = ws, follow = true }))
end
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special(""))
hl.bind(
	"SUPER + SHIFT + S",
	hl.dsp.window.move({
		workspace = "special",
		follow = true,
	})
)
hl.bind(
	"SUPER + mouse_down",
	hl.dsp.focus({
		workspace = "e+1",
	})
)
hl.bind(
	"SUPER + mouse_up",
	hl.dsp.focus({
		workspace = "e-1",
	})
)

hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
hl.bind("SUPER + mouse:273", hl.dsp.window.resize())
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), {
	repeating = true,
	locked = true,
})
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), {
	repeating = true,
	locked = true,
})
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), {
	repeating = true,
	locked = true,
})
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), {
	repeating = true,
	locked = true,
})
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), {
	repeating = true,
	locked = true,
})
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), {
	repeating = true,
	locked = true,
})
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), {
	locked = true,
})
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), {
	locked = true,
})
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), {
	locked = true,
})
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), {
	locked = true,
})

hl.bind("CTRL + SHIFT + l", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle_layout.sh"))

hl.bind("SUPER + g", hl.dsp.submap("cursor"))
hl.define_submap("cursor", function()
	hl.bind(
		"a",
		hl.dsp.exec_cmd("hyprctl dispatch submap reset && wl-kbptr -o modes=bisect && hyprctl dispatch submap cursor")
	)
	hl.bind(
		"s",
		hl.dsp.exec_cmd("hyprctl dispatch submap reset && wl-kbptr -o modes=split && hyprctl dispatch submap cursor")
	)
	hl.bind(
		"d",
		hl.dsp.exec_cmd(
			"hyprctl dispatch submap reset && wl-kbptr -o modes=floating, click -o mode_floating.source=detect && hyprctl dispatch submap cursor"
		)
	)
	hl.bind("left", hl.dsp.exec_cmd("ydotool mousemove -- -20 0"), {
		repeating = true,
		locked = true,
	})
	hl.bind("right", hl.dsp.exec_cmd("ydotool mousemove -- 20 0"), {
		repeating = true,
		locked = true,
	})
	hl.bind("down", hl.dsp.exec_cmd("ydotool mousemove -- 0 20"), {
		repeating = true,
		locked = true,
	})
	hl.bind("up", hl.dsp.exec_cmd("ydotool mousemove -- 0 -20"), {
		repeating = true,
		locked = true,
	})
	hl.bind("CTRL + left", hl.dsp.exec_cmd("ydotool mousemove -- -60 0"), {
		repeating = true,
		locked = true,
	})
	hl.bind("CTRL + right", hl.dsp.exec_cmd("ydotool mousemove -- 60 0"), {
		repeating = true,
		locked = true,
	})
	hl.bind("CTRL + down", hl.dsp.exec_cmd("ydotool mousemove -- 0 60"), {
		repeating = true,
		locked = true,
	})
	hl.bind("CTRL + up", hl.dsp.exec_cmd("ydotool mousemove -- 0 -60"), {
		repeating = true,
		locked = true,
	})
	hl.bind("SHIFT + left", hl.dsp.exec_cmd("ydotool mousemove -- -5 0"), {
		repeating = true,
		locked = true,
	})
	hl.bind("SHIFT + right", hl.dsp.exec_cmd("ydotool mousemove -- 5 0"), {
		repeating = true,
		locked = true,
	})
	hl.bind("SHIFT + down", hl.dsp.exec_cmd("ydotool mousemove -- 0 5"), {
		repeating = true,
		locked = true,
	})
	hl.bind("SHIFT + up", hl.dsp.exec_cmd("ydotool mousemove -- 0 -5"), {
		repeating = true,
		locked = true,
	})
	hl.bind("g", hl.dsp.exec_cmd("ydotool click 0xC0"))
	hl.bind("b", hl.dsp.exec_cmd("ydotool click 0xC2"))
	hl.bind("h", hl.dsp.exec_cmd("ydotool click 0xC1"))
	hl.bind("e", hl.dsp.exec_cmd("wlrctl pointer scroll 10 0"), {
		repeating = true,
	})
	hl.bind("r", hl.dsp.exec_cmd("wlrctl pointer scroll -10 0"), {
		repeating = true,
	})
	hl.bind("t", hl.dsp.exec_cmd("wlrctl pointer scroll 0 -10"), {
		repeating = true,
	})
	hl.bind("g", hl.dsp.exec_cmd("wlrctl pointer scroll 0 10"), {
		repeating = true,
	})

	hl.bind("escape", hl.dsp.submap("reset"))
end)

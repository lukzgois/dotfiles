hl.config({
	general = {
		gaps_in = 6,
		gaps_out = 4,
		border_size = 2,
		col = {
			active_border = {
				colors = {
					"rgba(33ccffee)",
					"rgba(00ff99ee)",
				},
				angle = 45,
			},
			inactive_border = "rgba(595959aa)",
		},
		resize_on_border = false,
		allow_tearing = false,
		layout = "scrolling",
	},
})
hl.config({
	decoration = {
		rounding = 12,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},
		blur = {
			enabled = true,
			ignore_opacity = false,
			size = 10,
			passes = 3,
			contrast = 2,
			new_optimizations = true,
			vibrancy = 0.5,
		},
	},
})

hl.config({
	animations = {
		enabled = true,
	},
})
hl.config({
	dwindle = {
		preserve_split = true,
	},
})
hl.config({
	master = {
		new_status = "master",
	},
})
hl.config({
	misc = {
		force_default_wallpaper = -1,
		disable_hyprland_logo = false,
	},
})

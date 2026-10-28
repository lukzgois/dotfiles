hl.config({
	input = {
		kb_layout = "us,us",
		kb_variant = ",altgr-intl",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		repeat_rate = 45,
		repeat_delay = 300,
		follow_mouse = 0,
		sensitivity = -0.65,
		touchpad = {
			natural_scroll = true,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

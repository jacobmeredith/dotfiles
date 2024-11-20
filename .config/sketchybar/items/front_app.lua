local colors = require("colors")
local settings = require("settings")

local front_app = sbar.add("item", "front_app", {
	display = "active",
	icon = { drawing = false },
	label = {
		padding_left = 5,
		padding_right = 5,
		color = colors.catppuccin.peach,
		font = {
			style = settings.font.style_map["Bold"],
			size = 12.0,
		},
	},
	background = {
		height = 25,
		corner_radius = 100,
		border_width = 1,
		border_color = colors.catppuccin.lavender,
	},
	updates = true,
})

front_app:subscribe("front_app_switched", function(env)
	front_app:set({ label = { string = env.INFO } })
end)

front_app:subscribe("mouse.clicked", function(env)
	sbar.trigger("swap_menus_and_spaces")
end)

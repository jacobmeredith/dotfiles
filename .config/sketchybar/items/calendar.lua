local settings = require("settings")
local colors = require("colors")

-- Padding item required because of bracket
sbar.add("item", { position = "right", width = settings.group_paddings })

local cal = sbar.add("item", {
	icon = {
		color = colors.catppuccin.text,
		padding_left = 8,
		font = {
			style = settings.font.style_map["Black"],
			size = 12.0,
		},
	},
	label = {
		color = colors.catppuccin.text,
		padding_right = 8,
		width = 49,
		align = "right",
		font = {
			size = 12.0,
		},
	},
	position = "right",
	update_freq = 30,
	padding_left = 1,
	padding_right = 1,
	background = {
		border_width = 1,
	},
})

cal:subscribe({ "forced", "routine", "system_woke" }, function(env)
	cal:set({ icon = os.date("%a. %d %b."), label = os.date("%H:%M") })
end)

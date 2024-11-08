local colors = require("colors")
local icons = require("icons")
local settings = require("settings")

local steps = 5
local circles = {}
local circles_names = {}
local muted = false

for i = steps, 1, -1 do
	local volume = math.ceil((100 / steps) * i)

	local volume_circle = sbar.add("item", "widgets.volume" .. i, {
		position = "right",
		width = 15,
		icon = { drawing = false },
		background = {
			height = 15,
			color = colors.catppuccin.surface0,
		},
		click_script = 'osascript -e "set volume output volume ' .. volume .. '"',
	})

	sbar.add("item", "widgets.volume.padding." .. i, { volume_circle.name }, {
		position = "right",
		width = 3,
	})

	circles_names[i] = volume_circle.name
	circles[i] = volume_circle
end

local volume_icon = sbar.add("item", "widgets.volume.icon", {
	position = "right",
	padding_right = 5,
	padding_left = -1,
	icon = {
		string = icons.volume._100,
		width = 0,
		align = "left",
		color = colors.grey,
		font = {
			style = settings.font.style_map["Regular"],
			size = 14.0,
		},
		border_width = 1,
		border_color = colors.catppuccin.pink,
	},
	label = {
		width = 25,
		align = "left",
		font = {
			style = settings.font.style_map["Regular"],
			size = 14.0,
		},
	},
})

volume_icon:subscribe("mouse.clicked", function()
	muted = not muted

	sbar.exec('osascript -e "set volume output muted not (output muted of (get volume settings))"')

	if muted then
		volume_icon:set({ icon = icons.volume._0 })
	end

	if not muted then
		volume_icon:set({ icon = icons.volume._100 })
	end
end)

local bracket_items = circles_names
bracket_items[6] = volume_icon.name

sbar.add("bracket", "widgets.volume.bracket", bracket_items, {
	position = "right",
	icon = { drawing = false },
	label = { drawing = false },
	background = {
		color = colors.catppuccin.base,
	},
})

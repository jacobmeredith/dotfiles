local colors = require("colors")
local icons = require("icons")
local settings = require("settings")
local app_icons = require("helpers.app_icons")

local spaces_colours = {
	colors.catppuccin.pink,
	colors.catppuccin.mauve,
	colors.catppuccin.red,
	colors.catppuccin.maroon,
	colors.catppuccin.peach,
	colors.catppuccin.yellow,
}

local spaces = {}

local show_apps = function(space_id)
	local get_windows = string.format("aerospace list-windows --workspace %s --format '%%{app-name}'", space_id)
	sbar.exec(get_windows, function(open_windows)
		local apps = {}
		for line in open_windows:gmatch("([^\n]*)\n?") do
			if line ~= "" then
				table.insert(apps, line)
			end
		end

		local icon_line = ""
		local no_app = true
		for _, app in ipairs(apps) do
			no_app = false
			local lookup = app_icons[app]
			local icon = ((lookup == nil) and app_icons["default"] or lookup)
			icon_line = icon_line .. " " .. icon
		end

		if no_app then
			icon_line = " —"
		end

		sbar.animate("tanh", 10, function()
			local space = spaces[space_id]
			if space ~= nil then
				spaces[space_id]:set({ label = icon_line })
			end
		end)
	end)
end

for i = 1, 6, 1 do
	local space = sbar.add("item", "space." .. i, {
		padding_right = 1,
		padding_left = 1,
		width = 15,
		background = {
			height = 15,
			corner_radius = 100,
			color = spaces_colours[i],
			border_width = 1,
		},
		popup = { background = { border_width = 5, border_color = colors.black } },
	})

	spaces[i] = space

	-- Single item bracket for space items to achieve double border on highlight
	local space_bracket = sbar.add("bracket", { space.name }, {
		width = 18,
		background = {
			color = colors.transparent,
			border_width = 1,
			height = 18,
			corner_radius = 100,
		},
	})

	-- Padding space
	sbar.add("item", "space.padding." .. i, {
		script = "",
		width = settings.group_paddings,
	})

	local space_popup = sbar.add("item", {
		position = "popup." .. space.name,
		padding_left = 5,
		padding_right = 0,
		background = {
			drawing = true,
			image = {
				corner_radius = 9,
				scale = 0.2,
			},
		},
	})

	space:subscribe("aerospace_workspace_change", function(env)
		local selected = "space." .. env.FOCUSED_WORKSPACE == env.NAME
		space:set({
			background = { border_color = selected and colors.black or colors.bg2 },
		})
		space_bracket:set({
			background = { border_color = selected and colors.catppuccin.mauve or colors.bg2 },
		})
	end)

	space:subscribe("aerospace_focus_change", function()
		-- show_apps(i)
	end)

	space:subscribe("mouse.clicked", function(env)
		local id = env.NAME:sub(-1)
		if env.BUTTON == "other" then
			space_popup:set({ background = { image = env.NAME } })
			space:set({ popup = { drawing = "toggle" } })
		else
			sbar.exec("aerospace workspace " .. id)
		end
	end)

	space:subscribe("mouse.exited", function(_)
		space:set({ popup = { drawing = false } })
	end)

	-- show_apps(i)
end

local space_window_observer = sbar.add("item", {
	drawing = false,
	updates = true,
})

local spaces_indicator = sbar.add("item", {
	padding_left = -3,
	padding_right = 0,
	icon = {
		padding_left = 8,
		padding_right = 9,
		color = colors.catppuccin.pink,
		string = icons.switch.on,
	},
})

space_window_observer:subscribe("aerospace_focus_change", function()
	show_apps()
end)

spaces_indicator:subscribe("swap_menus_and_spaces", function()
	local currently_on = spaces_indicator:query().icon.value == icons.switch.on
	spaces_indicator:set({
		icon = currently_on and icons.switch.off or icons.switch.on,
	})
end)

spaces_indicator:subscribe("mouse.clicked", function()
	sbar.trigger("swap_menus_and_spaces")
end)

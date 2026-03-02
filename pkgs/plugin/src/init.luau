-- name: plugin
-- description: mocha plugin
-- class: root
-- author(s): Primiti_ve

local converter = require("./roblox_packages/converter")
local brush = require("./roblox_packages/brush")
local utils = require("./roblox_packages/utils")

local widget_class = require("@self/widget")

local assets = script:WaitForChild("assets") :: Instance & { [string]: Instance }

function build(plugin_global: unknown)
	local gui = assets.gui:Clone()

	utils.plugin_global.set(plugin_global)

	local widget_size = Vector2.new(450, 250)
	local plugin_widget = widget_class.new("mocha", widget_size)

	plugin_widget:create_widget(gui)
	plugin_widget:create_toolbar("mocha")
	plugin_widget:create_button("mocha", "a tc to v5.5 co converter", "rbxassetid://100158613404254")

	local widget = plugin_widget:get("widget")
	local environment = {
		modules = {
			brush = brush,
			converter = converter,
		},

		widget = widget,

		exports = {
			plugin_global = utils.plugin_global,
		},
	}

	print(environment)
end

return {
	build = build,
}

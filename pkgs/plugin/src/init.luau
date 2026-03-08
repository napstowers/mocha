-- name: plugin
-- description: mocha plugin
-- class: root
-- author(s): Primiti_ve

local converter = require("./roblox_packages/converter")
local utils = require("./roblox_packages/utils")

local app = require("@self/ui/app")
local widget_class = require("@self/widget")

local plugin_class = {}

function plugin_class.build(plugin_global: unknown)
	utils.plugin_global.set(plugin_global)

	local widget_size = Vector2.new(450, 250)
	local plugin_widget = widget_class.new("mocha", widget_size)

	plugin_widget:create_widget()

	app {
		parent = plugin_widget.widget,
	}

	plugin_widget:create_toolbar("mocha")
	plugin_widget:create_button("mocha", "a tc to v5.5 co converter", "rbxassetid://100158613404254")

	local environment = {
		modules = {
			converter = converter,
		},

		widget = plugin_widget,

		exports = {
			plugin_global = utils.plugin_global,
		},
	}

	print(environment)
end

return plugin_class

-- name: themes
-- description: brush themes
-- class: manifest
-- author(s): Primiti_ve

local types = require("../roblox_packages/types")

return {
	dark = {
		background = {
			primary = Color3.fromRGB(20, 20, 20),
			secondary = Color3.fromRGB(50, 50, 50),
		},

		scrollbar = {
			primary = Color3.fromRGB(255, 255, 255),
		},

		text = {
			primary = Color3.fromRGB(255, 255, 255),
			secondary = Color3.fromRGB(200, 200, 200),

			warning = Color3.fromRGB(255, 238, 110),
			error = Color3.fromRGB(255, 99, 99),
		},

		image = {
			primary = Color3.fromRGB(255, 255, 255),
			secondary = Color3.fromRGB(200, 200, 200),
		},
	},

	light = {
		background = {
			primary = Color3.fromRGB(235, 235, 235),
			secondary = Color3.fromRGB(180, 180, 180),
		},

		scrollbar = {
			primary = Color3.fromRGB(0, 0, 0),
		},

		text = {
			primary = Color3.fromRGB(0, 0, 0),
			secondary = Color3.fromRGB(50, 50, 50),

			warning = Color3.fromRGB(255, 238, 110),
			error = Color3.fromRGB(255, 99, 99),
		},

		image = {
			primary = Color3.fromRGB(0, 0, 0),
			secondary = Color3.fromRGB(50, 50, 50),
		},
	},
} :: { [string]: types.theme }

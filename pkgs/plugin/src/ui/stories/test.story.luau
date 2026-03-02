local vide = require("../../../roblox_packages/vide")
local types = require("../types")

local cleanup = vide.cleanup

local button_component = require("../components/button")

local story = {
	vide = vide,

	story = function(properties: types.story_props)
		local inst = button_component({
			Name = "test",
			Parent = properties.target,

			Size = UDim2.fromOffset(100, 100),
		})
		
		cleanup(function()
			inst:Destroy()
		end)

		return inst
	end,
} :: types.story

return story

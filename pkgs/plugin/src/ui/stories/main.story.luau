local types = require("../types")
local vide = require("../../../roblox_packages/vide")

local cleanup = vide.cleanup

local main_screen = require("../screens/main")

local story: types.story = {
	vide = vide,

	story = function(properties: types.story_props)
		local screen
		
		vide.root(function(destroy: () -> ())
    		screen = main_screen {
    			parent = properties.target,
    		}
    
    		cleanup(function()
    			screen:Destroy()
    		end)
		end)

		return screen
	end,
}

return story

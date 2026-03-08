local videkit_ty = require("../../../roblox_packages/videkit_ty")

export type props = {
	parent: Instance,
}

function main_screen(props: props)
	local background = videkit_ty.background {}
	
	background.Parent = props.parent

	local root = videkit_ty.list {
    	videkit_ty.padding {
    		padding = UDim.new(0.1, 0),
    	},
	}

	root.Parent = background

	local _header = videkit_ty.text {
		Text = "mocha",
		TextScaled = true,
		
		Size = UDim2.fromScale(1, 0.1),
		
		Parent = root,
	}

	return background
end

return main_screen

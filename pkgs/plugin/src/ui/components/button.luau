local vide = require("../../../roblox_packages/vide")
local types = require("../types")

local create = vide.create
local source = vide.source
local spring = vide.spring

local COLOUR_BLACK = Color3.new(0, 0, 0)
local COLOUR_WHITE = Color3.new(1, 1, 1)

local COLOUR_TEXT = COLOUR_WHITE
local COLOUR_BG_REST = Color3.fromHex("#ffffff")
local COLOUR_BG_HOVER = COLOUR_BG_REST:Lerp(COLOUR_BLACK, 0.15)
local COLOUR_BG_HELD = COLOUR_BG_REST:Lerp(COLOUR_BLACK, 0.25)
local COLOUR_BG_DISABLED = Color3.fromHex("CCCCCC")

local BG_FADE_SPEED = 35

local CORNER_RADIUS = UDim.new(0, 4)
local PADDING = UDim2.fromOffset(6, 4)

return function(props: {
	Name: types.source<string>?,
	Parent: types.source<Instance>,

	LayoutOrder: types.source<number>?,
	Position: types.source<UDim2>?,
	AnchorPoint: types.source<Vector2>?,
	ZIndex: types.source<number>?,
	Size: types.source<UDim2>?,
	AutomaticSize: types.source<Enum.AutomaticSize>?,

	Text: types.source<string>?,

	disabled: types.source<boolean>?,
	on_click: (() -> ())?,

	[string]: types.source<unknown>,
}): Instance
	local is_hovering = source(false)
	local is_held_down = source(false)

	local disabled = props.disabled or source(false)
	local on_click = props.on_click or function() end

	local properties = {
		Name = props.Name,
		Parent = props.Parent,

		LayoutOrder = props.LayoutOrder or 1,
		Position = props.Position or UDim2.fromOffset(0, 0),
		AnchorPoint = props.AnchorPoint or Vector2.new(0, 0),
		ZIndex = props.ZIndex or 1,
		Size = props.Size or UDim2.fromOffset(200, 50),
		AutomaticSize = props.AutomaticSize or Enum.AutomaticSize.None,

		Text = props.Text,
		TextColor3 = COLOUR_TEXT,

		BackgroundColor3 = spring(function()
			return if disabled()
				then COLOUR_BG_DISABLED
				elseif is_held_down() then COLOUR_BG_HELD
				elseif is_hovering() then COLOUR_BG_HOVER
				else COLOUR_BG_REST
		end, BG_FADE_SPEED),

		Activated = function()
			if on_click ~= nil and not disabled() then
				on_click()
			end
		end,

		MouseButton1Down = function()
			is_held_down(true)
		end,
		MouseButton1Up = function()
			is_held_down(false)
		end,

		MouseEnter = function()
			is_hovering(true)
		end,
		MouseLeave = function()
			is_held_down(false)
			is_hovering(false)
		end,
	}

	local children = {
		create("UICorner")({
			CornerRadius = CORNER_RADIUS,
		}),

		create("UIPadding")({
			PaddingTop = PADDING.Y,
			PaddingBottom = PADDING.Y,
			PaddingLeft = PADDING.X,
			PaddingRight = PADDING.X,
		}),
	}

	for name, value in pairs(props) do
		if not properties[name] then
			properties[name] = value
		end
	end

	local instance = create("TextButton")(properties)

	for name, child in pairs(children) do
		child.Parent = instance
	end

	return instance
end

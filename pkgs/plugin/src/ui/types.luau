-- name: types
-- description: ui types
-- class: types
-- author(s): Primiti_ve

local vide = require("../../roblox_packages/vide")

export type source<T> = vide.source<T>

export type story_controls = { [string]: any }
export type story_cleanup = () -> ()

export type story_props = {
	controls: story_controls,
	target: Instance,
}

export type story = {
	vide: typeof(vide),
	controls: story_controls?,

	story: (story_props) -> story_cleanup?,
}

return nil

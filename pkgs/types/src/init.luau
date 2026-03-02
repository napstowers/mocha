-- name: Types
-- description: shared Mocha types
-- class: utility
-- author(s): Primiti_ve

-- custom type for settings().Studio
-- adds ThemeChanged
export type studio_settings = typeof(settings().Studio) & {
	ThemeChanged: RBXScriptSignal,
}

-- converter type
export type converter = {
	name: string,

	is_convertable: (Instance) -> (boolean, string?),
	convert: (Instance) -> Instance,
}

-- brush theme type
export type theme = {
	background: {
		primary: Color3,
		secondary: Color3,
	},

	scrollbar: {
		primary: Color3,
	},

	text: {
		primary: Color3,
		secondary: Color3,

		warning: Color3,
		error: Color3,
	},

	image: {
		primary: Color3,
		secondary: Color3,
	},
}

return nil
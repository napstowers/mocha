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

return nil
-- name: app
-- description: ui app component
-- class: ui
-- author(s): Primiti_ve

local vide = require("../../roblox_packages/vide")
local main_screen = require("./screens/main")

export type props = {
    parent: Instance
}

function app(props: props)
    vide.root(function()
        local _root = main_screen(props)
    end)
end

return app

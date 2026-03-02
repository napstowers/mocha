local plugin_global = plugin
local plugin_pkg = require(script.roblox_packages.plugin)

local success, err = pcall(plugin_pkg.build, plugin_global)

if not success then
	error(err)
end
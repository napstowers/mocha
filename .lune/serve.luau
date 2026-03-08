local fs = require("@lune/fs")
local process = require("@lune/process")
local task = require("@lune/task")

process.exec("lune", { "run", "repkg" }, {
    stdio = "inherit",
})

if not fs.isFile("./sourcemap.json") then
	process.exec("rojo", { "sourcemap", "plugin.project.json", "-o", "./sourcemap.json" }, {
		stdio = "inherit",
	})
end

task.spawn(process.exec, "rojo", { "serve", "plugin.project.json" }, {
	stdio = "inherit",
})

task.spawn(process.exec, "rojo", { "sourcemap", "plugin.project.json", "-o", "./sourcemap.json", "--watch" }, {
	stdio = "inherit",
})

while true do
    task.wait(1)
end

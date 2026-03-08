local process = require("@lune/process")
local passes = 2

for i = 1, passes do
	print(`[mocha] rebuild packages pass {i}`)

	process.exec("pesde", { "install" }, {
		stdio = "inherit",
	})
end

return nil

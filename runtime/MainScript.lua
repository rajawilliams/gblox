local Sandbox = require(script:WaitForChild("SBoxer"))

local function RequireFunctionalModule(Name)
	require(script:WaitForChild(Name))
end

RequireFunctionalModule("Tags")
RequireFunctionalModule("Realism")

Sandbox.RunSandbox([[
	local test = "test"
	print(test)
]])

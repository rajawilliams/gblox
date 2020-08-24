local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Sandbox = require(ReplicatedStorage:WaitForChild("Sandbox"))

local function RequireFunctionalModule(Name)
	require(script:WaitForChild(Name))
end

RequireFunctionalModule("Tags")
RequireFunctionalModule("Realism")

local TestSandbox = Sandbox.new()
TestSandbox:Run([[
	local test = "test"
	print(test)
]])

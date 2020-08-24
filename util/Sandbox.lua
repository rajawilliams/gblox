local loadstr = require(script:WaitForChild("Loadstring"))

local APIs = script:WaitForChild("APIs")

local DefaultLibraries = {
	"bit32", "collectgarbage", "assert", "error",
	"coroutine", "getmetatable", "ipairs", "newproxy",
	"debug", "next", "pairs", "pcall", "print",
	"math", "select", "setmetatable", "tonumber",
	"os", "tostring", "type", "unpack", "xpcall",
	"string", "_VERSION", "table", "delay", "tick",
	"elapsedTime", "printidentity", "spawn",  "time",
	"typeof", "version", "wait", "warn", "Enum"
}

local E = getfenv()

local Sandbox = {}
Sandbox.__index = {}

function Sandbox.new()
	local Out = setmetatable({Environment = {}}, Sandbox)
	for _, v in pairs(DefaultLibraries) do
		Sandbox:Load(v, E[v])
	end
	for _, v in pairs(APIs:GetChildren()) do
		if v:IsA("ModuleScript") then
			Sandbox:Load(v.Name, require(v))
		end
	end
	return Out
end

function Sandbox:Load(Key, Value, Table)
	Table = Table or self.Environment
	if type(Value) == "table" then
		Table[Key] = {}
		for k, v in pairs(Value) do
			Sandbox:Load(k, v, Table[Key])
		end
		return
	end
	Table[Key] = Value
end

function Sandbox:Run(Str)
	return loadstr(Str, self.Environment)()
end

return Sandbox

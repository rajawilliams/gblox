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
Sandbox.Env = {}

function Sandbox.LoadIntoEnv(Key, Value)
	if type(Value) == "table" then
		for k, v in pairs(Value) do
			Sandbox.LoadIntoEnv(k, v)
		end
		return
	end
	Sandbox.Env[Key] = Value
end

function Sandbox.RunSandbox(Str)
	return loadstr(Str, Sandbox.Env)
end

for _, v in pairs(DefaultLibraries) do
	Sandbox.LoadIntoEnv(v, E[v])
end

return Sandbox

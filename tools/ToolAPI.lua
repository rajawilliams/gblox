local Tools = {}
local Tool = {}
Tool.__metatable = {}

function Tools.new()
	return setmetatable({
		Instance = Instance.new
	}, Tool)
end

function Tool:__newindex(Index, Value)
	if Index == "Instance" then
		return
	end
	rawset(self, Index, Value)
end

function Tool:__index(Index)
	if Index == "Instance" then
		return nil
	end
	return rawget(self, Index)
end

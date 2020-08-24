local ReplicatedStorage 

local DownloadScripts = Instance.new("RemoteFunction", ReplicatedStorage)
DownloadScripts.Name = "DownloadScripts"

local GlobalId = 0

local Addons = {}
local Addon = {}
Addon.__index = Addon

local Script = {}
Script.__index = Script

function Addon.new()
	local Id = GlobalId
	GlobalId += 1
	return setmetatable({Id = Id, Scripts = {}, Sandbox = Sandbox.new()})
end

function Addon:AddScript()
	local Out = setmetatable({Clientside = false, Source = ""}, Script)
	table.insert(self.Scripts, Out)
	return Out
end

function Addon:Run(Id)

end

function DownloadScripts.OnServerInvoke()

end

return Addon
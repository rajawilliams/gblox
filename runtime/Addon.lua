local ReplicatedStorage = game:GetService("ReplicatedStorage")

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
	local Out = setmetatable({Id = Id, Scripts = {}, Sandbox = Sandbox.new()})
	GlobalId += 1
	table.insert(Addons, Out)
	return Out
end

function Addon:AddScript()
	local Out = setmetatable({Clientside = false, Source = ""}, Script)
	table.insert(self.Scripts, Out)
	return Out
end

function Addon:Run(Id)
	for _, v in pairs(Addons) do
		for _, w in pairs(v.Scripts) do
			if w.Clientside then continue end
		end
	end
end

function DownloadScripts.OnServerInvoke()
	local ClientScripts = {}
	for _, v in pairs(Addons) do
		for _, w in pairs(v.Scripts) do
			if w.Clientside then
				table.insert(ClientScripts, w.Source)
			end
		end
	end
	return ClientScripts
end

return Addon
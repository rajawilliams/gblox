local Players = game:GetService("Players")

local Raycast = {}

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera

function Raycast.GetRay(Distance)
	local UnitRay = Camera:ViewportPointToRay(Mouse.X, Mouse.Y)
	return Ray.new(UnitRay.Origin, UnitRay.Direction * Distance)
end

function Raycast.CastRay(Whitelist, Distance)
	local HitPart = workspace
end

return Raycast

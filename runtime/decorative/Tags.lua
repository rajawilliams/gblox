local Players = game:GetService("Players")

local Tags = {
	["Dev"] = {
		TagColor = Color3.fromRGB(255, 0, 0),
		ChatColor = Color3.fromRGB(239, 184, 56),
		DisplayName = "Developer"
	},
	["Tester"] = {
		TagColor = Color3.fromRGB(0, 0, 255),
		ChatColor = Color3.fromRGB(255, 0, 0),
		DisplayName = "Tester"
	}
}
local PlayerTags = { -- should probably use userids but im lazy
	["djsportscar"] = "Dev",
	["dogeman124567"] = "Dev",
	["MrTacobelllll"] = "Dev",
	["Iplaydev"] = "Dev",
	["kingraptor208"] = "Tester"
}

Players.PlayerAdded:Connect(function(Player)
	if PlayerTags[Player.Name] and Tags[PlayerTags[Player.Name]] then
		local Tag = Tags[PlayerTags[Player.Name]]
		local TagsFolder = Instance.new("Folder", Player)
		TagsFolder.Name = "Tags"
		local NewTag = Instance.new("IntValue", TagsFolder)
		NewTag.Name = PlayerTags[Player.Name]
		local ChatColor = Instance.new("Color3Value", NewTag)
		ChatColor.Name = "ChatColor"
		ChatColor.Value = Tag.ChatColor
		local TagColor = Instance.new("Color3Value", NewTag)
		TagColor.Name = "TagColor"
		TagColor.Value = Tag.TagColor
	end
end)

return nil -- dont need to return anything for now

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local CancelLoadEvent = ReplicatedStorage:FindFirstChild("CancelLoadEvent")

CancelLoadEvent.OnServerEvent:Connect(function(player)
	player:SetAttribute("LoadCancelled", true)
end)

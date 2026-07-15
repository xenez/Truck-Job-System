local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local NotificationEvent = ReplicatedStorage:WaitForChild("NotificationEvent")

NotificationEvent.OnClientEvent:Connect(function(title, text, duration)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = title,
		Text = text,
		Duration = duration or 5
	})
end)

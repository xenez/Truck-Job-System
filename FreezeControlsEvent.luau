local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

local FreezeControlsEvent = ReplicatedStorage:WaitForChild("FreezeControlsEvent")
local CancelLoadEvent = ReplicatedStorage:FindFirstChild("CancelLoadEvent") or Instance.new("RemoteEvent")
CancelLoadEvent.Name = "CancelLoadEvent"
CancelLoadEvent.Parent = ReplicatedStorage

local isFrozen = false

FreezeControlsEvent.OnClientEvent:Connect(function(freeze)
	isFrozen = freeze

	if freeze then
		local character = player.Character
		if character then
			local humanoid = character:FindFirstChild("Humanoid")
			if humanoid then
				humanoid.WalkSpeed = 0
			end
		end
	else
		-- Відновлюємо управління
		local character = player.Character
		if character then
			local humanoid = character:FindFirstChild("Humanoid")
			if humanoid then
				humanoid.WalkSpeed = 16
			end
		end
	end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.P and isFrozen then
		CancelLoadEvent:FireServer()
	end
end)

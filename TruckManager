local Players = game:GetService("Players")

Players.PlayerRemoving:Connect(function(player)
	local truck = player:GetAttribute("Truck")
	if truck then
		truck:Destroy()
	end
end)

game:GetService("Players").PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		if player:GetAttribute("HasTruckerJob") and (not player:GetAttribute("Truck") or not player:GetAttribute("Truck").Parent) then
			local spawnPoints = {}
			for i = 1, 6 do
				local point = workspace:FindFirstChild("TruckSpawn" .. i)
				if point then
					table.insert(spawnPoints, point)
				end
			end

			local freeSpawn
			for _, point in ipairs(spawnPoints) do
				local trucks = workspace:FindPartsInRegion3(Region3.new(point.Position - Vector3.new(5,5,5), point.Position + Vector3.new(5,5,5)), nil, 100)
				local isFree = true
				for _, truck in ipairs(trucks) do
					if truck:FindFirstAncestorWhichIsA("Model") and truck:FindFirstAncestorWhichIsA("Model").Name == "Truck" then
						isFree = false
						break
					end
				end
				if isFree then
					freeSpawn = point
					break
				end
			end

			if freeSpawn then
				local InsertService = game:GetService("InsertService")
				local success, newTruck = pcall(function()
					return InsertService:LoadAsset(114559490447087)
				end)

				if success and newTruck then
					newTruck = newTruck:GetChildren()[1]
					newTruck.Parent = workspace
					newTruck:SetPrimaryPartCFrame(freeSpawn.CFrame)
					player:SetAttribute("Truck", newTruck)
				end
			end
		end
	end)
end)

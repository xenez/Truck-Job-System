local Players = game:GetService("Players")

Players.PlayerRemoving:Connect(function(player)
	if _G.PlayerTimers and _G.PlayerTimers[player] then
		_G.PlayerTimers[player]:Disconnect()
		_G.PlayerTimers[player] = nil
	end

	if _G.PlayerTrucks and _G.PlayerTrucks[player] then
		_G.PlayerTrucks[player]:Destroy()
		_G.PlayerTrucks[player] = nil
	end
end)

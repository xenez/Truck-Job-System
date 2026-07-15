local Players = game:GetService("Players")

local MoneySystem = {}
MoneySystem.__index = MoneySystem

function MoneySystem:SetupPlayer(player)
	local leaderstats = player:FindFirstChild("leaderstats")
	if not leaderstats then
		leaderstats = Instance.new("Folder")
		leaderstats.Name = "leaderstats"
		leaderstats.Parent = player
	end

	local money = leaderstats:FindFirstChild("Money")
	if not money then
		money = Instance.new("IntValue")
		money.Name = "Money"
		money.Value = 0
		money.Parent = leaderstats
	end

	return money
end

function MoneySystem:AddMoney(player, amount)
	local money = self:SetupPlayer(player)
	money.Value = money.Value + amount
	return money.Value
end

function MoneySystem:GetMoney(player)
	local leaderstats = player:FindFirstChild("leaderstats")
	if not leaderstats then return 0 end

	local money = leaderstats:FindFirstChild("Money")
	return money and money.Value or 0
end

Players.PlayerAdded:Connect(function(player)
	MoneySystem:SetupPlayer(player)
end)

for _, player in ipairs(Players:GetPlayers()) do
	MoneySystem:SetupPlayer(player)
end

return MoneySystem

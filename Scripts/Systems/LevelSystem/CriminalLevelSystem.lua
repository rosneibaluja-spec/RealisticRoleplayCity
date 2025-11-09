-- CriminalLevelSystem.lua
-- Sistema de niveles y recompensas para el trabajo Criminal
-- Guarda progreso usando DataStoreService

local DataStoreService = game:GetService("DataStoreService")
local LevelStore = DataStoreService:GetDataStore("CriminalLevels")

local CriminalLevelSystem = {}
CriminalLevelSystem.Levels = {
	{xp = 0, reward = "Nada"},
	{xp = 100, reward = "Pistola"},
	{xp = 250, reward = "Escopeta"},
	{xp = 500, reward = "Rifle"},
	{xp = 1000, reward = "Armadura"},
}

function CriminalLevelSystem:GetPlayerData(player)
	local key = "CriminalLevel_" .. player.UserId
	local data, err = LevelStore:GetAsync(key)
	if err then warn("Error cargando nivel:", err) end
	if not data then
		data = {xp = 0, level = 1}
		LevelStore:SetAsync(key, data)
	end
	return data
end

function CriminalLevelSystem:AddXP(player, amount)
	local key = "CriminalLevel_" .. player.UserId
	local data = self:GetPlayerData(player)
	data.xp = data.xp + amount

	-- subir nivel si alcanza XP requerida
	local nextLevel = data.level + 1
	local nextData = self.Levels[nextLevel]
	if nextData and data.xp >= nextData.xp then
		data.level = nextLevel
		print("[CriminalLevelSystem] " .. player.Name .. " sube a nivel " .. nextLevel)
		print("Recompensa: " .. nextData.reward)
	end

	LevelStore:SetAsync(key, data)
end

return CriminalLevelSystem

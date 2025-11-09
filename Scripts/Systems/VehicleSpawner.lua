-- VehicleSpawner.lua
-- Sistema para manejar la aparición de vehículos según el trabajo del jugador

local VehicleSpawner = {}
local JobSystem = require(script.Parent.JobSystem)

function VehicleSpawner.Init()
	print("[VehicleSpawner] Sistema de vehículos inicializado.")
end

function VehicleSpawner:SpawnForPlayer(player, job)
	local data = JobSystem:GetJobData(job)
	if not data then
		warn("Trabajo no válido:", job)
		return
	end
	print(player.Name .. " recibe un vehículo del trabajo " .. job)
end

return VehicleSpawner

-- MainPlugin.lua
-- Inicializador principal del sistema RealisticRoleplayCity

local Plugin = {}

function Plugin:Init()
	print("[RealisticRoleplayCity] Plugin iniciado correctamente.")
	require(script.Parent.Systems.JobSystem).Init()
	require(script.Parent.Systems.VehicleSpawner).Init()
end

return Plugin

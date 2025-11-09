-- JobSystem.lua
-- Sistema de trabajos: Dicrim, Policía, Mecánico, Médico, Criminal y Civil

local JobSystem = {}
JobSystem.Jobs = {
	["Civil"] = {spawn="CitySpawn", vehicles={"Civic","Sedan","Pickup"}},
	["Dicrim"] = {spawn="DicrimBase", vehicles={"DicrimCar","DicrimSUV"}, helicopter="DicrimCopter"},
	["Policia"] = {spawn="PoliceHQ", vehicles={"Patrol","Interceptor"}, helicopter="PoliceCopter"},
	["Mecanico"] = {spawn="Workshop", vehicles={"TowTruck","ServiceVan"}, helicopter="MechCopter"},
	["Medico"] = {spawn="Hospital", vehicles={"Ambulance","RescueVan"}, helicopter="MediCopter"},
	["Criminal"] = {spawn="Hideout", vehicles={"MuscleCar","GetawayVan"}, helicopter="CrimeCopter"},
}

function JobSystem.Init()
	print("[JobSystem] Sistema de trabajos cargado.")
end

function JobSystem:GetJobData(job)
	return self.Jobs[job]
end

return JobSystem

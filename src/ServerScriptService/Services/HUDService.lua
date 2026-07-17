--[[
    HUDService
    
    Purpose:
    Provides game state data for the client HUD.
    
    Behaviour only:
    - Query current game state
    - Format data for display
--]]

local HUDService = {}

local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataService = require(ServerScriptService.Services.DataService)
local StrengthService = require(ServerScriptService.Services.StrengthService)
local EquipmentService = require(ServerScriptService.Services.EquipmentService)
local BackpackService = require(ServerScriptService.Services.BackpackService)
local AreaService = require(ServerScriptService.Services.AreaService)
local GameConfig = require(ReplicatedStorage.Config.GameConfig)

function HUDService:Initialize()
end

function HUDService:Start()
end

function HUDService:Cleanup()
end

function HUDService:GetHUDData(player)
    if not DataService:IsProfileReady(player) then return nil end

    local strength = StrengthService:GetStrength(player)
    local coins = DataService:GetValue(player, "Data.Economy.Coins") or 0
    local equipmentId = EquipmentService:GetCurrentEquipment(player)
    local backpackId = BackpackService:GetCurrentBackpack(player)
    local areaId = AreaService:GetCurrentArea(player)
    local storedCount = BackpackService:GetStoredCount(player)
    local capacity = BackpackService:GetCapacity(player)

    local equipmentName = "None"
    if equipmentId then
        local data = EquipmentService:GetEquipmentData(equipmentId)
        if data then equipmentName = data.Name end
    end

    local backpackName = "None"
    if backpackId then
        local data = BackpackService:GetBackpackData(backpackId)
        if data then backpackName = data.Name end
    end

    local areaName = "None"
    local areaData = AreaService:GetAreaData(areaId)
    if areaData then areaName = areaData.Name end

    return {
        Strength = strength,
        Coins = coins,
        Equipment = equipmentName,
        Backpack = backpackName,
        Area = areaName,
        StoredOres = storedCount,
        Capacity = capacity,
    }
end

return HUDService
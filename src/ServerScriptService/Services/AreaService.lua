--[[
    AreaService
    
    Purpose:
    Manages area access and progression.
    Does NOT own area data — GameConfig defines areas.
    Does NOT own player area — profile stores current area.
    
    Behaviour only:
    - Validate area access
    - Process area transitions
    - Query area requirements
--]]

local AreaService = {}

local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataService = require(ServerScriptService.Services.DataService)
local EquipmentService = require(ServerScriptService.Services.EquipmentService)
local BackpackService = require(ServerScriptService.Services.BackpackService)
local GameConfig = require(ReplicatedStorage.Config.GameConfig)

local CURRENT_AREA_PATH = "Data.CurrentArea"
local UNLOCKED_PATH = "Data.UnlockedAreas"

local function debugLog(message)
    local ok, DebugService = pcall(function()
        return require(ServerScriptService.Debug.DebugService)
    end)
    if ok and DebugService and DebugService.IsEnabled() then
        DebugService:Log(message, "INFO")
    end
end

function AreaService:Initialize()
end

function AreaService:Start()
end

function AreaService:Cleanup()
end

function AreaService:GetAreaData(areaId)
    return GameConfig.Areas[areaId]
end

function AreaService:GetCurrentArea(player)
    if not DataService:IsProfileReady(player) then return "Area1" end
    return DataService:GetValue(player, CURRENT_AREA_PATH) or "Area1"
end

function AreaService:GetUnlockedAreas(player)
    if not DataService:IsProfileReady(player) then return { "Area1" } end
    return DataService:GetValue(player, UNLOCKED_PATH) or { "Area1" }
end

function AreaService:IsAreaUnlocked(player, areaId)
    local unlocked = self:GetUnlockedAreas(player)
    for _, id in ipairs(unlocked) do
        if id == areaId then return true end
    end
    return false
end

function AreaService:CanAccessArea(player, areaId)
    if not DataService:IsProfileReady(player) then return false end

    local areaData = self:GetAreaData(areaId)
    if not areaData then return false end

    local currentEquipment = EquipmentService:GetCurrentEquipment(player)
    if currentEquipment then
        local equipData = EquipmentService:GetEquipmentData(currentEquipment)
        if equipData and equipData.Tier < areaData.RequiredEquipmentTier then
            return false, "Equipment tier too low"
        end
    end

    local currentBackpack = BackpackService:GetCurrentBackpack(player)
    if currentBackpack then
        local bpData = BackpackService:GetBackpackData(currentBackpack)
        if bpData and bpData.Tier < areaData.RequiredBackpackTier then
            return false, "Backpack tier too low"
        end
    end

    return true, nil
end

function AreaService:EnterArea(player, areaId)
    if not DataService:IsProfileReady(player) then
        return false, "Profile not ready"
    end

    if not self:IsAreaUnlocked(player, areaId) then
        local canAccess, reason = self:CanAccessArea(player, areaId)
        if not canAccess then
            return false, reason or "Area locked"
        end

        local unlocked = self:GetUnlockedAreas(player)
        table.insert(unlocked, areaId)
        DataService:SetValue(player, UNLOCKED_PATH, unlocked)
    end

    DataService:SetValue(player, CURRENT_AREA_PATH, areaId)

    debugLog("[AreaService] " .. player.Name .. " entered " .. areaId)

    return true, nil
end

function AreaService:GetOresInArea(areaId)
    local areaData = self:GetAreaData(areaId)
    if not areaData then return {} end
    return areaData.Ores
end

function AreaService:GetAllAreas()
    return GameConfig.Areas
end

return AreaService
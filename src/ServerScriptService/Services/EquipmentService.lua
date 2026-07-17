--[[
    EquipmentService
    
    Purpose:
    Manages equipment behaviour — ownership, purchasing, equipping.
    Does NOT own equipment data — that lives in the profile.
    
    Behaviour only:
    - Validate equipment ownership
    - Process equipment purchases
    - Equip/unequip equipment
    - Query equipment from config
--]]

local EquipmentService = {}

local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataService = require(ServerScriptService.Services.DataService)
local GameConfig = require(ReplicatedStorage.Config.GameConfig)

local OWNED_PATH = "Data.OwnedEquipment"
local EQUIPPED_PATH = "Data.CurrentEquipment"

local function debugLog(message)
    local ok, DebugService = pcall(function()
        return require(ServerScriptService.Debug.DebugService)
    end)
    if ok and DebugService and DebugService.IsEnabled() then
        DebugService:Log(message, "INFO")
    end
end

function EquipmentService:Initialize()
end

function EquipmentService:Start()
end

function EquipmentService:Cleanup()
end

function EquipmentService:GetEquipmentData(equipmentId)
    return GameConfig.Equipment[equipmentId]
end

function EquipmentService:GetOwnedEquipment(player)
    if not DataService:IsProfileReady(player) then return {} end
    return DataService:GetValue(player, OWNED_PATH) or {}
end

function EquipmentService:GetCurrentEquipment(player)
    if not DataService:IsProfileReady(player) then return nil end
    return DataService:GetValue(player, EQUIPPED_PATH)
end

function EquipmentService:IsOwned(player, equipmentId)
    local owned = self:GetOwnedEquipment(player)
    for _, id in ipairs(owned) do
        if id == equipmentId then return true end
    end
    return false
end

function EquipmentService:Purchase(player, equipmentId)
    if not DataService:IsProfileReady(player) then
        debugLog("[EquipmentService] Purchase rejected: profile not ready - " .. player.Name)
        return false, "Profile not ready"
    end

    local equipData = self:GetEquipmentData(equipmentId)
    if not equipData then
        debugLog("[EquipmentService] Purchase rejected: invalid equipment " .. tostring(equipmentId))
        return false, "Invalid equipment"
    end

    if self:IsOwned(player, equipmentId) then
        debugLog("[EquipmentService] Purchase rejected: already owned - " .. player.Name .. " | " .. equipmentId)
        return false, "Already owned"
    end

    local strengthService = require(ServerScriptService.Services.StrengthService)
    local playerStrength = strengthService:GetStrength(player)
    if playerStrength < equipData.RequiredStrength then
        debugLog("[EquipmentService] Purchase rejected: insufficient strength - " .. player.Name .. " | Need: " .. equipData.RequiredStrength .. " | Have: " .. playerStrength)
        return false, "Insufficient strength"
    end

    local economyService = require(ServerScriptService.Services.EconomyService)
    if not economyService:HasCurrency(player, "Coins", equipData.PurchasePrice) then
        debugLog("[EquipmentService] Purchase rejected: insufficient coins - " .. player.Name .. " | Need: " .. equipData.PurchasePrice)
        return false, "Insufficient coins"
    end

    economyService:RemoveCurrency(player, "Coins", equipData.PurchasePrice)

    local owned = self:GetOwnedEquipment(player)
    table.insert(owned, equipmentId)
    DataService:SetValue(player, OWNED_PATH, owned)

    self:Equip(player, equipmentId)

    debugLog("[EquipmentService] Purchased: " .. player.Name .. " | " .. equipData.Name .. " | -" .. equipData.PurchasePrice .. " Coins")

    return true, nil
end

function EquipmentService:Equip(player, equipmentId)
    if not DataService:IsProfileReady(player) then
        return false, "Profile not ready"
    end

    if not self:IsOwned(player, equipmentId) then
        debugLog("[EquipmentService] Equip rejected: not owned - " .. player.Name .. " | " .. equipmentId)
        return false, "Not owned"
    end

    local equipData = self:GetEquipmentData(equipmentId)
    if not equipData then
        return false, "Invalid equipment"
    end

    DataService:SetValue(player, EQUIPPED_PATH, equipmentId)

    debugLog("[EquipmentService] Equipped: " .. player.Name .. " | " .. equipData.Name)

    return true, nil
end

function EquipmentService:GetAllEquipment()
    return GameConfig.Equipment
end

function EquipmentService:GetEquipmentByCategory(category)
    local result = {}
    for id, data in pairs(GameConfig.Equipment) do
        if data.Category == category then
            result[id] = data
        end
    end
    return result
end

return EquipmentService
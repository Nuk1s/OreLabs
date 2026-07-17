--[[
    BackpackService
    
    Purpose:
    Manages backpack ownership, capacity, and ore storage.
    Does NOT own backpack data — that lives in the profile.
    
    Behaviour only:
    - Validate backpack ownership
    - Process backpack purchases
    - Query backpack capacity
    - Store ores in inventory
    - Clear inventory after selling
--]]

local BackpackService = {}

local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataService = require(ServerScriptService.Services.DataService)
local GameConfig = require(ReplicatedStorage.Config.GameConfig)

local OWNED_PATH = "Data.OwnedBackpacks"
local EQUIPPED_PATH = "Data.CurrentBackpack"
local STORED_PATH = "Data.StoredOres"
local COUNT_PATH = "Data.StoredOreCount"

local function debugLog(message)
    local ok, DebugService = pcall(function()
        return require(ServerScriptService.Debug.DebugService)
    end)
    if ok and DebugService and DebugService.IsEnabled() then
        DebugService:Log(message, "INFO")
    end
end

function BackpackService:Initialize()
end

function BackpackService:Start()
end

function BackpackService:Cleanup()
end

function BackpackService:GetBackpackData(backpackId)
    return GameConfig.Backpacks[backpackId]
end

function BackpackService:GetOwnedBackpacks(player)
    if not DataService:IsProfileReady(player) then return {} end
    return DataService:GetValue(player, OWNED_PATH) or {}
end

function BackpackService:GetCurrentBackpack(player)
    if not DataService:IsProfileReady(player) then return nil end
    return DataService:GetValue(player, EQUIPPED_PATH)
end

function BackpackService:GetCapacity(player)
    local backpackId = self:GetCurrentBackpack(player)
    if not backpackId then return 20 end
    local data = self:GetBackpackData(backpackId)
    if not data then return 20 end
    return data.Capacity
end

function BackpackService:GetStoredOres(player)
    if not DataService:IsProfileReady(player) then return {} end
    return DataService:GetValue(player, STORED_PATH) or {}
end

function BackpackService:GetStoredCount(player)
    if not DataService:IsProfileReady(player) then return 0 end
    return DataService:GetValue(player, COUNT_PATH) or 0
end

function BackpackService:IsOwned(player, backpackId)
    local owned = self:GetOwnedBackpacks(player)
    for _, id in ipairs(owned) do
        if id == backpackId then return true end
    end
    return false
end

function BackpackService:Purchase(player, backpackId)
    if not DataService:IsProfileReady(player) then
        return false, "Profile not ready"
    end

    local backpackData = self:GetBackpackData(backpackId)
    if not backpackData then
        return false, "Invalid backpack"
    end

    if self:IsOwned(player, backpackId) then
        return false, "Already owned"
    end

    local economyService = require(ServerScriptService.Services.EconomyService)
    if not economyService:HasCurrency(player, "Coins", backpackData.PurchasePrice) then
        return false, "Insufficient coins"
    end

    economyService:RemoveCurrency(player, "Coins", backpackData.PurchasePrice)

    local owned = self:GetOwnedBackpacks(player)
    table.insert(owned, backpackId)
    DataService:SetValue(player, OWNED_PATH, owned)

    self:Equip(player, backpackId)

    debugLog("[BackpackService] Purchased: " .. player.Name .. " | " .. backpackData.Name .. " | -" .. backpackData.PurchasePrice .. " Coins")

    return true, nil
end

function BackpackService:Equip(player, backpackId)
    if not DataService:IsProfileReady(player) then
        return false, "Profile not ready"
    end

    if not self:IsOwned(player, backpackId) then
        return false, "Not owned"
    end

    DataService:SetValue(player, EQUIPPED_PATH, backpackId)

    debugLog("[BackpackService] Equipped: " .. player.Name .. " | " .. self:GetBackpackData(backpackId).Name)

    return true, nil
end

function BackpackService:AddOre(player, oreId)
    if not DataService:IsProfileReady(player) then return false end

    local capacity = self:GetCapacity(player)
    local count = self:GetStoredCount(player)

    if count >= capacity then
        return false, "Backpack full"
    end

    local ores = self:GetStoredOres(player)
    ores[oreId] = (ores[oreId] or 0) + 1
    DataService:SetValue(player, STORED_PATH, ores)
    DataService:SetValue(player, COUNT_PATH, count + 1)

    return true, nil
end

function BackpackService:ClearStorage(player)
    if not DataService:IsProfileReady(player) then return end
    DataService:SetValue(player, STORED_PATH, {})
    DataService:SetValue(player, COUNT_PATH, 0)
end

function BackpackService:IsFull(player)
    return self:GetStoredCount(player) >= self:GetCapacity(player)
end

function BackpackService:GetAllBackpacks()
    return GameConfig.Backpacks
end

return BackpackService
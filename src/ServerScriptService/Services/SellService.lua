--[[
    SellService
    
    Purpose:
    Handles selling stored ores for coins.
    Does NOT own economy — EconomyService handles that.
    Does NOT own inventory — BackpackService handles that.
    
    Behaviour only:
    - Calculate ore value
    - Award coins
    - Clear inventory
--]]

local SellService = {}

local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataService = require(ServerScriptService.Services.DataService)
local EconomyService = require(ServerScriptService.Services.EconomyService)
local BackpackService = require(ServerScriptService.Services.BackpackService)
local GameConfig = require(ReplicatedStorage.Config.GameConfig)

local function debugLog(message)
    local ok, DebugService = pcall(function()
        return require(ServerScriptService.Debug.DebugService)
    end)
    if ok and DebugService and DebugService.IsEnabled() then
        DebugService:Log(message, "INFO")
    end
end

function SellService:Initialize()
end

function SellService:Start()
end

function SellService:Cleanup()
end

function SellService:CalculateValue(storedOres)
    local totalValue = 0

    for oreId, quantity in pairs(storedOres) do
        local oreData = GameConfig.Ores[oreId]
        if oreData then
            totalValue = totalValue + (oreData.Value * quantity)
        end
    end

    return totalValue
end

function SellService:SellAll(player)
    if not DataService:IsProfileReady(player) then
        return false, 0, "Profile not ready"
    end

    local storedOres = BackpackService:GetStoredOres(player)
    local totalValue = self:CalculateValue(storedOres)

    if totalValue <= 0 then
        return false, 0, "Nothing to sell"
    end

    EconomyService:AddCurrency(player, "Coins", totalValue)
    BackpackService:ClearStorage(player)

    local totalPath = "Data.Economy.TotalCoinsEarned"
    local current = DataService:GetValue(player, totalPath) or 0
    DataService:SetValue(player, totalPath, current + totalValue)

    debugLog("[SellService] " .. player.Name .. " sold ores | +" .. totalValue .. " Coins")

    return true, totalValue, nil
end

return SellService
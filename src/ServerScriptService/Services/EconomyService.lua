--[[
    EconomyService
    
    Purpose:
    Manages currency logic and reward calculation.
    Does NOT own Coins or Gems storage — those live in the profile.
    
    Behaviour only:
    - Add/remove currency
    - Validate transactions
    - Calculate rewards
--]]

local EconomyService = {}

local ServerScriptService = game:GetService("ServerScriptService")
local DataService = require(ServerScriptService.Services.DataService)

local ECONOMY_PATH = "Data.Economy"

function EconomyService:Initialize()
end

function EconomyService:Start()
end

function EconomyService:Cleanup()
end

function EconomyService:GetCurrency(player, currencyType)
    if not DataService:IsProfileReady(player) then return 0 end
    local econ = DataService:GetValue(player, ECONOMY_PATH)
    if not econ then return 0 end
    return econ[currencyType] or 0
end

function EconomyService:AddCurrency(player, currencyType, amount)
    if not DataService:IsProfileReady(player) then return false end
    if amount <= 0 then return false end

    local econ = DataService:GetValue(player, ECONOMY_PATH)
    if not econ then return false end

    local current = econ[currencyType] or 0
    econ[currencyType] = current + amount

    local totalKey = "Total" .. currencyType .. "Earned"
    if econ[totalKey] then
        econ[totalKey] = econ[totalKey] + amount
    end

    return true
end

function EconomyService:RemoveCurrency(player, currencyType, amount)
    if not DataService:IsProfileReady(player) then return false end
    if amount <= 0 then return false end

    local econ = DataService:GetValue(player, ECONOMY_PATH)
    if not econ then return false end

    local current = econ[currencyType] or 0
    if current < amount then return false end

    econ[currencyType] = current - amount
    return true
end

function EconomyService:HasCurrency(player, currencyType, amount)
    return self:GetCurrency(player, currencyType) >= amount
end

return EconomyService
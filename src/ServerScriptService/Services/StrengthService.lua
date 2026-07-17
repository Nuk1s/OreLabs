--[[
    StrengthService
    
    Purpose:
    Manages strength progression logic.
    Does NOT own the Strength value — that lives in the profile.
    Does NOT own equipment — EquipmentService handles that.
    
    Behaviour only:
    - Training logic with cooldown validation
    - Strength gain calculation from equipped equipment
    - Debug logging for training events
--]]

local StrengthService = {}

local ServerScriptService = game:GetService("ServerScriptService")
local DataService = require(ServerScriptService.Services.DataService)
local EquipmentService = require(ServerScriptService.Services.EquipmentService)

local STRENGTH_PATH = "Data.Strength"

local lastTrainingTime = {}

local function debugLog(message)
    local ok, DebugService = pcall(function()
        return require(ServerScriptService.Debug.DebugService)
    end)
    if ok and DebugService and DebugService.IsEnabled() then
        DebugService:Log(message, "INFO")
    end
end

function StrengthService:Initialize()
end

function StrengthService:Start()
end

function StrengthService:Cleanup()
    lastTrainingTime = {}
end

function StrengthService:GetStrength(player)
    if not DataService:IsProfileReady(player) then return 0 end
    return DataService:GetValue(player, STRENGTH_PATH) or 0
end

function StrengthService:AddStrength(player, amount)
    if not DataService:IsProfileReady(player) then return 0 end
    if amount <= 0 then return 0 end
    DataService:IncrementValue(player, STRENGTH_PATH, amount)
    return amount
end

function StrengthService:SetStrength(player, amount)
    if not DataService:IsProfileReady(player) then return false end
    if amount < 0 then return false end
    return DataService:SetValue(player, STRENGTH_PATH, amount)
end

function StrengthService:Train(player)
    if not DataService:IsProfileReady(player) then
        debugLog("[StrengthService] Training rejected: profile not ready - " .. player.Name)
        return false, 0
    end

    local equipmentId = EquipmentService:GetCurrentEquipment(player)
    if not equipmentId then
        debugLog("[StrengthService] Training rejected: no equipment - " .. player.Name)
        return false, 0
    end

    local equipment = EquipmentService:GetEquipmentData(equipmentId)
    if not equipment then
        debugLog("[StrengthService] Training rejected: invalid equipment " .. tostring(equipmentId))
        return false, 0
    end

    local now = tick()
    local lastTime = lastTrainingTime[player] or 0
    local elapsed = now - lastTime

    if elapsed < equipment.Cooldown then
        return false, 0
    end

    lastTrainingTime[player] = now

    local reward = equipment.StrengthReward
    local gained = self:AddStrength(player, reward)
    local currentStrength = self:GetStrength(player)

    debugLog("[StrengthService] " .. player.Name .. " trained with " .. equipment.Name .. " | +" .. gained .. " | Total: " .. currentStrength)

    return true, gained
end

return StrengthService
--[[
    MiningService
    
    Purpose:
    Manages ore mining mechanics with cooperative mining.
    Supports multiple players hitting the same ore.
    Rewards unlock at 33%, 66%, and 100% milestones.
--]]

local MiningService = {}

local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataService = require(ServerScriptService.Services.DataService)
local EquipmentService = require(ServerScriptService.Services.EquipmentService)
local BackpackService = require(ServerScriptService.Services.BackpackService)
local GameConfig = require(ReplicatedStorage.Config.GameConfig)

local oreStates = {}
local lastMiningTime = {}

local function debugLog(message)
    local ok, DebugService = pcall(function()
        return require(ServerScriptService.Debug.DebugService)
    end)
    if ok and DebugService and DebugService.IsEnabled() then
        DebugService:Log(message, "INFO")
    end
end

function MiningService:Initialize()
end

function MiningService:Start()
end

function MiningService:Cleanup()
    oreStates = {}
    lastMiningTime = {}
end

function MiningService:GetOreData(oreId)
    return GameConfig.Ores[oreId]
end

function MiningService:GetOreState(oreId)
    local oreData = self:GetOreData(oreId)
    if not oreData then return nil end

    if oreStates[oreId] == nil then
        oreStates[oreId] = {
            MaxHP = oreData.HP,
            CurrentHP = oreData.HP,
            Rewards = {
                ["33"] = false,
                ["66"] = false,
                ["100"] = false,
            },
        }
    end

    return oreStates[oreId]
end

function MiningService:ResetOre(oreId)
    local oreData = self:GetOreData(oreId)
    if not oreData then return end

    oreStates[oreId] = {
        MaxHP = oreData.HP,
        CurrentHP = oreData.HP,
        Rewards = {
            ["33"] = false,
            ["66"] = false,
            ["100"] = false,
        },
    }
end

function MiningService:CalculateDamage(player)
    if not DataService:IsProfileReady(player) then return 0 end

    local equipmentId = EquipmentService:GetCurrentEquipment(player)
    if not equipmentId then return 0 end

    local equipment = EquipmentService:GetEquipmentData(equipmentId)
    if not equipment then return 0 end

    return equipment.StrengthReward
end

function MiningService:MineOre(player, oreId)
    if not DataService:IsProfileReady(player) then
        return false, 0, "Profile not ready"
    end

    if BackpackService:IsFull(player) then
        return false, 0, "Backpack full"
    end

    local oreData = self:GetOreData(oreId)
    if not oreData then
        return false, 0, "Invalid ore"
    end

    local now = tick()
    local lastTime = lastMiningTime[player] or 0
    if now - lastTime < 0.2 then
        return false, 0, "Too fast"
    end
    lastMiningTime[player] = now

    local damage = self:CalculateDamage(player)
    local state = self:GetOreState(oreId)

    if not state then
        return false, 0, "Invalid ore state"
    end

    local newHP = state.CurrentHP - damage
    state.CurrentHP = math.max(0, newHP)

    local totalReward = 0
    local hpPercent = (state.CurrentHP / state.MaxHP) * 100

    if hpPercent <= 67 and not state.Rewards["33"] then
        state.Rewards["33"] = true
        totalReward = totalReward + math.floor(oreData.Value * 0.33)
    end

    if hpPercent <= 34 and not state.Rewards["66"] then
        state.Rewards["66"] = true
        totalReward = totalReward + math.floor(oreData.Value * 0.33)
    end

    if state.CurrentHP <= 0 and not state.Rewards["100"] then
        state.Rewards["100"] = true
        totalReward = totalReward + math.floor(oreData.Value * 0.34)

        task.delay(GameConfig.Mining.RespawnTime, function()
            self:ResetOre(oreId)
        end)
    end

    if totalReward > 0 then
        local added = BackpackService:AddOre(player, oreId)
        if not added then
            return false, 0, "Backpack full"
        end

        local statisticsPath = "Data.Statistics.TotalOresMined"
        DataService:IncrementValue(player, statisticsPath, 1)

        debugLog("[MiningService] " .. player.Name .. " mined " .. oreData.Name .. " | +" .. totalReward .. " ore")
    end

    return state.CurrentHP <= 0, totalReward, nil
end

function MiningService:GetOreInfo(oreId)
    local state = self:GetOreState(oreId)
    if not state then return nil end

    return {
        MaxHP = state.MaxHP,
        CurrentHP = state.CurrentHP,
        HPPercent = (state.CurrentHP / state.MaxHP) * 100,
    }
end

return MiningService
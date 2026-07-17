--[[
    DevCommandHandler
    
    Purpose:
    Handles debug commands from DevPanel.
    Only works in Studio.
--]]

local DevCommandHandler = {}

local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local DataService = require(ServerScriptService.Services.DataService)
local StrengthService = require(ServerScriptService.Services.StrengthService)
local EconomyService = require(ServerScriptService.Services.EconomyService)
local BackpackService = require(ServerScriptService.Services.BackpackService)
local EquipmentService = require(ServerScriptService.Services.EquipmentService)
local AreaService = require(ServerScriptService.Services.AreaService)
local MiningService = require(ServerScriptService.Services.MiningService)
local GameConfig = require(ReplicatedStorage.Config.GameConfig)

local devEvent = nil
local devConnection = nil

function DevCommandHandler:Initialize()
    devEvent = Instance.new("RemoteEvent")
    devEvent.Name = "DevCommand"
    devEvent.Parent = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Events")
end

function DevCommandHandler:Start()
    devConnection = devEvent.OnServerEvent:Connect(function(player, command, value)
        if not RunService:IsStudio() then return end

        if command == "strength" then
            StrengthService:AddStrength(player, value or 100)

        elseif command == "coins" then
            EconomyService:AddCurrency(player, "Coins", value or 100)

        elseif command == "clearbackpack" then
            BackpackService:ClearStorage(player)

        elseif command == "fillbackpack" then
            local capacity = BackpackService:GetCapacity(player)
            for i = 1, capacity do
                BackpackService:AddOre(player, "Stone")
            end

        elseif command == "respawnores" then
            MiningService:ResetOre("Stone")
            MiningService:ResetOre("Coal")
            MiningService:ResetOre("Copper")
            MiningService:ResetOre("Iron")
            MiningService:ResetOre("Gold")
            MiningService:ResetOre("Crystal")
            MiningService:ResetOre("Obsidian")

        elseif command == "unlockall" then
            local areas = {"Area1", "Area2", "Area3", "Area4", "Area5", "Area6", "Area7"}
            for _, areaId in ipairs(areas) do
                AreaService:EnterArea(player, areaId)
            end

        elseif command == "bestequipment" then
            for id, data in pairs(GameConfig.Equipment) do
                if not EquipmentService:IsOwned(player, id) then
                    local owned = EquipmentService:GetOwnedEquipment(player)
                    table.insert(owned, id)
                    DataService:SetValue(player, "Data.OwnedEquipment", owned)
                end
            end
            EquipmentService:Equip(player, "Tier7Dumbbell")

        elseif command == "bestbackpack" then
            for id, data in pairs(GameConfig.Backpacks) do
                if not BackpackService:IsOwned(player, id) then
                    local owned = BackpackService:GetOwnedBackpacks(player)
                    table.insert(owned, id)
                    DataService:SetValue(player, "Data.OwnedBackpacks", owned)
                end
            end
            BackpackService:Equip(player, "Tier7Backpack")

        elseif command == "resetprogress" then
            DataService:SetValue(player, "Data.Strength", 0)
            DataService:SetValue(player, "Data.Economy.Coins", 0)
            DataService:SetValue(player, "Data.OwnedEquipment", {"StarterDumbbell"})
            DataService:SetValue(player, "Data.CurrentEquipment", "StarterDumbbell")
            DataService:SetValue(player, "Data.OwnedBackpacks", {"StarterBackpack"})
            DataService:SetValue(player, "Data.CurrentBackpack", "StarterBackpack")
            DataService:SetValue(player, "Data.CurrentArea", "Area1")
            DataService:SetValue(player, "Data.UnlockedAreas", {"Area1"})
            BackpackService:ClearStorage(player)
        end
    end)
end

function DevCommandHandler:Cleanup()
    if devConnection then
        devConnection:Disconnect()
        devConnection = nil
    end
end

return DevCommandHandler
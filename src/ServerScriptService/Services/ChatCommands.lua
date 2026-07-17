--[[
    ChatCommands
    
    Purpose:
    Handles debug chat commands.
    Only works in Studio.
--]]

local ChatCommands = {}

local ServerScriptService = game:GetService("ServerScriptService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StrengthService = require(ServerScriptService.Services.StrengthService)
local EconomyService = require(ServerScriptService.Services.EconomyService)
local BackpackService = require(ServerScriptService.Services.BackpackService)
local EquipmentService = require(ServerScriptService.Services.EquipmentService)
local AreaService = require(ServerScriptService.Services.AreaService)
local MiningService = require(ServerScriptService.Services.MiningService)
local GameConfig = require(game:GetService("ReplicatedStorage").Config.GameConfig)

local chatConnection = nil

function ChatCommands:Initialize()
end

function ChatCommands:Start()
    chatConnection = Players.PlayerAdded:Connect(function(player)
        player.Chatted:Connect(function(message)
            if not RunService:IsStudio() then return end
            self:ProcessCommand(player, message)
        end)
    end)

    for _, player in ipairs(Players:GetPlayers()) do
        player.Chatted:Connect(function(message)
            if not RunService:IsStudio() then return end
            self:ProcessCommand(player, message)
        end)
    end
end

function ChatCommands:Cleanup()
    if chatConnection then
        chatConnection:Disconnect()
        chatConnection = nil
    end
end

function ChatCommands:ProcessCommand(player, message)
    local args = string.split(message, " ")
    local command = args[1]:lower()

    if command == "/coins" then
        local amount = tonumber(args[2]) or 100000
        EconomyService:AddCurrency(player, "Coins", amount)

    elseif command == "/strength" then
        local amount = tonumber(args[2]) or 100000
        StrengthService:AddStrength(player, amount)

    elseif command == "/reset" then
        player:LoadCharacter()

    elseif command == "/fill" then
        local capacity = BackpackService:GetCapacity(player)
        for i = 1, capacity do
            BackpackService:AddOre(player, "Stone")
        end

    elseif command == "/ores" then
        MiningService:ResetOre("Stone")
        MiningService:ResetOre("Coal")
        MiningService:ResetOre("Copper")
        MiningService:ResetOre("Iron")
        MiningService:ResetOre("Gold")
        MiningService:ResetOre("Crystal")
        MiningService:ResetOre("Obsidian")

    elseif command == "/equipment" then
        if args[2] == "all" then
            for id, data in pairs(GameConfig.Equipment) do
                if not EquipmentService:IsOwned(player, id) then
                    local owned = EquipmentService:GetOwnedEquipment(player)
                    table.insert(owned, id)
                    DataService:SetValue(player, "Data.OwnedEquipment", owned)
                end
            end
            EquipmentService:Equip(player, "Tier7Dumbbell")
        end

    elseif command == "/backpack" then
        if args[2] == "max" then
            for id, data in pairs(GameConfig.Backpacks) do
                if not BackpackService:IsOwned(player, id) then
                    local owned = BackpackService:GetOwnedBackpacks(player)
                    table.insert(owned, id)
                    DataService:SetValue(player, "Data.OwnedBackpacks", owned)
                end
            end
            BackpackService:Equip(player, "Tier7Backpack")
        end
    end
end

return ChatCommands
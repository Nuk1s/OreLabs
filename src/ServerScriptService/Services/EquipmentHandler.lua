--[[
    EquipmentHandler
    
    Purpose:
    Handles equipment purchases via ProximityPrompt.
    Creates NPC with ProximityPrompt for equipment shop.
--]]

local EquipmentHandler = {}

local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local EquipmentService = require(ServerScriptService.Services.EquipmentService)
local ToolManager = require(ServerScriptService.Services.ToolManager)
local GameConfig = require(ReplicatedStorage.Config.GameConfig)

local EQUIPMENT_TOOLS = {
    Tier2Dumbbell = "Training Dumbbell",
    Tier3Dumbbell = "Training Dumbbell",
    Tier4Dumbbell = "Training Dumbbell",
    Tier5Dumbbell = "Training Dumbbell",
    Tier6Dumbbell = "Training Dumbbell",
    Tier7Dumbbell = "Training Dumbbell",
}

local function debugLog(message)
    local ok, DebugService = pcall(function()
        return require(ServerScriptService.Debug.DebugService)
    end)
    if ok and DebugService and DebugService.IsEnabled() then
        DebugService:Log(message, "INFO")
    end
end

function EquipmentHandler:Initialize()
end

function EquipmentHandler:Start()
    self:CreateShopNPC()
end

function EquipmentHandler:Cleanup()
end

function EquipmentHandler:CreateShopNPC()
    local shopZone = workspace:FindFirstChild("EquipmentShop")
    if not shopZone then return end

    local npc = Instance.new("Part")
    npc.Name = "EquipmentShopNPC"
    npc.Size = Vector3.new(2, 5, 2)
    npc.Position = shopZone.Position + Vector3.new(0, 3.5, 0)
    npc.Anchored = true
    npc.BrickColor = BrickColor.new("Bright purple")
    npc.Parent = shopZone

    local prompt = Instance.new("ProximityPrompt")
    prompt.ObjectText = "Equipment Merchant"
    prompt.ActionText = "Buy Equipment"
    prompt.HoldDuration = 0
    prompt.MaxActivationDistance = 10
    prompt.Parent = npc

    prompt.Triggered:Connect(function(player)
        self:OpenShop(player)
    end)
end

function EquipmentHandler:OpenShop(player)
    local currentEquipment = EquipmentService:GetCurrentEquipment(player)
    local currentTier = 1

    if currentEquipment then
        local data = EquipmentService:GetEquipmentData(currentEquipment)
        if data then
            currentTier = data.Tier
        end
    end

    local nextTier = currentTier + 1
    local nextEquipment = nil

    for id, data in pairs(GameConfig.Equipment) do
        if data.Tier == nextTier then
            nextEquipment = data
            break
        end
    end

    if not nextEquipment then
        return
    end

    local success, err = EquipmentService:Purchase(player, nextEquipment.Id)
    if success then
        debugLog("[EquipmentHandler] " .. player.Name .. " purchased " .. nextEquipment.Name)
    end
end

return EquipmentHandler
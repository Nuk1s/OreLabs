--[[
    EquipmentVisual
    
    Purpose:
    Handles displaying equipment on the player character.
    Creates temporary placeholder models for equipment.
--]]

local EquipmentVisual = {}

local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local DataService = require(ServerScriptService.Services.DataService)
local EquipmentService = require(ServerScriptService.Services.EquipmentService)
local GameConfig = require(ReplicatedStorage.Config.GameConfig)

local EQUIPMENT_COLORS = {
    StarterDumbbell = Color3.fromRGB(180, 180, 180),
    Tier2Dumbbell = Color3.fromRGB(120, 120, 120),
    Tier3Dumbbell = Color3.fromRGB(100, 100, 110),
    Tier4Dumbbell = Color3.fromRGB(200, 180, 50),
    Tier5Dumbbell = Color3.fromRGB(255, 215, 0),
    Tier6Dumbbell = Color3.fromRGB(0, 200, 255),
    Tier7Dumbbell = Color3.fromRGB(150, 0, 255),
}

local playerEquipmentParts = {}

function EquipmentVisual:Initialize()
end

function EquipmentVisual:Start()
    Players.PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function(character)
            task.wait(1)
            self:UpdateEquipmentVisual(player)
        end)
    end)

    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character then
            task.spawn(function()
                self:UpdateEquipmentVisual(player)
            end)
        end
    end
end

function EquipmentVisual:Cleanup()
    for player, parts in pairs(playerEquipmentParts) do
        for _, part in ipairs(parts) do
            if part and part.Parent then
                part:Destroy()
            end
        end
    end
    playerEquipmentParts = {}
end

function EquipmentVisual:UpdateEquipmentVisual(player)
    if not player.Character then return end

    if playerEquipmentParts[player] then
        for _, part in ipairs(playerEquipmentParts[player]) do
            if part and part.Parent then
                part:Destroy()
            end
        end
    end
    playerEquipmentParts[player] = {}

    local equipmentId = EquipmentService:GetCurrentEquipment(player)
    if not equipmentId then return end

    local equipData = EquipmentService:GetEquipmentData(equipmentId)
    if not equipData then return end

    local rightHand = player.Character:FindFirstChild("RightHand")
    if not rightHand then
        rightHand = player.Character:FindFirstChild("Right Arm")
    end

    if not rightHand then return end

    local color = EQUIPMENT_COLORS[equipmentId] or Color3.fromRGB(180, 180, 180)

    local dumbbell = Instance.new("Part")
    dumbbell.Name = "EquipmentVisual"
    dumbbell.Size = Vector3.new(0.3, 0.3, 1.2)
    dumbbell.BrickColor = BrickColor.new(color)
    dumbbell.Anchored = false
    dumbbell.CanCollide = false
    dumbbell.Parent = player.Character

    local weld = Instance.new("Weld")
    weld.Part0 = rightHand
    weld.Part1 = dumbbell
    weld.C0 = CFrame.new(0, -0.5, 0) * CFrame.Angles(0, 0, math.rad(90))
    weld.Parent = dumbbell

    table.insert(playerEquipmentParts[player], dumbbell)
end

function EquipmentVisual:RemoveEquipmentVisual(player)
    if playerEquipmentParts[player] then
        for _, part in ipairs(playerEquipmentParts[player]) do
            if part and part.Parent then
                part:Destroy()
            end
        end
        playerEquipmentParts[player] = nil
    end
end

return EquipmentVisual
--[[
    ToolManager
    
    Purpose:
    Manages giving players their starter tools.
    Creates Tools from templates and gives them on spawn.
--]]

local ToolManager = {}

local ServerScriptService = game:GetService("ServerScriptService")
local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local GameConfig = require(ReplicatedStorage.Config.GameConfig)

local toolTemplates = {}

function ToolManager:Initialize()
    self:CreateToolTemplates()
end

function ToolManager:Start()
    Players.PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function(character)
            task.wait(1)
            self:GiveStarterTools(player)
        end)
    end)

    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character then
            task.spawn(function()
                self:GiveStarterTools(player)
            end)
        end
    end
end

function ToolManager:Cleanup()
end

function ToolManager:CreateToolTemplates()
    local toolsFolder = Instance.new("Folder")
    toolsFolder.Name = "ToolTemplates"
    toolsFolder.Parent = ServerStorage

    local dumbbell = Instance.new("Tool")
    dumbbell.Name = "Training Dumbbell"
    dumbbell.RequiresHandle = true
    dumbbell.CanBeDropped = false
    dumbbell.ToolTip = "Train Strength"
    dumbbell.Parent = toolsFolder

    local dumbbellHandle = Instance.new("Part")
    dumbbellHandle.Name = "Handle"
    dumbbellHandle.Size = Vector3.new(1, 1, 3)
    dumbbellHandle.BrickColor = BrickColor.new("Bright red")
    dumbbellHandle.Parent = dumbbell

    local pickaxe = Instance.new("Tool")
    pickaxe.Name = "Stone Pickaxe"
    pickaxe.RequiresHandle = true
    pickaxe.CanBeDropped = false
    pickaxe.ToolTip = "Mine Ores"
    pickaxe.Parent = toolsFolder

    local pickaxeHandle = Instance.new("Part")
    pickaxeHandle.Name = "Handle"
    pickaxeHandle.Size = Vector3.new(1, 3, 1)
    pickaxeHandle.BrickColor = BrickColor.new("Dark stone grey")
    pickaxeHandle.Parent = pickaxe

    toolTemplates["Training Dumbbell"] = dumbbell
    toolTemplates["Stone Pickaxe"] = pickaxe
end

function ToolManager:GiveStarterTools(player)
    if not player.Character then return end

    local backpack = player:FindFirstChild("Backpack")
    if not backpack then return end

    for name, template in pairs(toolTemplates) do
        if not backpack:FindFirstChild(name) then
            local tool = template:Clone()
            tool.Parent = backpack
        end
    end
end

function ToolManager:GiveTool(player, toolName)
    if not player.Character then return end

    local backpack = player:FindFirstChild("Backpack")
    if not backpack then return end

    local template = toolTemplates[toolName]
    if not template then return end

    if not backpack:FindFirstChild(toolName) then
        local tool = template:Clone()
        tool.Parent = backpack
    end
end

function ToolManager:RemoveTool(player, toolName)
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        local tool = backpack:FindFirstChild(toolName)
        if tool then
            tool:Destroy()
        end
    end

    local character = player.Character
    if character then
        local tool = character:FindFirstChild(toolName)
        if tool then
            tool:Destroy()
        end
    end
end

return ToolManager
--[[
    TrainingHandler
    
    Purpose:
    Handles training when player activates the Training Dumbbell tool.
    Uses Tool.Activated event instead of RemoteEvents.
--]]

local TrainingHandler = {}

local ServerScriptService = game:GetService("ServerScriptService")
local Players = game:GetService("Players")
local StrengthService = require(ServerScriptService.Services.StrengthService)

local lastTrainingTime = {}
local COOLDOWN = 0.5

local function debugLog(message)
    local ok, DebugService = pcall(function()
        return require(ServerScriptService.Debug.DebugService)
    end)
    if ok and DebugService and DebugService.IsEnabled() then
        DebugService:Log(message, "INFO")
    end
end

function TrainingHandler:Initialize()
end

function TrainingHandler:Start()
    Players.PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function(character)
            task.wait(1)
            self:ConnectTool(player, character)
        end)
    end)

    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character then
            task.spawn(function()
                self:ConnectTool(player, player.Character)
            end)
        end
    end
end

function TrainingHandler:Cleanup()
    lastTrainingTime = {}
end

function TrainingHandler:ConnectTool(player, character)
    local backpack = player:FindFirstChild("Backpack")
    if not backpack then return end

    local tool = backpack:FindFirstChild("Training Dumbbell")
    if tool then
        tool.Activated:Connect(function()
            self:OnToolActivated(player)
        end)
    end

    character.ChildAdded:Connect(function(child)
        if child:IsA("Tool") and child.Name == "Training Dumbbell" then
            child.Activated:Connect(function()
                self:OnToolActivated(player)
            end)
        end
    end)
end

function TrainingHandler:OnToolActivated(player)
    local now = tick()
    local lastTime = lastTrainingTime[player] or 0

    if now - lastTime < COOLDOWN then
        return
    end

    lastTrainingTime[player] = now

    local success, gained = StrengthService:Train(player)
    if success and gained > 0 then
        debugLog("[TrainingHandler] " .. player.Name .. " trained | +" .. gained .. " | Total: " .. StrengthService:GetStrength(player))
    end
end

return TrainingHandler
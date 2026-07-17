--[[
    MiningHandler
    
    Purpose:
    Handles mining when player activates the Stone Pickaxe tool.
    Uses Tool.Activated event instead of RemoteEvents.
--]]

local MiningHandler = {}

local ServerScriptService = game:GetService("ServerScriptService")
local Players = game:GetService("Players")
local MiningService = require(ServerScriptService.Services.MiningService)

local lastMiningTime = {}
local COOLDOWN = 0.3

local function debugLog(message)
    local ok, DebugService = pcall(function()
        return require(ServerScriptService.Debug.DebugService)
    end)
    if ok and DebugService and DebugService.IsEnabled() then
        DebugService:Log(message, "INFO")
    end
end

function MiningHandler:Initialize()
end

function MiningHandler:Start()
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

function MiningHandler:Cleanup()
    lastMiningTime = {}
end

function MiningHandler:ConnectTool(player, character)
    local backpack = player:FindFirstChild("Backpack")
    if not backpack then return end

    local tool = backpack:FindFirstChild("Stone Pickaxe")
    if tool then
        tool.Activated:Connect(function()
            self:OnToolActivated(player)
        end)
    end

    character.ChildAdded:Connect(function(child)
        if child:IsA("Tool") and child.Name == "Stone Pickaxe" then
            child.Activated:Connect(function()
                self:OnToolActivated(player)
            end)
        end
    end)
end

function MiningHandler:OnToolActivated(player)
    local now = tick()
    local lastTime = lastMiningTime[player] or 0

    if now - lastTime < COOLDOWN then
        return
    end

    lastMiningTime[player] = now

    local character = player.Character
    if not character then return end

    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end

    local closestOre = nil
    local closestDistance = 10

    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Part") and obj.Name == "Stone" or obj.Name == "Coal" or obj.Name == "Copper" or obj.Name == "Iron" or obj.Name == "Gold" then
            local distance = (obj.Position - humanoidRootPart.Position).Magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestOre = obj
            end
        end
    end

    if closestOre then
        local success, reward, err = MiningService:MineOre(player, closestOre.Name)
        if success and reward > 0 then
            debugLog("[MiningHandler] " .. player.Name .. " mined " .. closestOre.Name .. " | +" .. reward)
        end
    end
end

return MiningHandler
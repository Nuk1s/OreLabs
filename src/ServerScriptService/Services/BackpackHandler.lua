--[[
    BackpackHandler
    
    Purpose:
    Handles backpack purchases via ProximityPrompt.
    Creates NPC with ProximityPrompt for backpack shop.
--]]

local BackpackHandler = {}

local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BackpackService = require(ServerScriptService.Services.BackpackService)
local GameConfig = require(ReplicatedStorage.Config.GameConfig)

local function debugLog(message)
    local ok, DebugService = pcall(function()
        return require(ServerScriptService.Debug.DebugService)
    end)
    if ok and DebugService and DebugService.IsEnabled() then
        DebugService:Log(message, "INFO")
    end
end

function BackpackHandler:Initialize()
end

function BackpackHandler:Start()
    self:CreateShopNPC()
end

function BackpackHandler:Cleanup()
end

function BackpackHandler:CreateShopNPC()
    local shopZone = workspace:FindFirstChild("BackpackShop")
    if not shopZone then return end

    local npc = Instance.new("Part")
    npc.Name = "BackpackShopNPC"
    npc.Size = Vector3.new(2, 5, 2)
    npc.Position = shopZone.Position + Vector3.new(0, 3.5, 0)
    npc.Anchored = true
    npc.BrickColor = BrickColor.new("Bright teal")
    npc.Parent = shopZone

    local prompt = Instance.new("ProximityPrompt")
    prompt.ObjectText = "Backpack Merchant"
    prompt.ActionText = "Buy Backpack"
    prompt.HoldDuration = 0
    prompt.MaxActivationDistance = 10
    prompt.Parent = npc

    prompt.Triggered:Connect(function(player)
        self:OpenShop(player)
    end)
end

function BackpackHandler:OpenShop(player)
    local currentBackpack = BackpackService:GetCurrentBackpack(player)
    local currentTier = 1

    if currentBackpack then
        local data = BackpackService:GetBackpackData(currentBackpack)
        if data then
            currentTier = data.Tier
        end
    end

    local nextTier = currentTier + 1
    local nextBackpack = nil

    for id, data in pairs(GameConfig.Backpacks) do
        if data.Tier == nextTier then
            nextBackpack = data
            break
        end
    end

    if not nextBackpack then
        return
    end

    local success, err = BackpackService:Purchase(player, nextBackpack.Id)
    if success then
        debugLog("[BackpackHandler] " .. player.Name .. " purchased " .. nextBackpack.Name)
    end
end

return BackpackHandler
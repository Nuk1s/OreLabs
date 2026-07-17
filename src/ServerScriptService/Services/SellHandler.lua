--[[
    SellHandler
    
    Purpose:
    Handles selling ores via ProximityPrompt.
    Creates NPC with ProximityPrompt for selling.
--]]

local SellHandler = {}

local ServerScriptService = game:GetService("ServerScriptService")
local Players = game:GetService("Players")
local SellService = require(ServerScriptService.Services.SellService)

local function debugLog(message)
    local ok, DebugService = pcall(function()
        return require(ServerScriptService.Debug.DebugService)
    end)
    if ok and DebugService and DebugService.IsEnabled() then
        DebugService:Log(message, "INFO")
    end
end

function SellHandler:Initialize()
end

function SellHandler:Start()
    self:CreateSellNPC()
end

function SellHandler:Cleanup()
end

function SellHandler:CreateSellNPC()
    local sellZone = workspace:FindFirstChild("SellZone")
    if not sellZone then return end

    local npc = Instance.new("Part")
    npc.Name = "SellNPC"
    npc.Size = Vector3.new(2, 5, 2)
    npc.Position = sellZone.Position + Vector3.new(0, 3.5, 0)
    npc.Anchored = true
    npc.BrickColor = BrickColor.new("Bright yellow")
    npc.Parent = sellZone

    local prompt = Instance.new("ProximityPrompt")
    prompt.ObjectText = "Ore Buyer"
    prompt.ActionText = "Sell Ores"
    prompt.HoldDuration = 0
    prompt.MaxActivationDistance = 10
    prompt.Parent = npc

    prompt.Triggered:Connect(function(player)
        local success, value, err = SellService:SellAll(player)
        if success then
            debugLog("[SellHandler] " .. player.Name .. " sold ores | +" .. value .. " Coins")
        end
    end)
end

return SellHandler
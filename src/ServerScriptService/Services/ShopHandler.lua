--[[
    ShopHandler
    
    Purpose:
    Handles shop interactions via RemoteEvents.
    Provides buy/sell functionality with proper feedback.
--]]

local ShopHandler = {}

local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local DataService = require(ServerScriptService.Services.DataService)
local EquipmentService = require(ServerScriptService.Services.EquipmentService)
local BackpackService = require(ServerScriptService.Services.BackpackService)
local SellService = require(ServerScriptService.Services.SellService)
local StrengthService = require(ServerScriptService.Services.StrengthService)
local GameConfig = require(ReplicatedStorage.Config.GameConfig)

local buyEquipEvent = nil
local buyBpEvent = nil
local sellEvent = nil
local shopConnections = {}

local function debugLog(message)
    local ok, DebugService = pcall(function()
        return require(ServerScriptService.Debug.DebugService)
    end)
    if ok and DebugService and DebugService.IsEnabled() then
        DebugService:Log(message, "INFO")
    end
end

function ShopHandler:Initialize()
    buyEquipEvent = Instance.new("RemoteEvent")
    buyEquipEvent.Name = "BuyEquipment"
    buyEquipEvent.Parent = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Events")

    buyBpEvent = Instance.new("RemoteEvent")
    buyBpEvent.Name = "BuyBackpack"
    buyBpEvent.Parent = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Events")

    sellEvent = Instance.new("RemoteEvent")
    sellEvent.Name = "SellOres"
    sellEvent.Parent = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Events")
end

function ShopHandler:Start()
    shopConnections[#shopConnections + 1] = buyEquipEvent.OnServerEvent:Connect(function(player, equipmentId)
        if type(equipmentId) ~= "string" then return end

        local success, err = EquipmentService:Purchase(player, equipmentId)
        buyEquipEvent:FireClient(player, "PurchaseResult", {
            success = success,
            item = equipmentId,
            error = err,
            type = "equipment",
        })

        if success then
            debugLog("[ShopHandler] " .. player.Name .. " purchased equipment: " .. equipmentId)
        end
    end)

    shopConnections[#shopConnections + 1] = buyBpEvent.OnServerEvent:Connect(function(player, backpackId)
        if type(backpackId) ~= "string" then return end

        local success, err = BackpackService:Purchase(player, backpackId)
        buyBpEvent:FireClient(player, "PurchaseResult", {
            success = success,
            item = backpackId,
            error = err,
            type = "backpack",
        })

        if success then
            debugLog("[ShopHandler] " .. player.Name .. " purchased backpack: " .. backpackId)
        end
    end)

    shopConnections[#shopConnections + 1] = sellEvent.OnServerEvent:Connect(function(player)
        local success, value, err = SellService:SellAll(player)
        sellEvent:FireClient(player, "SellResult", {
            success = success,
            value = value or 0,
            error = err,
        })

        if success then
            debugLog("[ShopHandler] " .. player.Name .. " sold ores | +" .. value .. " Coins")
        end
    end)
end

function ShopHandler:Cleanup()
    for _, conn in ipairs(shopConnections) do
        if conn then conn:Disconnect() end
    end
    shopConnections = {}
end

return ShopHandler
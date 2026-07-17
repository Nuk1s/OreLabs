--[[
    GameController
    
    Purpose:
    Client-side game controller.
    Handles shop interactions and area transitions.
    Training and mining now use Tool.Activated.
--]]

local GameController = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local remotes = nil

local function getRemote(name)
    if not remotes then
        remotes = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Events")
    end
    return remotes:WaitForChild(name)
end

function GameController:Initialize()
end

function GameController:Start()
    local buyEquipEvent = getRemote("BuyEquipment")
    local buyBpEvent = getRemote("BuyBackpack")
    local sellEvent = getRemote("SellOres")

    buyEquipEvent.OnClientEvent:Connect(function(eventName, data)
        if eventName == "PurchaseResult" then
            if data.success then
                print("[Shop] Purchased: " .. tostring(data.item))
            else
                print("[Shop] Failed: " .. tostring(data.error))
            end
        end
    end)

    buyBpEvent.OnClientEvent:Connect(function(eventName, data)
        if eventName == "PurchaseResult" then
            if data.success then
                print("[Shop] Purchased: " .. tostring(data.item))
            else
                print("[Shop] Failed: " .. tostring(data.error))
            end
        end
    end)

    sellEvent.OnClientEvent:Connect(function(eventName, data)
        if eventName == "SellResult" then
            if data.success then
                print("[Shop] Sold ores: +" .. tostring(data.value) .. " Coins")
            else
                print("[Shop] Nothing to sell")
            end
        end
    end)
end

function GameController:Cleanup()
end

return GameController
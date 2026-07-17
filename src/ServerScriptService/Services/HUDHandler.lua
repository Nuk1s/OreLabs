--[[
    HUDHandler
    
    Purpose:
    Sends HUD data to clients on request.
    
    Lifecycle:
    - Initialize: Set up remote events
    - Start: Begin listening
    - Cleanup: Disconnect events
--]]

local HUDHandler = {}

local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HUDService = require(ServerScriptService.Services.HUDService)

local hudEvent = nil
local hudConnection = nil

function HUDHandler:Initialize()
    hudEvent = Instance.new("RemoteEvent")
    hudEvent.Name = "UpdateHUD"
    hudEvent.Parent = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Events")
end

function HUDHandler:Start()
    hudConnection = hudEvent.OnServerEvent:Connect(function(player)
        local data = HUDService:GetHUDData(player)
        if data then
            hudEvent:FireClient(player, "HUDData", data)
        end
    end)
end

function HUDHandler:Cleanup()
    if hudConnection then
        hudConnection:Disconnect()
        hudConnection = nil
    end
end

return HUDHandler
--[[
    AreaHandler
    
    Purpose:
    Handles area transition requests from clients.
    
    Lifecycle:
    - Initialize: Set up remote events
    - Start: Begin listening
    - Cleanup: Disconnect events
--]]

local AreaHandler = {}

local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AreaService = require(ServerScriptService.Services.AreaService)

local enterEvent = nil
local enterConnection = nil

function AreaHandler:Initialize()
    enterEvent = Instance.new("RemoteEvent")
    enterEvent.Name = "EnterArea"
    enterEvent.Parent = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Events")
end

function AreaHandler:Start()
    enterConnection = enterEvent.OnServerEvent:Connect(function(player, areaId)
        if type(areaId) ~= "string" then return end

        local success, err = AreaService:EnterArea(player, areaId)
        enterEvent:FireClient(player, "AreaResult", {
            success = success,
            area = areaId,
            error = err,
        })
    end)
end

function AreaHandler:Cleanup()
    if enterConnection then
        enterConnection:Disconnect()
        enterConnection = nil
    end
end

return AreaHandler
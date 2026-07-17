--[[
    OreInfoHandler
    
    Purpose:
    Handles ore info requests from clients.
    Returns ore HP data for display.
--]]

local OreInfoHandler = {}

local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MiningService = require(ServerScriptService.Services.MiningService)

local oreInfoEvent = nil
local oreInfoConnection = nil

function OreInfoHandler:Initialize()
    oreInfoEvent = Instance.new("RemoteEvent")
    oreInfoEvent.Name = "GetOreInfo"
    oreInfoEvent.Parent = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Events")
end

function OreInfoHandler:Start()
    oreInfoConnection = oreInfoEvent.OnServerEvent:Connect(function(player, oreId)
        if type(oreId) ~= "string" then return end

        local info = MiningService:GetOreInfo(oreId)
        if info then
            oreInfoEvent:FireClient(player, "OreInfo", {
                oreId = oreId,
                MaxHP = info.MaxHP,
                CurrentHP = info.CurrentHP,
                HPPercent = info.HPPercent,
            })
        end
    end)
end

function OreInfoHandler:Cleanup()
    if oreInfoConnection then
        oreInfoConnection:Disconnect()
        oreInfoConnection = nil
    end
end

return OreInfoHandler
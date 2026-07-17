--[[
    WorldService
    
    Purpose:
    Manages world progression logic.
    Does NOT own world state — current world and unlocks live in the profile.
    
    Behaviour only:
    - Get/set current world
    - Check world access
    - Validate world transitions
--]]

local WorldService = {}

local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataService = require(ServerScriptService.Services.DataService)
local GameConfig = require(ReplicatedStorage.Config.GameConfig)

local WORLD_PATH = "Data.World"

function WorldService:Initialize()
end

function WorldService:Start()
end

function WorldService:Cleanup()
end

function WorldService:GetCurrentWorld(player)
    if not DataService:IsProfileReady(player) then return "World1" end
    local world = DataService:GetValue(player, WORLD_PATH)
    if not world then return "World1" end
    return world.CurrentWorld or "World1"
end

function WorldService:SetCurrentWorld(player, worldId)
    if not DataService:IsProfileReady(player) then return false end
    if not GameConfig.Worlds[worldId] then return false end

    local world = DataService:GetValue(player, WORLD_PATH)
    if not world then return false end

    world.CurrentWorld = worldId
    return true
end

function WorldService:CanAccessWorld(player, worldId)
    if not GameConfig.Worlds[worldId] then return false end
    return true
end

return WorldService
--[[
    PlayerService
    
    Purpose:
    Manages player connections and profile readiness.
    Tracks active players and notifies other services when profiles are ready.
    
    Responsibility:
    - Track connected players
    - Delegate profile creation to DataService
    - Wait for profile validation before marking ready
    - Fire ProfileReady event when safe to access
    - Clean up on player leave
    
    Lifecycle:
    - Initialize: Prepare internal state
    - Start: Bind PlayerAdded and PlayerRemoving events
    - Cleanup: Disconnect events, clear active players
--]]

local PlayerService = {}

local Players = game:GetService("Players")
local ServerScriptService = game:GetService("ServerScriptService")

local DataService = require(ServerScriptService.Services.DataService)
local InternalEvents = require(ServerScriptService.Core.InternalEvents)

local activePlayers = {}
local addedConnection = nil
local removingConnection = nil

local function debugLog(message)
    local DebugService = nil
    pcall(function()
        DebugService = require(ServerScriptService.Debug.DebugService)
    end)
    if DebugService then
        DebugService:Log(message, "INFO")
    end
end

local function onPlayerAdded(player)
    debugLog("[PlayerService] PlayerAdded: " .. player.Name)

    local profile = DataService:CreateProfile(player)
    if not profile then
        warn("[PlayerService] Failed to create profile for " .. player.Name)
        return
    end

    activePlayers[player] = {
        ProfileReady = true,
    }

    debugLog("[PlayerService] Profile Created: " .. player.Name .. " (UserId: " .. player.UserId .. ")")

    DataService:MarkReady(player)

    debugLog("[PlayerService] Profile Ready: " .. player.Name)

    InternalEvents:Fire("ProfileReady", player, profile)
end

local function onPlayerRemoving(player)
    debugLog("[PlayerService] PlayerRemoving: " .. player.Name)

    activePlayers[player] = nil

    DataService:ReleaseProfile(player)

    debugLog("[PlayerService] Profile Released: " .. player.Name)
end

function PlayerService:Initialize()
end

function PlayerService:Start()
    addedConnection = Players.PlayerAdded:Connect(onPlayerAdded)
    removingConnection = Players.PlayerRemoving:Connect(onPlayerRemoving)

    for _, player in ipairs(Players:GetPlayers()) do
        task.spawn(function()
            onPlayerAdded(player)
        end)
    end
end

function PlayerService:Cleanup()
    if addedConnection then
        addedConnection:Disconnect()
        addedConnection = nil
    end

    if removingConnection then
        removingConnection:Disconnect()
        removingConnection = nil
    end

    activePlayers = {}
end

function PlayerService:GetActivePlayers()
    return activePlayers
end

function PlayerService:PlayerExists(player)
    return activePlayers[player] ~= nil
end

function PlayerService:GetPlayerCount()
    local count = 0
    for _ in pairs(activePlayers) do
        count = count + 1
    end
    return count
end

return PlayerService
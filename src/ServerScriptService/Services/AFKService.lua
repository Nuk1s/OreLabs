---
id: AFKService
title: AFKService
status: Active
version: 1.0
owner: OreLabs
category: Service
depends_on:
  - DataService
  - PlayerService
  - StrengthService
  - MiningService
last_updated: 2026-07-09
---

--[[
    AFKService
    
    Purpose:
    Manages AFK behaviour and auto-training logic.
    Does NOT own AFK state — that lives in the profile.
    
    Behaviour only:
    - Start/stop auto train
    - Validate AFK state
--]]

local AFKService = {}

local ServerScriptService = game:GetService("ServerScriptService")
local DataService = require(ServerScriptService.Services.DataService)

local AFK_PATH = "Data.AFK"

function AFKService:Initialize()
end

function AFKService:Start()
end

function AFKService:Cleanup()
end

function AFKService:GetAFKState(player)
    if not DataService:IsProfileReady(player) then return { Active = false, Type = nil } end
    return DataService:GetValue(player, AFK_PATH) or { Active = false, Type = nil }
end

function AFKService:StartAutoTrain(player)
    if not DataService:IsProfileReady(player) then return false end
    local afk = DataService:GetValue(player, AFK_PATH)
    if not afk then return false end
    afk.Active = true
    afk.Type = "Training"
    afk.StartTime = os.time()
    return true
end

function AFKService:StopAutoTrain(player)
    if not DataService:IsProfileReady(player) then return false end
    local afk = DataService:GetValue(player, AFK_PATH)
    if not afk then return false end
    afk.Active = false
    afk.Type = nil
    afk.StartTime = nil
    return true
end

return AFKService